:- dynamic initial/1.

initial(state(agent(5-4), boxes([4-5, 6-5, 7-5, 3-4, 4-4, 6-4, 5-3, 4-2]))).

:- dynamic target/1.

target([4-7, 5-6, 7-6, 1-5, 8-5, 3-4, 7-4, 8-3]).

:- dynamic top/2.

top(4-6, 4-7).
top(4-5, 4-6).
top(6-5, 6-6).
top(7-5, 7-6).
top(2-4, 2-5).
top(3-4, 3-5).
top(4-4, 4-5).
top(6-4, 6-5).
top(7-4, 7-5).
top(8-4, 8-5).
top(3-3, 3-4).
top(4-3, 4-4).
top(5-3, 5-4).
top(7-3, 7-4).
top(8-3, 8-4).
top(3-2, 3-3).
top(4-2, 4-3).
top(5-2, 5-3).
top(8-2, 8-3).
top(5-1, 5-2).
top(6-1, 6-2).
top(8-1, 8-2).

:- dynamic right/2.

right(4-6, 5-6).
right(5-6, 6-6).
right(6-6, 7-6).
right(1-5, 2-5).
right(2-5, 3-5).
right(3-5, 4-5).
right(6-5, 7-5).
right(7-5, 8-5).
right(2-4, 3-4).
right(3-4, 4-4).
right(4-4, 5-4).
right(5-4, 6-4).
right(6-4, 7-4).
right(7-4, 8-4).
right(3-3, 4-3).
right(4-3, 5-3).
right(7-3, 8-3).
right(3-2, 4-2).
right(4-2, 5-2).
right(5-2, 6-2).
right(5-1, 6-1).
right(6-1, 7-1).
right(7-1, 8-1).

