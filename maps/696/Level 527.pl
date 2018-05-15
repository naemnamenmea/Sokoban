:- dynamic initial/1.

initial(state(agent(1-1), boxes([4-6, 3-5, 2-3, 4-2, 2-1]))).

:- dynamic target/1.

target([2-7, 2-5, 2-4, 2-3, 4-1]).

:- dynamic top/2.

top(2-6, 2-7).
top(4-6, 4-7).
top(2-5, 2-6).
top(4-5, 4-6).
top(2-4, 2-5).
top(4-4, 4-5).
top(2-3, 2-4).
top(4-3, 4-4).
top(5-3, 5-4).
top(1-2, 1-3).
top(2-2, 2-3).
top(4-2, 4-3).
top(5-2, 5-3).
top(1-1, 1-2).
top(2-1, 2-2).
top(4-1, 4-2).
top(5-1, 5-2).
top(6-1, 6-2).

:- dynamic right/2.

right(2-7, 3-7).
right(3-7, 4-7).
right(2-5, 3-5).
right(3-5, 4-5).
right(4-4, 5-4).
right(1-3, 2-3).
right(2-3, 3-3).
right(3-3, 4-3).
right(4-3, 5-3).
right(1-2, 2-2).
right(4-2, 5-2).
right(5-2, 6-2).
right(1-1, 2-1).
right(2-1, 3-1).
right(3-1, 4-1).
right(4-1, 5-1).
right(5-1, 6-1).

