#include <stdio.h>
#include <stdbool.h>

/* file descriptor numbers for MCP communication with players */
enum filedescriptors {
	DOWNSTREAM = 3,
	UPSTREAM = 4
};

/* opaque data structures for game state and move */
typedef struct game_state_s game_state_t;
typedef union game_move_u game_move_t;

game_state_t *start_game(void);
bool serialize_state(FILE *restrict out, unsigned current_player, const game_state_t *restrict game);
game_move_t *deserialize_move(FILE *restrict in);
const char *dump_move(const game_move_t *restrict move);
bool apply_move(unsigned current_player, game_state_t *restrict game, const game_move_t *restrict move);
bool is_final_state(unsigned current_player, game_state_t *restrict game, int *winning_player);
