#include <assert.h>
#include <stdio.h>
#include <stdbool.h>
#include <stdarg.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/stat.h>
#include <sys/types.h>

#ifdef __WIN32__
#	include <io.h>
#	include <fcntl.h>
#	include <process.h>
#	include <windows.h>
#	define pipe(x) _pipe(x, 512, _O_BINARY)
#else
#	include <sys/wait.h>
#	include <sys/time.h>
#	include <sys/resource.h>
#	include <signal.h>
#endif

#ifdef __APPLE__
#	include <limits.h>
#	include <sandbox.h>
#endif

#include "mcp_state.h"


static struct player {
	FILE *pipe_downstream;
	FILE *pipe_upstream;
#ifdef __WIN32__
	HANDLE process;
#else
	volatile pid_t pid;
#endif
	volatile bool soft_timeout_reached;
	volatile bool hard_timeout_reached;
} players[2];

static unsigned volatile current_player = 0;


#ifndef __WIN32__  /* no resource limits on Windows */

static struct rlimit cpu_limit = { RLIM_INFINITY, RLIM_INFINITY };
static struct rlimit mem_limit = { RLIM_INFINITY, RLIM_INFINITY };

/* Specify seconds = RLIM_INFINITY to disarm timer. */
static void set_timer(rlim_t seconds)
{
	struct itimerval t = {
		.it_interval = {0, 0},
		.it_value    = {
			.tv_sec = (seconds == RLIM_INFINITY) ? 0 : (time_t)seconds,
			.tv_usec = 0
		}
	};
	if (setitimer(ITIMER_REAL, &t, NULL) < 0)
		abort();
}

static void alarm_handler(int signum)
{
	assert(signum == SIGALRM);

	struct player *player = &players[current_player];

	if (!player->soft_timeout_reached) {
		fprintf(stderr, "[MCP] soft timeout reached\n");
		player->soft_timeout_reached = true;
		kill(player->pid, SIGXCPU);
		set_timer(cpu_limit.rlim_max == RLIM_INFINITY ? RLIM_INFINITY :
		          cpu_limit.rlim_max - cpu_limit.rlim_cur);
	} else {
		fprintf(stderr, "[MCP] hard timeout reached\n");
		player->hard_timeout_reached = true;
		kill(player->pid, SIGKILL);
	}
}

#endif


static bool fork_player(const char *executable, struct player *player)
{
	enum { READ = 0, WRITE = 1 };

	struct stat statbuf;
	int pipe_up[2];
	int pipe_down[2];

#ifdef __WIN32__
	/* reserve communication file descriptors by duplicating stdout to them */
	_dup2(_fileno(stdout), DOWNSTREAM);
	_dup2(_fileno(stdout), UPSTREAM);
#endif

	if (stat(executable, &statbuf) != 0)
		return false;
	if (pipe(pipe_up) != 0)
		return false;
	if (pipe(pipe_down) != 0)
		return false;

#ifdef __WIN32__
	/* copy pipe ends to the position the child expects them at */
	if (_dup2(pipe_down[READ], DOWNSTREAM) != 0)
		return false;
	if (_dup2(pipe_up[WRITE], UPSTREAM) != 0)
		return false;

	player->process = (HANDLE)_spawnl(P_NOWAIT, executable, executable, NULL);
	if (!player->process || player->process == INVALID_HANDLE_VALUE)
		return false;

	/* locally close the copies now inherited by the child */
	close(DOWNSTREAM);
	close(UPSTREAM);
#else
	if ((player->pid = fork()) < 0)
		return false;

	if (player->pid == 0) {
		/* Child */

		close(pipe_up[READ]);
		close(pipe_down[WRITE]);

		dup2(pipe_down[READ], DOWNSTREAM);
		dup2(pipe_up[WRITE], UPSTREAM);

		// CPU limit enforced with wallclock timer
		// setrlimit(RLIMIT_CPU, &cpu_limit);
		setrlimit(RLIMIT_AS, &mem_limit);
		setrlimit(RLIMIT_DATA, &mem_limit);

#ifdef SEATBELT
		if (getenv("APP_SANDBOX_CONTAINER_ID") == NULL) {
			/* protect with Seatbelt in case some clever hacker student
			 * submits a "funny" solution ;) */
			static const char profile_template[] =
				"(version 1)\n"
				"(deny default)\n"
				"(debug deny)\n"
				"(allow file-read-metadata)\n"
				"(allow file-read-data)\n"
				"(allow sysctl-read)\n"
				"(allow file-write-data file-ioctl (literal \"/dev/dtracehelper\"))\n"
				"(allow process-exec (literal \"%s\"))\n";
			char profile[sizeof(profile_template) + PATH_MAX];
			char *executable_abspath = realpath(executable, NULL);
			char *error;

			snprintf(profile, sizeof(profile), profile_template, executable_abspath);
			if (sandbox_init(profile, 0, &error) != 0)
				return false;
			free(executable_abspath);
		}
#endif
		execl(executable, executable, 0);
		return false;
	} else {
		/* Parent */

		/* Stop the player until it is his turn. */
		if (kill(player->pid, SIGSTOP) < 0)
			return false;
	}
#endif

	/* Close useless ends of pipes */
	close(pipe_down[READ]);
	close(pipe_up[WRITE]);

	player->pipe_downstream = fdopen(pipe_down[WRITE], "w");
	player->pipe_upstream = fdopen(pipe_up[READ], "r");

	return true;
}

