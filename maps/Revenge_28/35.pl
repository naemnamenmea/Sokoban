:- dynamic initial/1.

initial(state(agent(1-6), boxes([2-6, 5-6, 2-5, 3-5, 6-4, 7-4, 6-3, 8-3, 8-2]))).

:- dynamic target/1.

target([3-6, 5-6, 6-6, 3-5, 4-5, 5-5, 2-4, 2-3, 2-2]).

:- dynamic top/2.

top(1-5, 1-6).
top(2-5, 2-6).
top(3-5, 3-6).
top(4-5, 4-6).
top(5-5, 5-6).
top(6-5, 6-6).
top(2-4, 2-5).
top(5-4, 5-5).
top(6-4, 6-5).
top(7-4, 7-5).
top(8-4, 8-5).
top(9-4, 9-5).
top(2-3, 2-4).
top(5-3, 5-4).
top(6-3, 6-4).
top(7-3, 7-4).
top(8-3, 8-4).
top(9-3, 9-4).
top(2-2, 2-3).
top(4-2, 4-3).
top(6-2, 6-3).
top(7-2, 7-3).
top(8-2, 8-3).
top(9-2, 9-3).
top(8-1, 8-2).
top(9-1, 9-2).

:- dynamic right/2.

right(1-6, 2-6).
right(2-6, 3-6).
right(3-6, 4-6).
right(4-6, 5-6).
right(5-6, 6-6).
right(1-5, 2-5).
right(2-5, 3-5).
right(3-5, 4-5).
right(4-5, 5-5).
right(5-5, 6-5).
right(6-5, 7-5).
right(7-5, 8-5).
right(8-5, 9-5).
right(5-4, 6-4).
right(6-4, 7-4).
right(7-4, 8-4).
right(8-4, 9-4).
right(4-3, 5-3).
right(5-3, 6-3).
right(6-3, 7-3).
right(7-3, 8-3).
right(8-3, 9-3).
right(2-2, 3-2).
right(3-2, 4-2).
right(6-2, 7-2).
right(7-2, 8-2).
right(8-2, 9-2).
right(8-1, 9-1).

