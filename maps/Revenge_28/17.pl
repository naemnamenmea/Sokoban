:- dynamic initial/1.

initial(state(agent(3-7), boxes([3-6, 2-5, 4-4, 6-4, 8-3]))).

:- dynamic target/1.

target([6-5, 4-4, 5-4, 6-4, 6-3]).

:- dynamic top/2.

top(1-6, 1-7).
top(3-6, 3-7).
top(6-6, 6-7).
top(7-6, 7-7).
top(1-5, 1-6).
top(3-5, 3-6).
top(4-5, 4-6).
top(6-5, 6-6).
top(7-5, 7-6).
top(8-5, 8-6).
top(3-4, 3-5).
top(4-4, 4-5).
top(6-4, 6-5).
top(5-3, 5-4).
top(6-3, 6-4).
top(5-2, 5-3).
top(6-2, 6-3).
top(8-2, 8-3).
top(9-2, 9-3).
top(4-1, 4-2).
top(5-1, 5-2).
top(6-1, 6-2).
top(8-1, 8-2).
top(9-1, 9-2).

:- dynamic right/2.

right(1-7, 2-7).
right(2-7, 3-7).
right(6-7, 7-7).
right(3-6, 4-6).
right(4-6, 5-6).
right(5-6, 6-6).
right(6-6, 7-6).
right(7-6, 8-6).
right(1-5, 2-5).
right(2-5, 3-5).
right(3-5, 4-5).
right(6-5, 7-5).
right(7-5, 8-5).
right(3-4, 4-4).
right(4-4, 5-4).
right(5-4, 6-4).
right(5-3, 6-3).
right(6-3, 7-3).
right(7-3, 8-3).
right(8-3, 9-3).
right(4-2, 5-2).
right(5-2, 6-2).
right(8-2, 9-2).
right(4-1, 5-1).
right(5-1, 6-1).
right(6-1, 7-1).
right(7-1, 8-1).
right(8-1, 9-1).

