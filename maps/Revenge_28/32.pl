:- dynamic initial/1.

initial(state(agent(5-7), boxes([4-6, 5-5, 7-5, 6-4, 4-3, 6-3, 2-2, 3-2]))).

:- dynamic target/1.

target([7-7, 7-6, 7-5, 5-4, 6-4, 7-4, 5-3, 7-3]).

:- dynamic top/2.

top(5-6, 5-7).
top(7-6, 7-7).
top(3-5, 3-6).
top(5-5, 5-6).
top(7-5, 7-6).
top(1-4, 1-5).
top(2-4, 2-5).
top(5-4, 5-5).
top(6-4, 6-5).
top(7-4, 7-5).
top(1-3, 1-4).
top(2-3, 2-4).
top(4-3, 4-4).
top(5-3, 5-4).
top(6-3, 6-4).
top(7-3, 7-4).
top(1-2, 1-3).
top(2-2, 2-3).
top(4-2, 4-3).
top(5-2, 5-3).
top(7-2, 7-3).
top(1-1, 1-2).
top(2-1, 2-2).
top(3-1, 3-2).
top(4-1, 4-2).
top(5-1, 5-2).
top(7-1, 7-2).

:- dynamic right/2.

right(5-7, 6-7).
right(6-7, 7-7).
right(3-6, 4-6).
right(4-6, 5-6).
right(1-5, 2-5).
right(2-5, 3-5).
right(5-5, 6-5).
right(6-5, 7-5).
right(1-4, 2-4).
right(4-4, 5-4).
right(5-4, 6-4).
right(6-4, 7-4).
right(1-3, 2-3).
right(4-3, 5-3).
right(5-3, 6-3).
right(6-3, 7-3).
right(1-2, 2-2).
right(2-2, 3-2).
right(3-2, 4-2).
right(4-2, 5-2).
right(1-1, 2-1).
right(2-1, 3-1).
right(3-1, 4-1).
right(4-1, 5-1).
right(5-1, 6-1).
right(6-1, 7-1).

