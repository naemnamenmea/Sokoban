:- dynamic initial/1.

initial(state(agent(4-2), boxes([3-4, 2-3, 3-3, 5-3]))).

:- dynamic target/1.

target([5-6, 5-5, 2-4, 4-1]).

:- dynamic top/2.

top(3-5, 3-6).
top(5-5, 5-6).
top(1-4, 1-5).
top(2-4, 2-5).
top(3-4, 3-5).
top(5-4, 5-5).
top(2-3, 2-4).
top(3-3, 3-4).
top(5-3, 5-4).
top(2-2, 2-3).
top(3-2, 3-3).
top(4-2, 4-3).
top(5-2, 5-3).
top(6-2, 6-3).
top(3-1, 3-2).
top(4-1, 4-2).

:- dynamic right/2.

right(3-6, 4-6).
right(4-6, 5-6).
right(1-5, 2-5).
right(2-5, 3-5).
right(1-4, 2-4).
right(2-4, 3-4).
right(2-3, 3-3).
right(3-3, 4-3).
right(4-3, 5-3).
right(5-3, 6-3).
right(2-2, 3-2).
right(3-2, 4-2).
right(4-2, 5-2).
right(5-2, 6-2).
right(3-1, 4-1).

