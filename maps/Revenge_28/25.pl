:- dynamic initial/1.

initial(state(agent(3-6), boxes([2-5, 3-5, 7-5, 8-5, 3-4, 4-4, 8-4, 2-3, 7-3, 6-2]))).

:- dynamic target/1.

target([2-6, 1-5, 2-5, 3-5, 4-5, 5-5, 2-4, 2-3, 3-3, 4-3]).

:- dynamic top/2.

top(2-5, 2-6).
top(3-5, 3-6).
top(5-5, 5-6).
top(6-5, 6-6).
top(7-5, 7-6).
top(1-4, 1-5).
top(2-4, 2-5).
top(3-4, 3-5).
top(4-4, 4-5).
top(6-4, 6-5).
top(7-4, 7-5).
top(8-4, 8-5).
top(9-4, 9-5).
top(1-3, 1-4).
top(2-3, 2-4).
top(3-3, 3-4).
top(4-3, 4-4).
top(6-3, 6-4).
top(7-3, 7-4).
top(9-3, 9-4).
top(5-2, 5-3).
top(6-2, 6-3).
top(7-2, 7-3).
top(9-2, 9-3).
top(7-1, 7-2).
top(8-1, 8-2).
top(9-1, 9-2).

:- dynamic right/2.

right(2-6, 3-6).
right(5-6, 6-6).
right(6-6, 7-6).
right(1-5, 2-5).
right(2-5, 3-5).
right(3-5, 4-5).
right(4-5, 5-5).
right(5-5, 6-5).
right(6-5, 7-5).
right(7-5, 8-5).
right(8-5, 9-5).
right(1-4, 2-4).
right(2-4, 3-4).
right(3-4, 4-4).
right(6-4, 7-4).
right(7-4, 8-4).
right(8-4, 9-4).
right(1-3, 2-3).
right(2-3, 3-3).
right(3-3, 4-3).
right(4-3, 5-3).
right(5-3, 6-3).
right(6-3, 7-3).
right(5-2, 6-2).
right(6-2, 7-2).
right(7-2, 8-2).
right(8-2, 9-2).
right(7-1, 8-1).
right(8-1, 9-1).

