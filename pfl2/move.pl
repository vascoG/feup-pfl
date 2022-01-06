:- ensure_loaded(board).

/**
* Game state is represented by the structure gamestate(Board, Turn, I-J), where -(I,J)
* represents the last cube placed by opponent.
*/

%move(+GameState, +Move, -NewGameState)
move(gamestate(Board,Turn,I-J), MoveI-MoveJ, gamestate(NewBoard,NewTurn, MoveI-MoveJ)):-
    length(Board, Size), %Obter tamanho do tabuleiro e verificar se a jogada está dentro do tabuleiro
    MoveI >= 0,
    MoveJ >= 0,
    MoveI < Size,
    MoveJ < Size,
    is_adjacent(MoveI-MoveJ, I-J), %Verificar se a jogada é adjacente à última jogada
    board(Board, MoveI-MoveJ, 0),  %Verificar se a célula está vazia.
    Turn1 is (Turn rem 2), 
    player_turn(Turn1, Player),
    update_board(Board,MoveI,MoveJ,Player, NewBoard),  %Atualiza o tabuleiro
    NewTurn is Turn+1.


%is_adjacent(+I1-J1,+I2-J2)
is_adjacent(_, nan-nan):- !.

is_adjacent(I1-J1,I2-J2):- 
    J1 is J2+1,
    I1 is I2+1, !.
is_adjacent(I1-J1,I2-J2):-
    J1 is J2-1,
    I1 is I2-1, !.
is_adjacent(I1-J1,I2-J2):-
    J1 is J2+1,
    I1 is I2-1, !.
is_adjacent(I1-J1,I2-J2):-
    J1 is J2-1,
    I1 is I2+1, !.
is_adjacent(I1-J1,I2-J1):-
    I1 is I2+1, !.
is_adjacent(I1-J1,I2-J1):-
    I1 is I2-1, !.
is_adjacent(I1-J1,I1-J2):-
    J1 is J2+1, !.
is_adjacent(I1-J1,I1-J2):-
    J1 is J2-1.

%player_turn(+Turn, -Player)
player_turn(0, 2).
player_turn(1, 1).