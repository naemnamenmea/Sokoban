:- dynamic initial/1.

initial(state(agent(6-5), boxes([4-6, 3-5, 4-5, 5-5, 5-4]))).

:- dynamic target/1.

target([2-7, 4-7, 4-6, 4-5, 6-5]).

:- dynamic top/2.

top(4-7, 4-8).
top(5-7, 5-8).
top(2-6, 2-7).
top(3-6, 3-7).
top(4-6, 4-7).
top(5-6, 5-7).
top(3-5, 3-6).
top(4-5, 4-6).
top(5-5, 5-6).
top(3-4, 3-5).
top(4-4, 4-5).
top(5-4, 5-5).
top(6-4, 6-5).
top(3-3, 3-4).
top(4-3, 4-4).
top(3-2, 3-3).
top(4-2, 4-3).
top(3-1, 3-2).
top(4-1, 4-2).

:- dynamic right/2.

right(4-8, 5-8).
right(2-7, 3-7).
right(3-7, 4-7).
right(4-7, 5-7).
right(2-6, 3-6).
right(3-6, 4-6).
right(4-6, 5-6).
right(3-5, 4-5).
right(4-5, 5-5).
right(5-5, 6-5).
right(3-4, 4-4).
right(4-4, 5-4).
right(5-4, 6-4).
right(3-3, 4-3).
right(3-2, 4-2).
right(3-1, 4-1).

