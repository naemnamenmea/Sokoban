:- dynamic initial/1.

initial(state(agent(5-6), boxes([3-8, 3-6, 3-5, 2-3]))).

:- dynamic target/1.

target([3-8, 3-7, 3-5, 5-5]).

:- dynamic top/2.

top(1-8, 1-9).
top(2-8, 2-9).
top(3-8, 3-9).
top(4-8, 4-9).
top(2-7, 2-8).
top(3-7, 3-8).
top(2-6, 2-7).
top(3-6, 3-7).
top(2-5, 2-6).
top(3-5, 3-6).
top(4-5, 4-6).
top(5-5, 5-6).
top(2-4, 2-5).
top(3-4, 3-5).
top(2-3, 2-4).
top(3-3, 3-4).
top(2-2, 2-3).
top(3-2, 3-3).

:- dynamic right/2.

right(1-9, 2-9).
right(2-9, 3-9).
right(3-9, 4-9).
right(1-8, 2-8).
right(2-8, 3-8).
right(3-8, 4-8).
right(2-7, 3-7).
right(2-6, 3-6).
right(3-6, 4-6).
right(4-6, 5-6).
right(2-5, 3-5).
right(3-5, 4-5).
right(4-5, 5-5).
right(2-4, 3-4).
right(2-3, 3-3).
right(2-2, 3-2).

