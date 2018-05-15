:- dynamic initial/1.

initial(state(agent(3-6), boxes([3-5, 3-2, 4-2]))).

:- dynamic target/1.

target([5-3, 2-2, 4-2]).

:- dynamic top/2.

top(3-5, 3-6).
top(5-5, 5-6).
top(3-4, 3-5).
top(5-4, 5-5).
top(2-3, 2-4).
top(4-3, 4-4).
top(5-3, 5-4).
top(2-2, 2-3).
top(4-2, 4-3).
top(5-2, 5-3).
top(4-1, 4-2).
top(5-1, 5-2).
top(6-1, 6-2).

:- dynamic right/2.

right(3-6, 4-6).
right(4-6, 5-6).
right(2-4, 3-4).
right(3-4, 4-4).
right(4-4, 5-4).
right(4-3, 5-3).
right(2-2, 3-2).
right(3-2, 4-2).
right(4-2, 5-2).
right(5-2, 6-2).
right(4-1, 5-1).
right(5-1, 6-1).

