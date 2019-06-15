#include <stdio.h>
#include <cmath>
#include <vector>
#include <iostream>

class Position;
class AIMove;

std::vector<Position> board;
int millPossibilities[][3] = {{0, 1, 2}, {3, 4, 5}, {6, 7, 8}, {9, 10, 11}, {12, 13, 14}, {15, 16, 17}, {18, 19, 20}, {21, 22, 23}, {0, 9, 21}, {1, 4, 7}, {2, 14, 23}, {3, 10, 18},
							{5, 13, 20}, {6, 11, 15}, {8, 12, 17}, {16, 19, 22}};

int threeConfigMills[][5] = {{0, 1, 2, 9, 21}, {21, 22, 23, 9, 0}, {23, 22, 21, 14, 2}, {2, 1, 0, 14, 23}, {3, 4, 5, 10, 18}, {5, 4, 3, 13, 20}, {20, 13, 5, 19, 18}, {18, 19, 20, 10, 3},
								{6, 7, 8, 11, 15}, {15, 11, 6, 16, 17}, {8, 7, 6, 12, 17}, {17, 12, 8, 16, 15}, {4, 1, 7, 3, 5}, {7, 4, 1, 6, 8}, {1, 0, 2, 4, 7}, {9, 0, 21, 10, 11},
								{10, 9, 11, 3, 18}, {11, 10, 9, 6, 15}, {12, 8, 17, 13, 14}, {13, 12, 14, 5, 20}, {14, 13, 12, 2, 23}, {16, 15, 17, 19, 22}, {19, 16, 22, 18, 20}, {22, 21, 23, 19, 16}};
char myPlayer = ' ';
char enemyPlayer = ' ';
int playerNumber = 0;
int enemyNumber = 0;

class Position
{
public:
	Position(int i, char a);
	int getLocation();
	void setScore(int i);
	int getScore();
	void setPlayerObject(char c);
	char getPlayerObject();
	char getName();
	int amountOfRelations();
	std::vector<Position> getPackedRelations();

	Position *right = NULL;
	Position *left = NULL;
	Position *up = NULL;
	Position *down = NULL;

private:
	int location;
	char PlayerObject = ' ';
	char positionName;
	int score;
};

Position::Position(int i, char a)
{
	location = i;
	positionName = a;
}

std::vector<Position> Position::getPackedRelations()
{
	std::vector<Position> relations;
	if(right != NULL) relations.push_back(*right);
	if(left != NULL) relations.push_back(*left);
	if(up != NULL) relations.push_back(*up);
	if(down != NULL) relations.push_back(*down);
	return relations;
}

int Position::amountOfRelations()
{
	int i = 0;
	if(right != NULL) i++;
	if(left != NULL) i++;
	if(up != NULL) i++;
	if(down != NULL) i++;
	return i;
}

int Position::getLocation()
{
	return location;
}

void Position::setScore(int i)
{
	score = i;
}

int Position::getScore()
{
	return score;
}

void Position::setPlayerObject(char c)
{
	PlayerObject = c;
}

char Position::getPlayerObject()
{
	return PlayerObject;
}

char Position::getName()
{
	return positionName;
}

class AIMove
{
public:
	int score;
	int x;
	int y;
	AIMove(int s);
};

AIMove::AIMove(int s)
{
	score = s;
}