static game_move_t *player_move(struct player *player, game_state_t *state)
{
	game_move_t *move;
	bool status;

	player->hard_timeout_reached = false;
	player->soft_timeout_reached = false;

#ifndef __WIN32__
	set_timer(cpu_limit.rlim_cur);
	if (kill(player->pid, SIGCONT) < 0)
		return NULL;
#endif

	status = serialize_state(player->pipe_downstream, current_player, state);
	if (!status || player->hard_timeout_reached)
		return NULL;

	move = deserialize_move(player->pipe_upstream);
	if (!move || player->hard_timeout_reached)
		return NULL;

#ifndef __WIN32__
	set_timer(RLIM_INFINITY);
	if (kill(player->pid, SIGSTOP) < 0)
		return NULL;
#endif

	return move;
}

static void print_usage(void)
{
#ifdef __WIN32__
	fprintf(stderr, "Usage: mcp player1 player2\n");
#else
	fprintf(stderr,
			"Usage: mcp [-t soft-player-time] [-m soft-player-mem]\n"
			"           [-T hard-player-time] [-M hard-player-mem]\n"
			"           player1 player2\n"
			" player-time - CPU time per turn in seconds\n"
			" player-mem  - Memory limit per player in megabytes\n");
#endif
}

static void end_of_line(void)
{
	fprintf(stderr, "\nEnd of Line.\n");
}


int main(int argc, char **argv)
{
	game_state_t *game;
	int opt, winner;

	fprintf(stderr, "Master Control Program\n\n");
	atexit(end_of_line);

	while ((opt = getopt(argc, argv, "t:T:m:M:")) != -1) {
		switch (opt) {
#ifndef __WIN32__
			case 't': cpu_limit.rlim_cur = strtoul(optarg, NULL, 0); break;
			case 'T': cpu_limit.rlim_max = strtoul(optarg, NULL, 0); break;
			case 'm': mem_limit.rlim_cur = strtoul(optarg, NULL, 0) << 20; break;
			case 'M': mem_limit.rlim_max = strtoul(optarg, NULL, 0) << 20; break;
#endif
			case '?': print_usage(); return 0;
		}
	}

	if (optind + 2 > argc)
		print_usage();

#ifndef __WIN32__
	if (cpu_limit.rlim_cur > cpu_limit.rlim_max)
		cpu_limit.rlim_cur = cpu_limit.rlim_max - 1;
	if (mem_limit.rlim_cur > mem_limit.rlim_max)
		mem_limit.rlim_cur = mem_limit.rlim_max - 1;

	/* Ignore SIGPIPE. Accessing dead pipes now returns EPIPE. */
	struct sigaction pact = {
		.sa_handler = SIG_IGN
	};
	if (sigaction(SIGPIPE, &pact, NULL) != 0)
		abort();

	/* Handle SIGALRM. */
	struct sigaction aact = {
		.sa_handler = alarm_handler,
		.sa_flags = SA_SIGINFO | SA_RESTART
	};
	if (sigaction(SIGALRM, &aact, NULL) != 0)
		abort();
#endif

	if (!fork_player(argv[optind], &players[0]) ||
		!fork_player(argv[optind + 1], &players[1])) {
		fprintf(stderr, "[MCP] Unable to fork players.\n");
		exit(1);
	}

	game = start_game();

	while (!is_final_state(current_player, game, &winner)) {
		game_move_t *move;

		fprintf(stderr, "[MCP] Player %u's turn...\n", current_player);

		move = player_move(&players[current_player], game);
		if (!move) {
			fprintf(stderr, "[MCP] Player %u did not move.\n", current_player);
			winner = !current_player;
			break;
		}

		fprintf(stderr, "[MCP] received move: '%s'\n", dump_move(move));

		if (!apply_move(current_player, game, move)) {
			fprintf(stderr, "[MCP] Player %u made an invalid move.\n", current_player);
			winner = !current_player;
			break;
		}

		fprintf(stderr, "[MCP] Player %u moved.\n", current_player);
		fflush(stdout);

		current_player = !current_player;
	}

	fflush(stdout);
	if (winner < 0)
		fprintf(stderr, "[MCP] The game ended in a draw.\n");
	else
		fprintf(stderr, "[MCP] Player %u wins.\n", winner);
	fprintf(stderr, "[MCP] Final game state:\n");
	serialize_state(stdout, current_player, game);

	for (size_t i = 0; i < 2; i++) {
#ifndef __APPLE__
		/* FIXME: On Darwin, closing the pipes seems to cause the following
		 * SIGKILL to get lost. Sometimes. I guess the SIGPIPE and the SIGKILL
		 * interact in the kernel, causing XNU to forget the SIGKILL.
		 * Filed with Apple as rdar://problem/9201885 */
		fclose(players[i].pipe_downstream);
		fclose(players[i].pipe_upstream);
#endif
#ifdef __WIN32__
		TerminateProcess(players[i].process, 0);
		WaitForSingleObject(players[i].process, INFINITE);
#else
		int status;
		kill(players[i].pid, SIGKILL);
		waitpid(players[i].pid, &status, 0);
#endif
	}

	return 0;
}
