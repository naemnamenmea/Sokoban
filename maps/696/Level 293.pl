:- dynamic initial/1.

initial(state(agent(4-2), boxes([3-4, 6-4, 2-3, 4-3]))).

:- dynamic target/1.

target([7-5, 2-4, 4-4, 2-2]).

:- dynamic top/2.

top(2-5, 2-6).
top(3-5, 3-6).
top(2-4, 2-5).
top(3-4, 3-5).
top(4-4, 4-5).
top(5-4, 5-5).
top(6-4, 6-5).
top(7-4, 7-5).
top(2-3, 2-4).
top(4-3, 4-4).
top(1-2, 1-3).
top(2-2, 2-3).
top(4-2, 4-3).
top(1-1, 1-2).
top(2-1, 2-2).

:- dynamic right/2.

right(2-6, 3-6).
right(2-5, 3-5).
right(3-5, 4-5).
right(4-5, 5-5).
right(5-5, 6-5).
right(6-5, 7-5).
right(2-4, 3-4).
right(3-4, 4-4).
right(4-4, 5-4).
right(5-4, 6-4).
right(6-4, 7-4).
right(1-3, 2-3).
right(1-2, 2-2).
right(2-2, 3-2).
right(3-2, 4-2).
right(1-1, 2-1).
