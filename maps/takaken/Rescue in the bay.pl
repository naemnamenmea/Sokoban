:- dynamic initial/1.

initial(state(agent(6-1), boxes([5-4, 2-3, 5-3, 7-3, 5-2, 7-2]))).

:- dynamic target/1.

target([2-1, 3-1, 4-1, 5-1, 7-1, 8-1]).

:- dynamic top/2.

top(6-4, 6-5).
top(7-4, 7-5).
top(4-3, 4-4).
top(5-3, 5-4).
top(6-3, 6-4).
top(7-3, 7-4).
top(9-3, 9-4).
top(10-3, 10-4).
top(1-2, 1-3).
top(3-2, 3-3).
top(5-2, 5-3).
top(7-2, 7-3).
top(9-2, 9-3).
top(10-2, 10-3).
top(1-1, 1-2).
top(3-1, 3-2).
top(5-1, 5-2).
top(7-1, 7-2).
top(9-1, 9-2).

:- dynamic right/2.

right(6-5, 7-5).
right(4-4, 5-4).
right(5-4, 6-4).
right(6-4, 7-4).
right(9-4, 10-4).
right(1-3, 2-3).
right(2-3, 3-3).
right(3-3, 4-3).
right(4-3, 5-3).
right(5-3, 6-3).
right(6-3, 7-3).
right(7-3, 8-3).
right(8-3, 9-3).
right(9-3, 10-3).
right(9-2, 10-2).
right(1-1, 2-1).
right(2-1, 3-1).
right(3-1, 4-1).
right(4-1, 5-1).
right(5-1, 6-1).
right(6-1, 7-1).
right(7-1, 8-1).
right(8-1, 9-1).

