:- ensure_loaded(move).
:- use_module(library(random)).



computer_move(GameState, 0, Move):-
    valid_moves(GameState, Moves),
    random_select(Move, Moves, _).