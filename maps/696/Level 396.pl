:- dynamic initial/1.

initial(state(agent(3-6), boxes([2-6, 4-6, 4-5, 4-4, 3-3]))).

:- dynamic target/1.

target([4-5, 5-5, 1-4, 5-3, 4-2]).

:- dynamic top/2.

top(4-6, 4-7).
top(5-6, 5-7).
top(1-5, 1-6).
top(4-5, 4-6).
top(5-5, 5-6).
top(1-4, 1-5).
top(4-4, 4-5).
top(5-4, 5-5).
top(1-3, 1-4).
top(2-3, 2-4).
top(3-3, 3-4).
top(4-3, 4-4).
top(5-3, 5-4).
top(3-2, 3-3).
top(4-2, 4-3).
top(5-2, 5-3).
top(4-1, 4-2).
top(5-1, 5-2).

:- dynamic right/2.

right(4-7, 5-7).
right(1-6, 2-6).
right(2-6, 3-6).
right(3-6, 4-6).
right(4-6, 5-6).
right(4-5, 5-5).
right(1-4, 2-4).
right(2-4, 3-4).
right(3-4, 4-4).
right(4-4, 5-4).
right(1-3, 2-3).
right(2-3, 3-3).
right(3-3, 4-3).
right(4-3, 5-3).
right(3-2, 4-2).
right(4-2, 5-2).
right(4-1, 5-1).

