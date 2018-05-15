:- dynamic initial/1.

initial(state(agent(4-6), boxes([3-6, 2-5, 4-5]))).

:- dynamic target/1.

target([1-3, 5-2, 5-1]).

:- dynamic top/2.

top(3-6, 3-7).
top(4-6, 4-7).
top(3-5, 3-6).
top(4-5, 4-6).
top(1-4, 1-5).
top(3-4, 3-5).
top(5-4, 5-5).
top(1-3, 1-4).
top(3-3, 3-4).
top(5-3, 5-4).
top(3-2, 3-3).
top(5-2, 5-3).
top(3-1, 3-2).
top(5-1, 5-2).

:- dynamic right/2.

right(3-7, 4-7).
right(3-6, 4-6).
right(1-5, 2-5).
right(2-5, 3-5).
right(3-5, 4-5).
right(4-5, 5-5).
right(1-3, 2-3).
right(2-3, 3-3).
right(3-3, 4-3).
right(4-3, 5-3).
right(3-1, 4-1).
right(4-1, 5-1).

