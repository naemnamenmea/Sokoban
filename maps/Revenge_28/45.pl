:- dynamic initial/1.

initial(state(agent(2-2), boxes([2-6, 3-6, 6-6, 6-5, 5-4, 6-3, 3-2, 5-2, 2-1]))).

:- dynamic target/1.

target([4-7, 5-7, 6-7, 7-7, 1-6, 1-4, 7-4, 1-1, 2-1]).

:- dynamic top/2.

top(3-6, 3-7).
top(6-6, 6-7).
top(7-6, 7-7).
top(2-5, 2-6).
top(3-5, 3-6).
top(6-5, 6-6).
top(7-5, 7-6).
top(2-4, 2-5).
top(3-4, 3-5).
top(5-4, 5-5).
top(6-4, 6-5).
top(7-4, 7-5).
top(5-3, 5-4).
top(6-3, 6-4).
top(7-3, 7-4).
top(4-2, 4-3).
top(5-2, 5-3).
top(6-2, 6-3).
top(2-1, 2-2).
top(3-1, 3-2).
top(4-1, 4-2).
top(5-1, 5-2).

:- dynamic right/2.

right(3-7, 4-7).
right(4-7, 5-7).
right(5-7, 6-7).
right(6-7, 7-7).
right(1-6, 2-6).
right(2-6, 3-6).
right(6-6, 7-6).
right(2-5, 3-5).
right(3-5, 4-5).
right(4-5, 5-5).
right(5-5, 6-5).
right(6-5, 7-5).
right(1-4, 2-4).
right(2-4, 3-4).
right(5-4, 6-4).
right(6-4, 7-4).
right(4-3, 5-3).
right(5-3, 6-3).
right(6-3, 7-3).
right(2-2, 3-2).
right(3-2, 4-2).
right(4-2, 5-2).
right(5-2, 6-2).
right(1-1, 2-1).
right(2-1, 3-1).
right(3-1, 4-1).
right(4-1, 5-1).