void initPosition()
{
	for (char i = 'A'; i <= 'X'; ++i)
	{
		board.push_back(Position((int(i)-65), i));
	}

	//jeder Position Verbindungen/Relationen zuweisen
	
	//obersten drei punkte
	board[0].right = &board[1]; board[0].down = &board[9]; board[0].setScore(2);
	board[1].left = &board[0]; board[1].right = &board[2]; board[1].down = &board[4]; board[1].setScore(3);
	board[2].left = &board[1]; board[2].down = &board[14]; board[2].setScore(2);

	//Punkte in 2. Reihe
	board[3].right = &board[4]; board[3].down = &board[10]; board[3].setScore(2);
	board[4].up = &board[1]; board[4].left = &board[3]; board[4].right = &board[5]; board[4].down = &board[7]; board[4].setScore(4);
	board[5].left = &board[4]; board[5].down = &board[13]; board[5].setScore(2);

	//Punkte 3. Reihe
	board[6].right = &board[7]; board[6].down = &board[11]; board[6].setScore(2);
	board[7].left = &board[6]; board[7].right = &board[8]; board[7].up = &board[4]; board[7].setScore(3);
	board[8].left = &board[7]; board[8].down = &board[12]; board[8].setScore(2);

	//mittlere Reihe
	board[9].up = &board[0]; board[9].down = &board[21]; board[9].right = &board[10]; board[8].setScore(3);
	board[10].up = &board[3]; board[10].left = &board[9]; board[10].right = &board[11]; board[10].down = &board[18]; board[9].setScore(4);
	board[11].up = &board[6]; board[11].down = &board[15]; board[11].left = &board[10]; board[11].setScore(3);
	board[12].up = &board[8]; board[12].down = &board[17]; board[12].right = &board[13]; board[12].setScore(3);
	board[13].up = &board[5]; board[13].left = &board[12]; board[13].right = &board[14]; board[13].down = &board[20]; board[13].setScore(4);
	board[14].up = &board[2]; board[14].down = &board[23]; board[14].left = &board[13]; board[14].setScore(3);

	//Punkte 5. Reihe
	board[15].up = &board[11]; board[15].right = &board[16]; board[15].setScore(2);
	board[16].down = &board[19]; board[16].left = &board[15]; board[16].right = &board[17]; board[16].setScore(3);
	board[17].up = &board[12]; board[17].left = &board[16]; board[17].setScore(2);

	//Punkte 6. Reihe
	board[18].up = &board[10]; board[18].right = &board[19]; board[18].setScore(2);
	board[19].down = &board[22]; board[19].left = &board[18]; board[19].right = &board[20]; board[19].up = &board[16]; board[19].setScore(3);
	board[20].up = &board[13]; board[20].left = &board[19]; board[20].setScore(2);

	//Punkte 7. Reihe
	board[21].up = &board[9]; board[21].right = &board[22]; board[21].setScore(2);
	board[22].up = &board[19]; board[22].left = &board[21]; board[22].right = &board[23]; board[22].setScore(3);
	board[23].up = &board[14]; board[23].left = &board[22]; board[23].setScore(2);
}

bool checkForMill(char player, Position *pos){
	if(pos->getPlayerObject() == player){
		for(unsigned int i = 0; i < (sizeof(millPossibilities)/sizeof(*millPossibilities)); i++){
			for(int j = 0; j < 3; j++){
				if(millPossibilities[i][j] == pos->getLocation()){
					if((board[millPossibilities[i][(j+1)%3]].getPlayerObject() == pos->getPlayerObject()) && (board[millPossibilities[i][(j+2)%3]].getPlayerObject() == pos->getPlayerObject())) return true;
				}
			}
		}
	}
	return false;
}

char checkVictory(){

	int enemy_pieces = 0;
	int player_pieces = 0;
	for(unsigned int i = 0; i < board.size(); i++)
	{
		if(board[i].getPlayerObject() == myPlayer) player_pieces++;
		else if(board[i].getPlayerObject() == enemyPlayer) enemy_pieces++;
	}
	if(enemy_pieces < 3 && player_pieces > 3) return myPlayer;
	else if(enemy_pieces > 3 && player_pieces < 3) return enemyPlayer;

	return ' ';
}

