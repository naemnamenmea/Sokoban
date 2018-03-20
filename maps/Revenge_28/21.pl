:- dynamic initial/1.

initial(state(agent(3-1), boxes([4-3, 3-2, 5-2, 6-2]))).

:- dynamic target/1.

target([6-4, 7-4, 8-4, 6-3]).

:- dynamic top/2.

top(6-3, 6-4).
top(7-3, 7-4).
top(8-3, 8-4).
top(1-2, 1-3).
top(2-2, 2-3).
top(3-2, 3-3).
top(4-2, 4-3).
top(5-2, 5-3).
top(6-2, 6-3).
top(7-2, 7-3).
top(3-1, 3-2).
top(4-1, 4-2).
top(5-1, 5-2).

:- dynamic right/2.

right(6-4, 7-4).
right(7-4, 8-4).
right(1-3, 2-3).
right(2-3, 3-3).
right(3-3, 4-3).
right(4-3, 5-3).
right(5-3, 6-3).
right(6-3, 7-3).
right(7-3, 8-3).
right(1-2, 2-2).
right(2-2, 3-2).
right(3-2, 4-2).
right(4-2, 5-2).
right(5-2, 6-2).
right(6-2, 7-2).
right(3-1, 4-1).
right(4-1, 5-1).

