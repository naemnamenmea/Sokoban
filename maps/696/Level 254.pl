:- dynamic initial/1.

initial(state(agent(2-6), boxes([1-5, 2-4, 2-3]))).

:- dynamic target/1.

target([1-3, 3-2, 3-1]).

:- dynamic top/2.

top(1-6, 1-7).
top(2-6, 2-7).
top(1-5, 1-6).
top(2-5, 2-6).
top(1-4, 1-5).
top(2-4, 2-5).
top(1-3, 1-4).
top(2-3, 2-4).
top(3-3, 3-4).
top(4-3, 4-4).
top(1-2, 1-3).
top(3-2, 3-3).
top(1-1, 1-2).
top(3-1, 3-2).

:- dynamic right/2.

right(1-7, 2-7).
right(1-6, 2-6).
right(1-5, 2-5).
right(1-4, 2-4).
right(2-4, 3-4).
right(3-4, 4-4).
right(1-3, 2-3).
right(2-3, 3-3).
right(3-3, 4-3).
right(1-1, 2-1).
right(2-1, 3-1).

