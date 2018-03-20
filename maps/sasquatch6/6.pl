:- dynamic initial/1.

initial(state(agent(10-2), boxes([3-3, 5-3, 6-3, 9-3, 3-2, 7-2]))).

:- dynamic target/1.

target([3-3, 4-3, 5-3, 6-3, 8-3, 9-3]).

:- dynamic top/2.

top(3-4, 3-5).
top(6-4, 6-5).
top(8-4, 8-5).
top(3-3, 3-4).
top(6-3, 6-4).
top(8-3, 8-4).
top(1-2, 1-3).
top(2-2, 2-3).
top(3-2, 3-3).
top(4-2, 4-3).
top(5-2, 5-3).
top(6-2, 6-3).
top(7-2, 7-3).
top(9-2, 9-3).
top(10-2, 10-3).
top(11-2, 11-3).
top(7-1, 7-2).
top(9-1, 9-2).

:- dynamic right/2.

right(3-5, 4-5).
right(4-5, 5-5).
right(5-5, 6-5).
right(6-5, 7-5).
right(7-5, 8-5).
right(1-3, 2-3).
right(2-3, 3-3).
right(3-3, 4-3).
right(4-3, 5-3).
right(5-3, 6-3).
right(6-3, 7-3).
right(7-3, 8-3).
right(8-3, 9-3).
right(9-3, 10-3).
right(10-3, 11-3).
right(1-2, 2-2).
right(2-2, 3-2).
right(3-2, 4-2).
right(4-2, 5-2).
right(5-2, 6-2).
right(6-2, 7-2).
right(9-2, 10-2).
right(10-2, 11-2).
right(7-1, 8-1).
right(8-1, 9-1).

