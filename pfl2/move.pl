:- ensure_loaded(board).
:- use_module(library(between)).

/**
* Game state is represented by the structure gamestate(Board, Turn, I-J), where -(I,J)
* represents the last cube placed by opponent.
*/

%move(+GameState, +Move, -NewGameState)
move(gamestate(Board,Turn,I-J), MoveI-MoveJ, gamestate(NewBoard,NewTurn, MoveI-MoveJ)):-
    board_dimension(Size),
    between(0,Size, MoveI),
    between(0,Size, MoveJ),
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

%player_last_turn(+Turn, -Player)
player_last_turn(1, 2).
player_last_turn(0, 1).

%has_valid_moves(+GameState)
has_valid_moves(GameState):-
    !,
    move(GameState, _ ,_).

%valid_moves(+GameState, -ListOfMoves)
valid_moves(GameState,ListOfMoves):-
    findall(I-J, move(GameState, I-J ,_), ListOfMoves).
