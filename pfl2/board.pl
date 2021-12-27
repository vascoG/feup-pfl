/**
* Board is represented by a list of lists that can be queried using predicate board(+Board,+I-J,-Player), meaning in position (I,J) there is
* a cube placed by the Player. If there is no cubes, Player returns 0.
*/

%initial_state(+Size,-GameState)
initial_state(Size,gamestate(Board,1,nan-nan)):- initial_board(Size, Board).

%initial_board(+Size, -Board)
initial_board(Size,Board):- 
    create_board(Size,Board,Size).

create_board(Size,[],0).

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




