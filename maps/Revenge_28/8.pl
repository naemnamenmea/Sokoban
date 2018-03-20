:- dynamic initial/1.

initial(state(agent(2-3), boxes([2-8, 4-8, 3-7, 2-6, 4-6, 4-5, 6-5, 2-4, 1-3, 6-3]))).

:- dynamic target/1.

target([1-7, 3-7, 2-6, 4-6, 2-5, 3-5, 4-5, 1-4, 4-4, 1-3]).

:- dynamic top/2.

top(2-8, 2-9).
top(3-8, 3-9).
top(4-8, 4-9).
top(1-7, 1-8).
top(3-7, 3-8).
top(4-7, 4-8).
top(1-6, 1-7).
top(3-6, 3-7).
top(4-6, 4-7).
top(5-6, 5-7).
top(6-6, 6-7).
top(7-6, 7-7).
top(1-5, 1-6).
top(2-5, 2-6).
top(3-5, 3-6).
top(4-5, 4-6).
top(6-5, 6-6).
top(7-5, 7-6).
top(1-4, 1-5).
top(2-4, 2-5).
top(4-4, 4-5).
top(6-4, 6-5).
top(7-4, 7-5).
top(1-3, 1-4).
top(2-3, 2-4).
top(6-3, 6-4).
top(7-3, 7-4).
top(1-2, 1-3).
top(6-2, 6-3).
top(7-2, 7-3).
top(1-1, 1-2).
top(6-1, 6-2).
top(7-1, 7-2).

:- dynamic right/2.

right(2-9, 3-9).
right(3-9, 4-9).
right(1-8, 2-8).
right(2-8, 3-8).
right(3-8, 4-8).
right(3-7, 4-7).
right(4-7, 5-7).
right(5-7, 6-7).
right(6-7, 7-7).
right(1-6, 2-6).
right(2-6, 3-6).
right(3-6, 4-6).
right(4-6, 5-6).
right(5-6, 6-6).
right(6-6, 7-6).
right(1-5, 2-5).
right(2-5, 3-5).
right(3-5, 4-5).
right(6-5, 7-5).
right(1-4, 2-4).
right(4-4, 5-4).
right(5-4, 6-4).
right(6-4, 7-4).
right(1-3, 2-3).
right(6-3, 7-3).
right(6-2, 7-2).
right(1-1, 2-1).
right(2-1, 3-1).
right(3-1, 4-1).
right(4-1, 5-1).
right(5-1, 6-1).
right(6-1, 7-1).

