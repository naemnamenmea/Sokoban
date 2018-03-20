:- dynamic initial/1.

initial(state(agent(4-2), boxes([2-3]))).

:- dynamic target/1.

target([2-2]).

:- dynamic top/2.

top(1-3, 1-4).
top(2-3, 2-4).
top(3-3, 3-4).
top(4-3, 4-4).
top(1-2, 1-3).
top(2-2, 2-3).
top(3-2, 3-3).
top(4-2, 4-3).
top(1-1, 1-2).
top(2-1, 2-2).
top(3-1, 3-2).
top(4-1, 4-2).

:- dynamic right/2.

right(1-4, 2-4).
right(2-4, 3-4).
right(3-4, 4-4).
right(1-3, 2-3).
right(2-3, 3-3).
right(3-3, 4-3).
right(1-2, 2-2).
right(2-2, 3-2).
right(3-2, 4-2).
right(1-1, 2-1).
right(2-1, 3-1).
right(3-1, 4-1).

