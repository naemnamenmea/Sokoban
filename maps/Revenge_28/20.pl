:- dynamic initial/1.

initial(state(agent(1-4), boxes([4-6, 5-6, 6-5, 2-4, 4-4, 5-3, 8-3, 6-2]))).

:- dynamic target/1.

target([2-7, 4-7, 2-6, 3-6, 4-6, 5-6, 2-5, 2-4]).

:- dynamic top/2.

top(1-6, 1-7).
top(2-6, 2-7).
top(3-6, 3-7).
top(4-6, 4-7).
top(5-6, 5-7).
top(2-5, 2-6).
top(4-5, 4-6).
top(5-5, 5-6).
top(7-5, 7-6).
top(8-5, 8-6).
top(2-4, 2-5).
top(4-4, 4-5).
top(5-4, 5-5).
top(8-4, 8-5).
top(3-3, 3-4).
top(4-3, 4-4).
top(5-3, 5-4).
top(8-3, 8-4).
top(9-3, 9-4).
top(5-2, 5-3).
top(6-2, 6-3).
top(7-2, 7-3).
top(8-2, 8-3).
top(9-2, 9-3).
top(5-1, 5-2).
top(6-1, 6-2).
top(7-1, 7-2).

:- dynamic right/2.

right(1-7, 2-7).
right(2-7, 3-7).
right(3-7, 4-7).
right(4-7, 5-7).
right(1-6, 2-6).
right(2-6, 3-6).
right(3-6, 4-6).
right(4-6, 5-6).
right(7-6, 8-6).
right(4-5, 5-5).
right(5-5, 6-5).
right(6-5, 7-5).
right(7-5, 8-5).
right(1-4, 2-4).
right(2-4, 3-4).
right(3-4, 4-4).
right(4-4, 5-4).
right(8-4, 9-4).
right(3-3, 4-3).
right(4-3, 5-3).
right(5-3, 6-3).
right(6-3, 7-3).
right(7-3, 8-3).
right(8-3, 9-3).
right(5-2, 6-2).
right(6-2, 7-2).
right(7-2, 8-2).
right(8-2, 9-2).
right(5-1, 6-1).
right(6-1, 7-1).

