:-ensure_loaded(interface).


display_initial_state:-
    initial_state(65,GameState),
    display_game(GameState).

display_intermediate_state:-
    display_game(gamestate(
  [
  [2,0,0,0,0],
  [1,1,2,0,0],
  [1,2,1,0,0],
  [0,0,1,2,0],
  [0,0,0,0,0]
  ],
  10,3-0
  )).

display_final_state:-
    display_game(gamestate(
  [
  [2,0,1,2,0],
  [1,1,2,2,2],
  [1,2,1,1,1],
  [2,1,1,2,2],
  [2,1,2,1,0]
  ],
  23,0-3
  )).