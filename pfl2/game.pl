:- ensure_loaded(gameover).

%display_game(+GameState)
display_game(gamestate([Line|Board],Turn,_)):-
    format('~nTurno: ~d~n~n', Turn),
    format('   ',[]),
    print_top_coords(Line,0),
    format('   ',[]),
    print_top(Line),
    print_board([Line|Board],0),
    format('   ',[]),
    print_top(Line).


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

print_top([_]):-
    format('---~n' , []).
print_top([_|T]):-
    format('---|', []),
    print_top(T).

%print_board(+Size, +Board)
print_board([],_).
print_board([Line|Board],C):-
    print_left_coords(C),
    print_line(Line),
    C1 is C+1,
    print_board(Board,C1).

print_line([]):-
    format('~n',[]).
print_line([H|T]):-
    print_cell(H),
    print_line(T).

print_cell(C):-
    format(' ~d |', C).

