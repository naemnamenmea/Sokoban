:- dynamic initial/1.

initial(state(agent(4-1), boxes([5-5, 6-5, 4-4, 4-3, 3-2, 4-2]))).

:- dynamic target/1.

target([4-6, 2-4, 3-4, 4-4, 7-4, 3-2]).

:- dynamic top/2.

top(4-6, 4-7).
top(5-6, 5-7).
top(4-5, 4-6).
top(5-5, 5-6).
top(1-4, 1-5).
top(2-4, 2-5).
top(3-4, 3-5).
top(4-4, 4-5).
top(5-4, 5-5).
top(6-4, 6-5).
top(7-4, 7-5).
top(3-3, 3-4).
top(4-3, 4-4).
top(5-3, 5-4).
top(6-3, 6-4).
top(7-3, 7-4).
top(3-2, 3-3).
top(4-2, 4-3).
top(3-1, 3-2).
top(4-1, 4-2).

:- dynamic right/2.

right(4-7, 5-7).
right(4-6, 5-6).
right(1-5, 2-5).
right(2-5, 3-5).
right(3-5, 4-5).
right(4-5, 5-5).
right(5-5, 6-5).
right(6-5, 7-5).
right(1-4, 2-4).
right(2-4, 3-4).
right(3-4, 4-4).
right(4-4, 5-4).
right(5-4, 6-4).
right(6-4, 7-4).
right(3-3, 4-3).
right(4-3, 5-3).
right(5-3, 6-3).
right(6-3, 7-3).
right(3-2, 4-2).
right(3-1, 4-1).

