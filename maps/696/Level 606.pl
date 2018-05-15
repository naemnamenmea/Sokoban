:- dynamic initial/1.

initial(state(agent(4-2), boxes([4-6, 3-4, 2-3, 3-3, 4-3, 3-2]))).

:- dynamic target/1.

target([3-7, 3-5, 4-5, 3-4, 2-3, 1-1]).

:- dynamic top/2.

top(3-7, 3-8).
top(4-7, 4-8).
top(3-6, 3-7).
top(4-6, 4-7).
top(2-5, 2-6).
top(3-5, 3-6).
top(4-5, 4-6).
top(5-5, 5-6).
top(6-5, 6-6).
top(2-4, 2-5).
top(3-4, 3-5).
top(4-4, 4-5).
top(2-3, 2-4).
top(3-3, 3-4).
top(4-3, 4-4).
top(2-2, 2-3).
top(3-2, 3-3).
top(4-2, 4-3).
top(1-1, 1-2).
top(2-1, 2-2).
top(3-1, 3-2).

:- dynamic right/2.

right(3-8, 4-8).
right(3-7, 4-7).
right(2-6, 3-6).
right(3-6, 4-6).
right(4-6, 5-6).
right(5-6, 6-6).
right(2-5, 3-5).
right(3-5, 4-5).
right(4-5, 5-5).
right(5-5, 6-5).
right(2-4, 3-4).
right(3-4, 4-4).
right(2-3, 3-3).
right(3-3, 4-3).
right(1-2, 2-2).
right(2-2, 3-2).
right(3-2, 4-2).
right(1-1, 2-1).
right(2-1, 3-1).

