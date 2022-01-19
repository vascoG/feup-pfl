:- ensure_loaded(gameover).
:- ensure_loaded(interface).
:- ensure_loaded(computer).


%play
play:-
    menu.

%menu
menu:-
    repeat,
    display_menu,
    format('Option: ', []), read_digit_between(-1,3,Option),
    menu(Option), !.

%menu(+Option)

menu(0):-
    abort.

menu(1):-
    repeat,
    format('~nChoose the size of the board. The number of columns and lines must be between 4 and 9: ',[]),
    read_digit_between(3,10,Size),
    asserta(board_dimension(Size)),
    options, !.

options:- %%pc vs player, player vs pc
    repeat,
    display_play_options,
    format('Option: ', []), read_digit_between(-1,4,Option),
    play_options(Option), !.

%play_options(+Option)
play_options(0):-
    menu.

play_options(1):-
   play_game(h-h).

play_options(2):-
    format('Choose who starts the game: ',[]),
    format('~n0 - Human',[]),
    format('~n1 - Computer',[]),
    format('~nOption: ', []), read_digit_between(-1,2,Option),
    format('~nChoose the level of the computer(1-2)',[]),
    format('~nOption: ', []),read_digit_between(0,3,Level),
    play_human_computer(Option,Level).


%play_human_computer(+Option, +Level)
play_human_computer(0,Level):-
    play_game(h+0-c+Level).

play_human_computer(1,Level):-
    play_game(c+Level-h+0).

%play_game(+P1-P2)
play_game(P1+L1-P2+L2):-
    board_dimension(Size),
    initial_state(Size, GameState),
    display_game(GameState),
    play_loop(GameState, P1+L1-P2+L2).

%play_loop(+GameState, +Player)
play_loop(GameState,_):-
    game_over(GameState, Winner), !, 
    format('~nACABOU O JOGO~n~d', [Winner]).

play_loop(GameState, P1+L1-P2+L2):-
    %display_valid_moves
    select_move(GameState,P1+L1, I-J),
    move(GameState, I-J, NewGameState),
    display_game(NewGameState),!,
    play_loop(NewGameState, P2+L2-P1+L1).

%input_move(+GameState, +Player, -I-J)
select_move(_,h+_, I-J):-
    board_dimension(Size),
    format('~nRow: ',[]), read_digit_between_one_time(-1,Size,I),
    format('~nColumn: ',[]), read_digit_between_one_time(-1,Size,J).

select_move(GameState,c+Level, I-J):-
    choose_move(GameState,Level,I-J).