bool xConfigMill(int mode, char player, int position){
	int countPlayerPieces = 0;
	int countEnemyPieces = 0;
	if(mode==2 || mode == 1){ //use this for finding 2 config mills or a way to block a enemy mill
		for(unsigned int i = 0; i < (sizeof(millPossibilities)/sizeof(*millPossibilities)); i++){
			countPlayerPieces = 0;
			countEnemyPieces = 0;
			for(int j = 0; j < 3; j++){
				if(millPossibilities[i][j] == position){
					for(int x = 0; x < 3; x++){
						if(board[millPossibilities[i][j]].getPlayerObject() == player) countPlayerPieces++;
						else if(mode == 1){
							if(board[millPossibilities[i][j]].getPlayerObject() == '.') countEnemyPieces++;
						}
						else if(mode == 2){
							if(board[millPossibilities[i][j]].getPlayerObject() != '.') countEnemyPieces++;
						}
					}
					break;
				}
			}
			if(countPlayerPieces == 2 && countEnemyPieces == 1) return true;
		}
	}
	else if(mode == 3){ //use this for finding 3 config mills
		for(unsigned int i = 0; i < (sizeof(threeConfigMills)/sizeof(*threeConfigMills)); i++){
			for(int j = 0; j < 5; j++){
				if(threeConfigMills[i][j] == position){
					for(int x = 0; x < 5; x++){
						if(board[threeConfigMills[i][0]].getPlayerObject() == player){
							if((board[threeConfigMills[i][1]].getPlayerObject() == player && board[threeConfigMills[i][2]].getPlayerObject() == '.') ^ (board[threeConfigMills[i][2]].getPlayerObject() == player && board[threeConfigMills[i][1]].getPlayerObject() == '.')){
								if((board[threeConfigMills[i][3]].getPlayerObject() == player && board[threeConfigMills[i][4]].getPlayerObject() == '.') ^ (board[threeConfigMills[i][4]].getPlayerObject() == player && board[threeConfigMills[i][3]].getPlayerObject() == '.')) return true;
							}
						}
					}
					break;
				}
			}
		}
	}
	return false;
}

int evaluationOfBoard(int unplaced_pieces){
	float sum = 0;
	char winner = checkVictory();
	int singleStoneCoeff = 1;
	int blockedMillCoeff = 1;

	//if in phase 1 --> choose other values for evaluation (cause of strategy and stuff)
	if(unplaced_pieces == 0){
		singleStoneCoeff = 5;
		blockedMillCoeff = 10;
	}

	for(unsigned int y = 0; y < board.size(); y++){

		//evaluate position of every piece
		if(board[y].getPlayerObject() == myPlayer) sum += (board[y].amountOfRelations()*singleStoneCoeff);
		else if(board[y].getPlayerObject() == enemyPlayer) sum -= (board[y].amountOfRelations()*singleStoneCoeff);

		//evaluate possbile blocked enemy mills
		if(xConfigMill(1, myPlayer, y)) sum += (0.5*blockedMillCoeff);
		else if(xConfigMill(1, enemyPlayer, y)) sum -= (0.5*blockedMillCoeff);

		//evaluate almost finished mills (2 pieces)
		if(xConfigMill(2, myPlayer, y)) sum += 0.5;
		else if(xConfigMill(2, enemyPlayer, y)) sum -= 0.5;

		//evaluate 3 config mills (2 ways to finish mill -> zwickmühle) 
		if(xConfigMill(3, myPlayer, y)) sum += 5;
		else if(xConfigMill(3, enemyPlayer, y)) sum -= 5;

		//evaluate mills
		if(checkForMill(myPlayer, &board[y])) sum += (1/3);
		else if(checkForMill(enemyPlayer, &board[y])) sum -= (1/3);
	}
	//evaluate possible win
	if(unplaced_pieces == 0){
		if(winner == myPlayer) sum += 99999;
		else if(winner == enemyPlayer) sum -= 99999;
	}
	return int(std::round(sum));
}

int bestPieceToKill(char player, int unplaced_pieces){
	int score = -999;
	int old_score;
	int bestRemove = -1;
	for(unsigned int i = 0; i < board.size(); i++){
		if(board[i].getPlayerObject() == player){
			if(checkForMill(player, &board[i]) == false){
				board[i].setPlayerObject('.');
				old_score = score;
				score = std::max(score, evaluationOfBoard(unplaced_pieces));
				if(player == myPlayer) board[i].setPlayerObject(myPlayer);
				else if(player == enemyPlayer) board[i].setPlayerObject(enemyPlayer);
				if(score > old_score) bestRemove = i;
			}
		}
	}
	if(bestRemove > -1) return bestRemove;
	else{ return 404;}
}

