:- ensure_loaded(gameover).
:- ensure_loaded(interface).

%menu
menu:-
    repeat,
    display_menu,
    format('Option: ', []), get_char(Option), skip_line,
    menu(Option), !.

%menu(+Option)

menu('0'):-
    abort.

menu('1'):-
    repeat,
    format('~nChoose the size of the board. The number of columns and lines must be between 4 and 9: ',[]),
    get_code(Size), skip_line,
    number_codes(Size1, [Size]),
    Size1 > 3, 
    Size1 < 10,
    options, !.

options:-
    display_play_options,
    format('Option: ', []), get_char(Option), skip_line,
    play_options(Option), !.

%play_options(+Option)
play_options('0'):-
    menu.

play_options('1'):-
    play_game(h-h,_).

%play_game(+P1-P2, +Size, +Level)
%play_game(P1-P2, Size, Level):-
 %  initial_state()
