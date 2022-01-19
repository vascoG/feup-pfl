:- ensure_loaded(move).
:- ensure_loaded(gameover).
:- use_module(library(random)).



choose_move(GameState, 1, Move):-
    valid_moves(GameState, Moves),
    random_select(Move, Moves, _).


choose_move(GameState, 2, Move):-
    current_player(GameState, Player),
    valid_moves(GameState, Moves),
    setof(Value-Mv, NewGameState^(member(Mv,Moves),move(GameState, Mv, NewGameState), value(NewGameState, Player, Value)), [_V-Move|_]).



%possible_next_game_state(+GameState, +Player, -GameState)
possible_next_game_state(gamestate(Board,Turn,I-J), Player, gamestate(NewBoard, Turn1,I-J)):-
    Turn1 is Turn +1,
    update_board(Board, I, J, Player, NewBoard).



%erro: o pc so deve avaliar consoante a ultima jogada e nao o tabuleiro todo

%current_player(+GameState, -Player)
current_player(gamestate(_,Turn,_),Player):-
    Turn1 is (Turn rem 2), 
    player_turn(Turn1, Player).

%value(+GameState, +Player, -Value)
value(GameState, Player, 0):-
    game_over(GameState, Player), !.

value(GameState, Player, 1):-
    opponent(Player, Opponent),
    possible_next_game_state(GameState, Opponent, OpponentGameState),
    game_over(OpponentGameState, Opponent),!.

value(GameState, Player, 2):-
    consecutive_cubes(GameState, Player, 3),!.

value(GameState, Player, 3):-
    opponent(Player, Opponent),
    possible_next_game_state(GameState, Opponent, OpponentGameState),
    consecutive_cubes(OpponentGameState, Opponent, 3),!.

value(GameState, Player, 4):-
    consecutive_cubes(GameState, Player, 2),!.

value(GameState, Player, 5):-
    opponent(Player, Opponent),
    possible_next_game_state(GameState, Opponent, OpponentGameState),
    consecutive_cubes(OpponentGameState, Opponent, 2),!.

value(_,_,6).



%consecutive_cubes(+GameState, +Player, +N)
consecutive_cubes(gamestate(Board,_,_),Player,3):-
    append(_, [L|_], Board),
    append(_, [Player,Player,Player|_], L).  

consecutive_cubes(gamestate(Board,_,_),Player,3):-
    append(_, [C1,C2,C3|_], Board),
    append(Before1, [Player|_], C1),
    append(Before2, [Player|_], C2),
    append(Before3, [Player|_], C3),
    length(Before1, M), 
    length(Before2, M),
    length(Before3, M).

consecutive_cubes(gamestate(Board,_,_),Player,3):-
    append(_, [C1,C2,C3|_], Board),
    append(Before1, [Player|_], C1),
    append(Before2, [Player|_], C2),
    append(Before3, [Player|_], C3),
    length(Before1, M1), 
    length(Before2, M2),
    length(Before3, M3),
    M2 is M1-1, M3 is M2-1.


consecutive_cubes(gamestate(Board,_,_),Player,3):-
    append(_, [C1,C2,C3|_], Board),
    append(Before1, [Player|_], C1),
    append(Before2, [Player|_], C2),
    append(Before3, [Player|_], C3),
    length(Before1, M1), 
    length(Before2, M2),
    length(Before3, M3),
    M2 is M1+1, M3 is M2+1.

consecutive_cubes(gamestate(Board,_,_),Player,2):-
    append(_, [L|_], Board),
    append(_, [Player,Player|_], L).  

consecutive_cubes(gamestate(Board,_,_),Player,2):-
    append(_, [C1,C2|_], Board),
    append(Before1, [Player|_], C1),
    append(Before2, [Player|_], C2),
    length(Before1, M), 
    length(Before2, M).

consecutive_cubes(gamestate(Board,_,_),Player,2):-
    append(_, [C1,C2|_], Board),
    append(Before1, [Player|_], C1),
    append(Before2, [Player|_], C2),
    length(Before1, M1), 
    length(Before2, M2),
    M2 is M1-1.

consecutive_cubes(gamestate(Board,_,_),Player,2):-
    append(_, [C1,C2|_], Board),
    append(Before1, [Player|_], C1),
    append(Before2, [Player|_], C2),
    length(Before1, M1), 
    length(Before2, M2),
    M2 is M1+1.


%opponent(+Player, -Opponent)
opponent(1,2).
opponent(2,1).