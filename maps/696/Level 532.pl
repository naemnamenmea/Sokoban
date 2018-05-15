:- dynamic initial/1.

initial(state(agent(4-1), boxes([3-4, 6-4, 4-3, 3-2, 5-2]))).

:- dynamic target/1.

target([2-6, 2-4, 3-4, 2-3, 3-1]).

:- dynamic top/2.

top(1-6, 1-7).
top(2-6, 2-7).
top(3-6, 3-7).
top(2-5, 2-6).
top(3-5, 3-6).
top(2-4, 2-5).
top(3-4, 3-5).
top(5-4, 5-5).
top(2-3, 2-4).
top(3-3, 3-4).
top(5-3, 5-4).
top(6-3, 6-4).
top(7-3, 7-4).
top(2-2, 2-3).
top(3-2, 3-3).
top(5-2, 5-3).
top(3-1, 3-2).
top(5-1, 5-2).

:- dynamic right/2.

right(1-7, 2-7).
right(2-7, 3-7).
right(1-6, 2-6).
right(2-6, 3-6).
right(2-5, 3-5).
right(3-5, 4-5).
right(4-5, 5-5).
right(2-4, 3-4).
right(5-4, 6-4).
right(6-4, 7-4).
right(2-3, 3-3).
right(3-3, 4-3).
right(4-3, 5-3).
right(5-3, 6-3).
right(6-3, 7-3).
right(2-2, 3-2).
right(3-1, 4-1).
right(4-1, 5-1).

