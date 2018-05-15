:- dynamic initial/1.

initial(state(agent(6-7), boxes([5-6, 6-6, 6-4, 5-3, 5-2]))).

:- dynamic target/1.

target([6-7, 7-5, 6-3, 4-2, 6-2]).

:- dynamic top/2.

top(5-6, 5-7).
top(6-6, 6-7).
top(5-5, 5-6).
top(6-5, 6-6).
top(5-4, 5-5).
top(6-4, 6-5).
top(7-4, 7-5).
top(5-3, 5-4).
top(6-3, 6-4).
top(7-3, 7-4).
top(3-2, 3-3).
top(4-2, 4-3).
top(5-2, 5-3).
top(6-2, 6-3).
top(7-2, 7-3).
top(5-1, 5-2).
top(6-1, 6-2).
top(7-1, 7-2).

:- dynamic right/2.

right(5-7, 6-7).
right(5-6, 6-6).
right(5-5, 6-5).
right(6-5, 7-5).
right(5-4, 6-4).
right(6-4, 7-4).
right(3-3, 4-3).
right(4-3, 5-3).
right(5-3, 6-3).
right(6-3, 7-3).
right(3-2, 4-2).
right(4-2, 5-2).
right(5-2, 6-2).
right(6-2, 7-2).
right(5-1, 6-1).
right(6-1, 7-1).

