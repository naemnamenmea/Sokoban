:- dynamic initial/1.

initial(state(agent(6-4), boxes([4-8, 3-7, 4-7, 3-6, 7-6, 7-4, 6-3, 5-2, 7-2]))).

:- dynamic target/1.

target([5-9, 5-8, 4-7, 5-7, 4-6, 2-5, 3-5, 4-5, 5-5]).

:- dynamic top/2.

top(5-8, 5-9).
top(8-8, 8-9).
top(2-7, 2-8).
top(3-7, 3-8).
top(4-7, 4-8).
top(5-7, 5-8).
top(8-7, 8-8).
top(1-6, 1-7).
top(3-6, 3-7).
top(4-6, 4-7).
top(7-6, 7-7).
top(8-6, 8-7).
top(1-5, 1-6).
top(3-5, 3-6).
top(4-5, 4-6).
top(7-5, 7-6).
top(8-5, 8-6).
top(2-4, 2-5).
top(3-4, 3-5).
top(4-4, 4-5).
top(7-4, 7-5).
top(8-4, 8-5).
top(4-3, 4-4).
top(6-3, 6-4).
top(7-3, 7-4).
top(8-3, 8-4).
top(4-2, 4-3).
top(6-2, 6-3).
top(7-2, 7-3).
top(4-1, 4-2).
top(5-1, 5-2).
top(6-1, 6-2).
top(7-1, 7-2).

:- dynamic right/2.

right(5-9, 6-9).
right(6-9, 7-9).
right(7-9, 8-9).
right(2-8, 3-8).
right(3-8, 4-8).
right(4-8, 5-8).
right(1-7, 2-7).
right(2-7, 3-7).
right(3-7, 4-7).
right(4-7, 5-7).
right(7-7, 8-7).
right(3-6, 4-6).
right(7-6, 8-6).
right(1-5, 2-5).
right(2-5, 3-5).
right(3-5, 4-5).
right(4-5, 5-5).
right(7-5, 8-5).
right(2-4, 3-4).
right(3-4, 4-4).
right(6-4, 7-4).
right(7-4, 8-4).
right(6-3, 7-3).
right(7-3, 8-3).
right(4-2, 5-2).
right(5-2, 6-2).
right(6-2, 7-2).
right(4-1, 5-1).
right(5-1, 6-1).
right(6-1, 7-1).

