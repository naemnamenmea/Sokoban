:- dynamic initial/1.

initial(state(agent(2-9), boxes([2-8, 3-7, 3-5, 2-4, 3-1]))).

:- dynamic target/1.

target([1-3, 1-2, 2-2, 2-1, 4-1]).

:- dynamic top/2.

top(2-8, 2-9).
top(3-8, 3-9).
top(2-7, 2-8).
top(3-7, 3-8).
top(2-6, 2-7).
top(3-6, 3-7).
top(2-5, 2-6).
top(3-5, 3-6).
top(2-4, 2-5).
top(3-4, 3-5).
top(1-3, 1-4).
top(2-3, 2-4).
top(3-3, 3-4).
top(1-2, 1-3).
top(2-2, 2-3).
top(3-2, 3-3).
top(1-1, 1-2).
top(2-1, 2-2).
top(3-1, 3-2).
top(4-1, 4-2).
top(5-1, 5-2).

:- dynamic right/2.

right(2-9, 3-9).
right(2-8, 3-8).
right(2-7, 3-7).
right(2-6, 3-6).
right(2-5, 3-5).
right(1-4, 2-4).
right(2-4, 3-4).
right(1-3, 2-3).
right(2-3, 3-3).
right(1-2, 2-2).
right(2-2, 3-2).
right(3-2, 4-2).
right(4-2, 5-2).
right(1-1, 2-1).
right(2-1, 3-1).
right(3-1, 4-1).
right(4-1, 5-1).

