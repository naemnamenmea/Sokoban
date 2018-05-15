:- dynamic initial/1.

initial(state(agent(2-6), boxes([2-5, 3-5, 2-4]))).

:- dynamic target/1.

target([5-3, 1-2, 4-1]).

:- dynamic top/2.

top(2-5, 2-6).
top(3-5, 3-6).
top(2-4, 2-5).
top(3-4, 3-5).
top(1-3, 1-4).
top(3-3, 3-4).
top(4-3, 4-4).
top(5-3, 5-4).
top(1-2, 1-3).
top(3-2, 3-3).
top(4-2, 4-3).
top(3-1, 3-2).
top(4-1, 4-2).

:- dynamic right/2.

right(2-6, 3-6).
right(2-5, 3-5).
right(1-4, 2-4).
right(2-4, 3-4).
right(3-4, 4-4).
right(4-4, 5-4).
right(3-3, 4-3).
right(4-3, 5-3).
right(1-2, 2-2).
right(2-2, 3-2).
right(3-2, 4-2).
right(3-1, 4-1).

