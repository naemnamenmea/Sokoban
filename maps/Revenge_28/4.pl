:- dynamic initial/1.

initial(state(agent(5-3), boxes([7-4, 8-4, 4-3, 6-3, 9-3, 2-2, 3-2, 7-2, 2-1]))).

:- dynamic target/1.

target([8-6, 8-5, 9-5, 8-4, 6-3, 7-3, 8-3, 8-2, 8-1]).

:- dynamic top/2.

top(8-5, 8-6).
top(8-4, 8-5).
top(9-4, 9-5).
top(1-3, 1-4).
top(2-3, 2-4).
top(4-3, 4-4).
top(5-3, 5-4).
top(6-3, 6-4).
top(7-3, 7-4).
top(8-3, 8-4).
top(9-3, 9-4).
top(1-2, 1-3).
top(2-2, 2-3).
top(4-2, 4-3).
top(7-2, 7-3).
top(8-2, 8-3).
top(9-2, 9-3).
top(1-1, 1-2).
top(2-1, 2-2).
top(3-1, 3-2).
top(4-1, 4-2).
top(7-1, 7-2).
top(8-1, 8-2).
top(9-1, 9-2).

:- dynamic right/2.

right(8-5, 9-5).
right(1-4, 2-4).
right(2-4, 3-4).
right(3-4, 4-4).
right(4-4, 5-4).
right(5-4, 6-4).
right(6-4, 7-4).
right(7-4, 8-4).
right(8-4, 9-4).
right(1-3, 2-3).
right(4-3, 5-3).
right(5-3, 6-3).
right(6-3, 7-3).
right(7-3, 8-3).
right(8-3, 9-3).
right(1-2, 2-2).
right(2-2, 3-2).
right(3-2, 4-2).
right(7-2, 8-2).
right(8-2, 9-2).
right(1-1, 2-1).
right(2-1, 3-1).
right(3-1, 4-1).
right(4-1, 5-1).
right(5-1, 6-1).
right(6-1, 7-1).
right(7-1, 8-1).
right(8-1, 9-1).

