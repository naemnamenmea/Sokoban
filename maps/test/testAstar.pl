:- dynamic initial/1.

initial(state(agent(1-2), boxes([3-2]))).

:- dynamic target/1.

target([2-2]).

:- dynamic top/2.

top(1-1, 1-2).
top(2-1, 2-2).
top(4-1, 4-2).
top(5-1, 5-2).

:- dynamic right/2.

right(1-2, 2-2).
right(2-2, 3-2).
right(3-2, 4-2).
right(4-2, 5-2).
right(1-1, 2-1).
right(4-1, 5-1).

