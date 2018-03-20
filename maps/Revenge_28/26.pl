:- dynamic initial/1.

initial(state(agent(6-8), boxes([3-8, 5-7, 5-6, 4-4, 3-3, 4-3]))).

:- dynamic target/1.

target([5-7, 5-6, 6-6, 5-5, 5-4, 5-3]).

:- dynamic top/2.

top(1-8, 1-9).
top(2-8, 2-9).
top(3-8, 3-9).
top(4-8, 4-9).
top(1-7, 1-8).
top(3-7, 3-8).
top(4-7, 4-8).
top(6-7, 6-8).
top(1-6, 1-7).
top(3-6, 3-7).
top(4-6, 4-7).
top(5-6, 5-7).
top(6-6, 6-7).
top(1-5, 1-6).
top(5-5, 5-6).
top(1-4, 1-5).
top(2-4, 2-5).
top(5-4, 5-5).
top(3-3, 3-4).
top(4-3, 4-4).
top(5-3, 5-4).
top(3-2, 3-3).
top(4-2, 4-3).
top(5-2, 5-3).
top(3-1, 3-2).
top(4-1, 4-2).
top(5-1, 5-2).

:- dynamic right/2.

right(1-9, 2-9).
right(2-9, 3-9).
right(3-9, 4-9).
right(1-8, 2-8).
right(2-8, 3-8).
right(3-8, 4-8).
right(3-7, 4-7).
right(4-7, 5-7).
right(5-7, 6-7).
right(3-6, 4-6).
right(4-6, 5-6).
right(5-6, 6-6).
right(1-5, 2-5).
right(1-4, 2-4).
right(2-4, 3-4).
right(3-4, 4-4).
right(4-4, 5-4).
right(3-3, 4-3).
right(4-3, 5-3).
right(3-2, 4-2).
right(4-2, 5-2).
right(3-1, 4-1).
right(4-1, 5-1).

