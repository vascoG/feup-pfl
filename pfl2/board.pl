:- use_module(library(lists)).

/**
* Board is represented by a list of lists that can be queried using predicate board(+Board,+I-J,-Player), meaning in position (I,J) there is
* a cube placed by the Player. If there is no cubes, Player returns 0.
*/

%initial_state(+Size,-GameState)
initial_state(Size,gamestate(Board,1,nan-nan)):- initial_board(Size, Board).

%initial_board(+Size, -Board)
initial_board(Size,Board):- 
    create_board(Size,Board,Size).

create_board(_,[],0).

create_board(Size,[Line|Board],Column):-
    Column > 0,
    Column1 is Column-1,
    create_line(Size,Line),
    create_board(Size,Board,Column1).




%create_line(+Size, -Line)
create_line(1,[0]).

create_line(Size, Line):- 
    Size > 1,
    Size1 is Size-1,
    create_line(Size1,Line1),
    append(Line1,[0],Line).

%board(+Board,+I-J,?Player)
board(Board,I-J,Player):-
    nth0(I, Board, Line),
    nth0(J, Line, Player).

%update_board(+Board, +I, +J, +Player, -NewBoard)
update_board([[_|Line]|Board],0,0,Player,[[Player|Line]|Board]):- !.
update_board([[E|Line]|Board],0,J,Player,[[E|NewLine]|Board]):- 
    J1 is J-1,
    update_board([Line|Board],0,J1,Player,[NewLine|Board]).
update_board([Line|Board],I,J,Player,[Line|NewBoard]):- 
    I1 is I-1,
    update_board(Board,I1,J,Player, NewBoard).




