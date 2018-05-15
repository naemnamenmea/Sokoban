:- dynamic initial/1.

initial(state(agent(2-3), boxes([2-6, 2-4, 5-4, 2-2]))).

:- dynamic target/1.

target([4-5, 5-4, 5-3, 6-3]).

:- dynamic top/2.

top(4-6, 4-7).
top(5-6, 5-7).
top(1-5, 1-6).
top(2-5, 2-6).
top(4-5, 4-6).
top(5-5, 5-6).
top(1-4, 1-5).
top(2-4, 2-5).
top(5-4, 5-5).
top(2-3, 2-4).
top(5-3, 5-4).
top(2-2, 2-3).
top(4-2, 4-3).
top(5-2, 5-3).
top(6-2, 6-3).
top(2-1, 2-2).
top(3-1, 3-2).
top(4-1, 4-2).

:- dynamic right/2.

right(4-7, 5-7).
right(1-6, 2-6).
right(2-6, 3-6).
right(3-6, 4-6).
right(4-6, 5-6).
right(1-5, 2-5).
right(4-5, 5-5).
right(1-4, 2-4).
right(4-3, 5-3).
right(5-3, 6-3).
right(2-2, 3-2).
right(3-2, 4-2).
right(4-2, 5-2).
right(5-2, 6-2).
right(2-1, 3-1).
right(3-1, 4-1).

