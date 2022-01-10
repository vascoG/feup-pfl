:- ensure_loaded(move).


%game_over(+GameState, -Winner)
game_over(gamestate(Board, Turn, _), Winner):-
    Turn1 is (Turn rem 2),
    player_last_turn(Turn1, LastPlayer),
    game_over_horizontal(gamestate(Board, Turn, _), LastPlayer, Winner), !. 

game_over(gamestate(Board, Turn, _), Winner):-
    Turn1 is (Turn rem 2),
    player_last_turn(Turn1, LastPlayer),
    game_over_vertical(gamestate(Board, Turn, _), LastPlayer, Winner), !.  

game_over(gamestate(Board, Turn, _), Winner):-
    Turn1 is (Turn rem 2),
    player_last_turn(Turn1, LastPlayer),
    game_over_diagonal1(gamestate(Board, Turn, _), LastPlayer, Winner), !.   

game_over(gamestate(Board, Turn, _), Winner):-
    Turn1 is (Turn rem 2),
    player_last_turn(Turn1, LastPlayer),
    game_over_diagonal2(gamestate(Board, Turn, _), LastPlayer, Winner), !.   
    

game_over(GameState, Winner):-
    \+(has_valid_moves(GameState)),
    Winner is 0.

%game_over_horizontal(+GameState, +LastPlayer, -Winner) - _
game_over_horizontal(gamestate(Board, _, _), LastPlayer, LastPlayer):-
    append(_, [L|_], Board),
    append(_, [LastPlayer,LastPlayer,LastPlayer,LastPlayer|_], L).    

%game_over_vertical(+GameState, +LastPlayer, -Winner) - |
game_over_vertical(gamestate(Board, _, _), LastPlayer, LastPlayer):-
    append(_, [C1,C2,C3,C4|_], Board),
    append(Before1, [LastPlayer|_], C1),
    append(Before2, [LastPlayer|_], C2),
    append(Before3, [LastPlayer|_], C3),
    append(Before4, [LastPlayer|_], C4),
    length(Before1, M), 
    length(Before2, M),
    length(Before3, M),
    length(Before4, M).

%game_over_diagonal1(+GameState, +LastPlayer, -Winner) - /
game_over_diagonal1(gamestate(Board, _, _), LastPlayer, LastPlayer):-
    append(_, [C1,C2,C3,C4|_], Board),
    append(Before1, [LastPlayer|_], C1),
    append(Before2, [LastPlayer|_], C2),
    append(Before3, [LastPlayer|_], C3),
    append(Before4, [LastPlayer|_], C4),
    length(Before1, M1), 
    length(Before2, M2),
    length(Before3, M3),
    length(Before4, M4),
    M2 is M1-1, M3 is M2-1, M4 is M3-1.

%game_over_diagonal2(+GameState, +LastPlayer, -Winner) - \
game_over_diagonal2(gamestate(Board, _, _), LastPlayer, LastPlayer):-
    append(_, [C1,C2,C3,C4|_], Board),
    append(Before1, [LastPlayer|_], C1),
    append(Before2, [LastPlayer|_], C2),
    append(Before3, [LastPlayer|_], C3),
    append(Before4, [LastPlayer|_], C4),
    length(Before1, M1), 
    length(Before2, M2),
    length(Before3, M3),
    length(Before4, M4),
    M2 is M1+1, M3 is M2+1, M4 is M3+1.