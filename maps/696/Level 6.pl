:- dynamic initial/1.

initial(state(agent(5-1), boxes([5-4, 5-3, 5-2, 6-2]))).

:- dynamic target/1.

target([6-6, 3-4, 4-4, 6-4]).

:- dynamic top/2.

top(4-5, 4-6).
top(5-5, 5-6).
top(6-5, 6-6).
top(4-4, 4-5).
top(5-4, 5-5).
top(6-4, 6-5).
top(3-3, 3-4).
top(5-3, 5-4).
top(6-3, 6-4).
top(3-2, 3-3).
top(5-2, 5-3).
top(6-2, 6-3).
top(5-1, 5-2).
top(6-1, 6-2).

:- dynamic right/2.

right(4-6, 5-6).
right(5-6, 6-6).
right(4-5, 5-5).
right(5-5, 6-5).
right(3-4, 4-4).
right(4-4, 5-4).
right(5-4, 6-4).
right(5-3, 6-3).
right(3-2, 4-2).
right(4-2, 5-2).
right(5-2, 6-2).
right(5-1, 6-1).
