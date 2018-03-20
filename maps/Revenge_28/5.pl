:- dynamic initial/1.

initial(state(agent(1-1), boxes([4-5, 5-5, 1-4, 2-4, 5-4, 7-4, 6-3, 2-2, 4-2, 7-2, 2-1]))).

:- dynamic target/1.

target([1-5, 2-5, 2-4, 3-4, 5-4, 2-3, 5-2, 6-2, 7-2, 7-1, 8-1]).

:- dynamic top/2.

top(4-5, 4-6).
top(5-5, 5-6).
top(6-5, 6-6).
top(8-5, 8-6).
top(1-4, 1-5).
top(2-4, 2-5).
top(4-4, 4-5).
top(5-4, 5-5).
top(6-4, 6-5).
top(8-4, 8-5).
top(1-3, 1-4).
top(2-3, 2-4).
top(3-3, 3-4).
top(4-3, 4-4).
top(6-3, 6-4).
top(7-3, 7-4).
top(8-3, 8-4).
top(2-2, 2-3).
top(4-2, 4-3).
top(6-2, 6-3).
top(7-2, 7-3).
top(2-1, 2-2).
top(4-1, 4-2).
top(5-1, 5-2).
top(6-1, 6-2).
top(7-1, 7-2).

:- dynamic right/2.

right(4-6, 5-6).
right(5-6, 6-6).
right(6-6, 7-6).
right(7-6, 8-6).
right(1-5, 2-5).
right(4-5, 5-5).
right(5-5, 6-5).
right(1-4, 2-4).
right(2-4, 3-4).
right(3-4, 4-4).
right(4-4, 5-4).
right(5-4, 6-4).
right(6-4, 7-4).
right(7-4, 8-4).
right(1-3, 2-3).
right(2-3, 3-3).
right(3-3, 4-3).
right(6-3, 7-3).
right(7-3, 8-3).
right(4-2, 5-2).
right(5-2, 6-2).
right(6-2, 7-2).
right(1-1, 2-1).
right(2-1, 3-1).
right(3-1, 4-1).
right(4-1, 5-1).
right(5-1, 6-1).
right(6-1, 7-1).
right(7-1, 8-1).

