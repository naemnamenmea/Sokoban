:- dynamic initial/1.

initial(state(agent(4-4), boxes([6-4, 7-3]))).

:- dynamic target/1.

target([7-3, 6-1]).

:- dynamic top/2.

top(1-5, 1-6).
top(2-5, 2-6).
top(3-5, 3-6).
top(7-5, 7-6).
top(8-5, 8-6).
top(9-5, 9-6).
top(3-4, 3-5).
top(4-4, 4-5).
top(6-4, 6-5).
top(7-4, 7-5).
top(4-3, 4-4).
top(5-3, 5-4).
top(6-3, 6-4).
top(7-3, 7-4).
top(5-2, 5-3).
top(6-2, 6-3).
top(7-2, 7-3).
top(6-1, 6-2).

:- dynamic right/2.

right(1-6, 2-6).
right(2-6, 3-6).
right(7-6, 8-6).
right(8-6, 9-6).
right(1-5, 2-5).
right(2-5, 3-5).
right(3-5, 4-5).
right(6-5, 7-5).
right(7-5, 8-5).
right(8-5, 9-5).
right(3-4, 4-4).
right(4-4, 5-4).
right(5-4, 6-4).
right(6-4, 7-4).
right(4-3, 5-3).
right(5-3, 6-3).
right(6-3, 7-3).
right(5-2, 6-2).
right(6-2, 7-2).