AIMove alphabeta(unsigned int unplaced_pieces[], int alpha, int beta, int currentPlayer, int depth)
{
	int phase;
	AIMove move(0);
	int removed;

	//determine in which phase we are
	if(unplaced_pieces[currentPlayer] > 0) phase = 1;
	else if(unplaced_pieces[currentPlayer] == 0){
		int countPieces = 0;
		for(unsigned int a = 0; a < board.size(); a++){
			if(currentPlayer == playerNumber){
				if(board[a].getPlayerObject() == myPlayer) countPieces++;
			}
			else{
				if(board[a].getPlayerObject() == enemyPlayer) countPieces++;
			}
		}
		if(countPieces <= 3) phase = 3;
		else{ phase = 2;}
	}

	if(currentPlayer == playerNumber) move.score = alpha;
	else if(currentPlayer == enemyNumber) move.score = beta;

	if(depth <= 0)
	{
		move.score = evaluationOfBoard(unplaced_pieces[currentPlayer]);
		return move;
	}
	else if(phase == 1){
		if(currentPlayer == playerNumber){
			//maximizing part
			for(unsigned int i = 0; i < board.size(); i++)
			{
				if(board[i].getPlayerObject() == '.'){
					board[i].setPlayerObject(myPlayer);
					unplaced_pieces[currentPlayer] = unplaced_pieces[currentPlayer] - 1;

					if(checkForMill(myPlayer, &board[i])) {
						removed = bestPieceToKill(enemyPlayer, unplaced_pieces[playerNumber]);
						if(removed != 404){
							board[removed].setPlayerObject('.');
							alpha = std::max(alpha, alphabeta(unplaced_pieces, alpha, beta, enemyNumber, depth-1).score);
							if(alpha > move.score){
								move.score = alpha;
								move.y = i;
							}
							board[removed].setPlayerObject(enemyPlayer);
						}
					}
					else{
						alpha = std::max(alpha, alphabeta(unplaced_pieces, alpha, beta, enemyNumber, depth-1).score);
						if(alpha > move.score){
							move.score = alpha;
							move.y = i;
						}
					}
					
					board[i].setPlayerObject('.');
					unplaced_pieces[currentPlayer] = unplaced_pieces[currentPlayer] + 1;
					if(alpha>=beta) break;
				}
			}
			return move;
		}
		else if(currentPlayer == enemyNumber){
			//minimizing part
			for(unsigned int i = 0; i < board.size(); i++)
			{
				if(board[i].getPlayerObject() == '.'){

					board[i].setPlayerObject(enemyPlayer);
					unplaced_pieces[currentPlayer] = unplaced_pieces[currentPlayer] - 1;

					if(checkForMill(myPlayer, &board[i])) {
						removed = bestPieceToKill(myPlayer, unplaced_pieces[enemyNumber]);
						if(removed != 404){
							board[removed].setPlayerObject('.');
							beta = std::min(beta, alphabeta(unplaced_pieces, alpha, beta, playerNumber, depth-1).score);
							if(beta < move.score){
								move.score = beta;
								move.y = i;
							}
							board[removed].setPlayerObject(myPlayer);
						}
					}
					else{
						beta = std::min(beta, alphabeta(unplaced_pieces, alpha, beta, playerNumber, depth-1).score);
						if(beta < move.score){
							move.score = beta;
							move.y = i;
						}
					}
					board[i].setPlayerObject('.');
					unplaced_pieces[currentPlayer] = unplaced_pieces[currentPlayer] + 1;
					if(alpha>=beta) break;
				}
			}
			return move;
		}
	}
	else if(phase == 2){
		if(currentPlayer == playerNumber){
			//maximizing part
			for(unsigned int i = 0; i < board.size(); i++)
			{
				if(board[i].getPlayerObject() == myPlayer){
					std::vector<Position> relations = board[i].getPackedRelations();
					for(unsigned int j = 0; j < relations.size(); j++){
						if(relations[j].getPlayerObject() == '.'){

							board[i].setPlayerObject('.');
							board[relations[j].getLocation()].setPlayerObject(myPlayer);

							if(checkForMill(myPlayer, &board[relations[j].getLocation()])) {
								removed = bestPieceToKill(enemyPlayer, 0);
								if(removed != 404){
									board[removed].setPlayerObject('.');
									alpha = std::max(alpha, alphabeta(unplaced_pieces, alpha, beta, enemyNumber, depth-1).score);
									if(alpha > move.score){
										move.score = alpha;
										move.x = i;
										move.y = relations[j].getLocation();
									}
									board[removed].setPlayerObject(enemyPlayer);
								}
							}
							else{
								alpha = std::max(alpha, alphabeta(unplaced_pieces, alpha, beta, enemyNumber, depth-1).score);
								if(alpha > move.score){
									move.score = alpha;
									move.x = i;
									move.y = relations[j].getLocation();
								}
							}
							
							board[i].setPlayerObject(myPlayer);
							board[relations[j].getLocation()].setPlayerObject('.');
						}
					}
					if(alpha>=beta) break;
				}
			}
			return move;
		}
		else if(currentPlayer == enemyNumber){
			//minimizing part
			for(unsigned int i = 0; i < board.size(); i++)
			{
				if(board[i].getPlayerObject() == enemyPlayer){
					std::vector<Position> relations = board[i].getPackedRelations();
					for(unsigned int j = 0; j < relations.size(); j++){
						if(relations[j].getPlayerObject() == '.'){

							board[i].setPlayerObject('.');
							board[relations[j].getLocation()].setPlayerObject(enemyPlayer);

							if(checkForMill(enemyPlayer, &board[relations[j].getLocation()])) {
								removed = bestPieceToKill(myPlayer, 0);
								if(removed != 404){
									board[removed].setPlayerObject('.');
									beta = std::min(beta, alphabeta(unplaced_pieces, alpha, beta, playerNumber, depth-1).score);
									if(beta < move.score){
										move.score = beta;
										move.x = i;
										move.y = relations[j].getLocation();
									}
									board[removed].setPlayerObject(myPlayer);
								}
							}
							else{
								beta = std::min(beta, alphabeta(unplaced_pieces, alpha, beta, playerNumber, depth-1).score);
								if(beta < move.score){
									move.score = beta;
									move.x = i;
									move.y = relations[j].getLocation();
								}
							}
							
							board[i].setPlayerObject(enemyPlayer);
							board[relations[j].getLocation()].setPlayerObject('.');
						}
					}
					if(alpha>=beta) break;
				}
			}
			return move;
		}
	}
	else if(phase == 3){
		if(currentPlayer == playerNumber){
			//maximizing part
			for(unsigned int i = 0; i < board.size(); i++)
			{
				if(board[i].getPlayerObject() == myPlayer){
					for(unsigned int j = 0; j < board.size(); j++){
						if(board[j].getPlayerObject() == '.'){

							board[i].setPlayerObject('.');
							board[j].setPlayerObject(myPlayer);

							if(checkForMill(myPlayer, &board[j])) {
								removed = bestPieceToKill(enemyPlayer, 0);
								if(removed != 404){
									board[removed].setPlayerObject('.');
									alpha = std::max(alpha, alphabeta(unplaced_pieces, alpha, beta, enemyNumber, depth-1).score);
									if(alpha > move.score){
										move.score = alpha;
										move.x = i;
										move.y = j;
									}
									board[removed].setPlayerObject(enemyPlayer);
								}
							}
							else{
								alpha = std::max(alpha, alphabeta(unplaced_pieces, alpha, beta, enemyNumber, depth-1).score);
								if(alpha > move.score){
									move.score = alpha;
									move.x = i;
									move.y = j;
								}
							}
							
							board[i].setPlayerObject(myPlayer);
							board[j].setPlayerObject('.');
						}
					}
					if(alpha>=beta) break;
				}
			}
			return move;
		}
		else if(currentPlayer == enemyNumber){
			//minimizing part
			for(unsigned int i = 0; i < board.size(); i++)
			{
				if(board[i].getPlayerObject() == enemyPlayer){
					for(unsigned int j = 0; j < board.size(); j++){
						if(board[j].getPlayerObject() == '.'){

							board[i].setPlayerObject('.');
							board[j].setPlayerObject(enemyPlayer);

							if(checkForMill(enemyPlayer, &board[j])) {
								removed = bestPieceToKill(myPlayer, 0);
								if(removed != 404){
									board[removed].setPlayerObject('.');
									beta = std::min(beta, alphabeta(unplaced_pieces, alpha, beta, playerNumber, depth-1).score);
									if(beta < move.score){
										move.score = beta;
										move.x = i;
										move.y = j;
									}
									board[removed].setPlayerObject(myPlayer);
								}
							}
							else{
								beta = std::min(beta, alphabeta(unplaced_pieces, alpha, beta, playerNumber, depth-1).score);
								if(beta < move.score){
									move.score = beta;
									move.x = i;
									move.y = j;
								}
							}
							
							board[i].setPlayerObject(enemyPlayer);
							board[j].setPlayerObject('.');
						}
					}
					if(alpha>=beta) break;
				}
			}
			return move;
		}
	}
	return move;
}

