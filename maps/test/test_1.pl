:- dynamic initial/1.

initial(state(agent(3-1), boxes([2-4]))).

:- dynamic target/1.

target([2-1]).

:- dynamic top/2.

top(1-4, 1-5).
top(3-4, 3-5).
top(4-4, 4-5).
top(1-3, 1-4).
top(2-3, 2-4).
top(4-3, 4-4).
top(1-2, 1-3).
top(2-2, 2-3).
top(4-2, 4-3).
top(1-1, 1-2).
top(2-1, 2-2).
top(3-1, 3-2).
top(4-1, 4-2).

:- dynamic right/2.

right(3-5, 4-5).
right(1-4, 2-4).
right(2-4, 3-4).
right(3-4, 4-4).
right(1-3, 2-3).
right(1-2, 2-2).
right(2-2, 3-2).
right(3-2, 4-2).
right(1-1, 2-1).
right(2-1, 3-1).
right(3-1, 4-1).

