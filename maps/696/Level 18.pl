:- dynamic initial/1.

initial(state(agent(4-2), boxes([4-5, 3-3, 4-3, 5-2]))).

:- dynamic target/1.

target([2-5, 5-5, 6-5, 5-4]).

:- dynamic top/2.

top(4-5, 4-6).
top(5-5, 5-6).
top(6-5, 6-6).
top(2-4, 2-5).
top(4-4, 4-5).
top(5-4, 5-5).
top(6-4, 6-5).
top(2-3, 2-4).
top(4-3, 4-4).
top(5-3, 5-4).
top(6-3, 6-4).
top(4-2, 4-3).
top(5-2, 5-3).
top(4-1, 4-2).
top(5-1, 5-2).

:- dynamic right/2.

right(4-6, 5-6).
right(5-6, 6-6).
right(2-5, 3-5).
right(3-5, 4-5).
right(4-5, 5-5).
right(5-5, 6-5).
right(4-4, 5-4).
right(5-4, 6-4).
right(2-3, 3-3).
right(3-3, 4-3).
right(4-3, 5-3).
right(5-3, 6-3).
right(4-2, 5-2).
right(4-1, 5-1).