int main()
{
	int removedPiece;
	int countMyPieces;
	int countEnemies;
	int limiter;
	/* current game state is delivered via file descriptor 3 */
	FILE *state_input = fdopen(3, "r");
	/* we output our move via file descriptor 4 */
	FILE *move_output = fdopen(4, "w");

	if (!state_input || !move_output) {
		fprintf(stderr, "error accessing file descriptors\n");
		exit(1);
	}

	//only first time | not in while loop
	initPosition();


	while(1)
	{
		unsigned current_player;
		unsigned unplaced_pieces[2];
		char mcpBoard[24];
		char piece_move, piece_put, piece_kill;
		char newline;
		int matches;
		removedPiece = 404;
		AIMove move(0);
		countMyPieces = 0;
		countEnemies = 0;
		limiter = 4;

		/* First, read the current game state, given as two lines of text. */

		/* The first line contains three decimal numbers: the current player
		 * number (0 or 1) and the number of pieces not yet placed on the board
		 * for both players. */
		matches = fscanf(state_input, "%u %u %u%c", &current_player,
						 &unplaced_pieces[0], &unplaced_pieces[1], &newline);
		if (matches != 4) {
			fprintf(stderr, "error while reading the game state\n");
			break;
		}

		/* The next line has 24 characters, one for each place on the board,
		 * starting in the top left. Each of these characters is either a .,
		 * a 0 or a 1, showing that the place is free or occupied by the
		 * respective player. */
		matches = fscanf(state_input, "%24c%c", mcpBoard, &newline);
		if (matches != 2) {
			fprintf(stderr, "error while reading the board state\n");
			break;
		}

		// initializing board --> putting pieces on positions
		for(int i = 0; i < 24; i++)
		{
			if(mcpBoard[i] == '0'){
				board[i].setPlayerObject('X');
			}
			else if(mcpBoard[i] == '1'){
				board[i].setPlayerObject('O');
			}
			else board[i].setPlayerObject('.');
		}

		//find a good depth limiter
		for(unsigned int x = 0; x < board.size(); x++){
			if(board[x].getPlayerObject() == myPlayer) countMyPieces++;
			else if(board[x].getPlayerObject() == enemyPlayer) countEnemies++;
		}
		if(unplaced_pieces[current_player] > 0) limiter = 6;
		else if((countMyPieces <= 3) || (countEnemies <= 3)) limiter = 4;
		else if((countMyPieces < 5) || (countEnemies < 5)) limiter = 6;
		else { limiter = 8;}
		
		
		

		if(current_player == 0)
		{
			myPlayer = 'X';
			enemyPlayer = 'O';
			playerNumber = 0;
			enemyNumber = 1;
		}
		else {
			myPlayer = 'O';
			enemyPlayer = 'X';
			playerNumber = 1;
			enemyNumber = 0;
		}

		/* Unless we have unplaced pieces, ask which piece to move. --> mode will be selected automatically */
		move = alphabeta(unplaced_pieces, -999999999, 999999999, playerNumber, limiter);
		if (unplaced_pieces[current_player] > 0) {
			piece_move = ' ';
			piece_put = board[move.y].getName();
			board[move.y].setPlayerObject(myPlayer);
		} else {
			piece_move = board[move.x].getName();
			piece_put = board[move.y].getName();
			board[move.x].setPlayerObject('.');
			board[move.y].setPlayerObject(myPlayer);
		}

		/* check function return for NULL --> enter nothing, else enter return-value */
		if(checkForMill(myPlayer, &board[move.y])){
			removedPiece = bestPieceToKill(enemyPlayer, 123456);
			if(removedPiece != 404){
				piece_kill = board[removedPiece].getName();
			}
			else{ piece_kill = ' ';}
		}
		else{
			piece_kill = ' ';
		}

		/* Output our move as three characters, followed by a newline.
		 * The first character specifies the piece to move or a space if an
		 * unplaced piece is used.
		 * The second character specifies the place to put the piece.
		 * The third character specifies an opponent's piece to remove, or a
		 * space if this is not appropriate. */
		fprintf(move_output, "%c%c%c\n", piece_move, piece_put, piece_kill);

		/* Flush the buffer so the MCP actually receives our move. */
		fflush(move_output);
	}

    return 0;
}

