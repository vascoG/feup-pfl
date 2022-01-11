%display_game(+GameState)
display_game(gamestate([Line|Board],Turn,_)):-
    format('~nTurno: ~d~n~n', Turn),
    format('   ',[]),
    print_top_coords(Line,0),
    format('   ',[]),
    print_border(Line),
    print_board([Line|Board],0),
    format('   ',[]),
    print_border(Line).


%display_menu
display_menu:-
    format('~n4MATION e um jogo de tabuleiro cujo objetivo e colocar cubos estrategicamente de forma a fazer uma linha horizontal, vertical ou diagonal de 4 cubos.~n',[]),
    format('Desenvolvido por Mariana Monteiro e Vasco Gomes.~n~n',[]),
    format('------------------------------------------------~n~n',[]),
    format('OPTIONS:~n~n', []),
    format('1. Play~n', []),
    format('2. Instructions~n', []),
    format('0. Quit~n~n', []).

%display_play_options    
display_play_options :-
    format('~n1. Human x Human~n', []),
    format('2. Human x Computer~n', []),
    format('3. Computer x Computer~n', []),
    format('0. Back~n~n', []).

%print_top_coords(+Line, +C)
print_top_coords([_],C):-
    format(' ~d ~n',[C]).
print_top_coords([_|T], C):-
    C1 is C+1,
    print_cell(C),
    print_top_coords(T,C1).

%print_left_coords(+C)
print_left_coords(C):-
    format('~d |', C).

%print_border(+Line)
print_border([_]):-
    format('---~n' , []).
print_border([_|T]):-
    format('---|', []),
    print_border(T).

%print_board(+Size, +Board)
print_board([],_).
print_board([Line|Board],C):-
    print_left_coords(C),
    print_line(Line),
    C1 is C+1,
    print_board(Board,C1).

%print_line(+Line)
print_line([]):-
    format('~n',[]).
print_line([H|T]):-
    print_cell(H),
    print_line(T).

%print_cell(+C)
print_cell(C):-
    format(' ~d |', C).