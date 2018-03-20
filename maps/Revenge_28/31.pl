:- dynamic initial/1.

initial(state(agent(6-5), boxes([4-6, 5-6, 5-5, 5-4, 6-4, 8-4, 5-2, 7-2]))).

:- dynamic target/1.

target([6-8, 7-8, 8-8, 7-7, 8-7, 9-7, 8-6, 8-5]).

:- dynamic top/2.

top(6-7, 6-8).
top(7-7, 7-8).
top(8-7, 8-8).
top(9-7, 9-8).
top(1-6, 1-7).
top(2-6, 2-7).
top(3-6, 3-7).
top(5-6, 5-7).
top(7-6, 7-7).
top(8-6, 8-7).
top(3-5, 3-6).
top(4-5, 4-6).
top(5-5, 5-6).
top(8-5, 8-6).
top(4-4, 4-5).
top(5-4, 5-5).
top(6-4, 6-5).
top(8-4, 8-5).
top(4-3, 4-4).
top(6-3, 6-4).
top(8-3, 8-4).
top(1-2, 1-3).
top(2-2, 2-3).
top(3-2, 3-3).
top(4-2, 4-3).
top(6-2, 6-3).
top(7-2, 7-3).
top(8-2, 8-3).
top(6-1, 6-2).
top(7-1, 7-2).
top(8-1, 8-2).

:- dynamic right/2.

right(6-8, 7-8).
right(7-8, 8-8).
right(8-8, 9-8).
right(1-7, 2-7).
right(2-7, 3-7).
right(5-7, 6-7).
right(6-7, 7-7).
right(7-7, 8-7).
right(8-7, 9-7).
right(1-6, 2-6).
right(2-6, 3-6).
right(3-6, 4-6).
right(4-6, 5-6).
right(7-6, 8-6).
right(3-5, 4-5).
right(4-5, 5-5).
right(5-5, 6-5).
right(4-4, 5-4).
right(5-4, 6-4).
right(1-3, 2-3).
right(2-3, 3-3).
right(3-3, 4-3).
right(6-3, 7-3).
right(7-3, 8-3).
right(1-2, 2-2).
right(2-2, 3-2).
right(3-2, 4-2).
right(4-2, 5-2).
right(5-2, 6-2).
right(6-2, 7-2).
right(7-2, 8-2).
right(6-1, 7-1).
right(7-1, 8-1).

