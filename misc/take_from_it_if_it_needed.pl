/* A corner is a square which has at most one neighbour square in vertical */
/* and one in horizontal. It is defined using the counter-rule noncorner.  */
corner(X) :- \+ noncorner(X).
noncorner(X) :- top(_,X),top(X,_).
noncorner(X) :- right(_,X),right(X,_).


/* Some position for boxes must be avoided (unless they are solutions)     */
/* because the Sokoban won't be able to move them further:                 */
/*  - corners: the Sokoban can't move a box which is placed at a corner.   */
stuck(X) :-
    \+ solution(X),
    corner(X).

/*  - horizontally adjacent boxes can only be moved up or down... if there */
/*    are empty squares for the Sokoban to push and for the boxes to move. */
stuck(X, Y) :-
    (right(X,Y); right(Y,X)),
    (\+ solution(X); \+ solution(Y)),
    (\+ top(X,_); \+ top(_,X)),
    (\+ top(Y,_); \+ top(_,Y)).

/*  - vertically adjacent boxes can only be moved right or left... if there*/
/*    are empty squares for the Sokoban to push and for the boxes to move. */
stuck(X, Y) :-
    (top(X,Y); top(Y,X)),
    (\+ solution(X); \+ solution(Y)),
    (\+ right(X,_); \+ right(_,X)),
    (\+ right(Y,_); \+ right(_,Y)).

/* The Sokoban can move to any empty position in the board, but cannot go  */
/* through boxes.                                                          */
can_reach(P1, P1, _Boxes, _Visited).
can_reach(P1, P2, Boxes, _Visited) :-
    neib(P1, P2, _),
    \+ member(P2, Boxes).
can_reach(P1, P2, Boxes, Visited) :-
    neib(P1, P3, _),
    P3 \== P2,
    \+ member(P3, Visited),
    \+ member(P3, Boxes),
    can_reach(P3, P2, Boxes, [P3|Visited]).

/* A good place to move a box is one that:                                 */
/*  - is not already occupied by a box.                                    */
/*  - is not one of the positions to avoid regarding the board and boxes.  */
good_move(X, Boxes) :-
    \+ member(X, Boxes),
    \+ stuck(X),
    foreach(member(Box, Boxes), \+ stuck(X, Box)).

/* Selection of a good movement given a state:                             */
/*  - any valid movement for every box                                     */
/*  - the Sokoban must be able to access the push position                 */
movement(state(Sokoban, Boxes), move(Box, Dir)) :-
    select(Box, Boxes, BoxesRemain),
    neib(Box, NextLoc, Dir),
    good_move(NextLoc, BoxesRemain),
    neib(PushPosition, Box, Dir),
    /*can_reach(Sokoban, PushPosition, Boxes, []),*/ /* Enable this rule to consider Sokoban movement constraint */
    \+ member(PushPosition, Boxes).


update(state(_Sokoban, Boxes), move(Box, Dir), state(NewSokoban, NewBoxes)) :-
    NewSokoban = Box,
    subtract(Boxes, [Box], TempList),
    neib(Box, NewPosition, Dir),
    append(TempList, [NewPosition], NewBoxes).
    
solve_dfs(Problem, State, _History, []) :-
    final_state(Problem, State).

/* If not, we have to explore new states                                   */
solve_dfs(Problem, State, History, [Move|Moves]) :-
    movement(State, Move),
    update(State, Move, NewState),
    \+ member(NewState, History),   /* No quiero ciclos en el grafo de búsqueda */
    solve_dfs(Problem, NewState, [NewState|History], Moves).

/* Actually solve the problem                                              */
solve_problem(Problem, Solution) :-
    format('=============~n'),
    format('|| Problem: ~w~n', Problem),
    format('=============~n'),
    initial_state(Problem, Initial),
    format('Initial state: ~w~n', Initial),
    solve_dfs(Problem, Initial, [Initial], Solution). 