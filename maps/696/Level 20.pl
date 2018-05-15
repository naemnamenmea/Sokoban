:- dynamic initial/1.

initial(state(agent(5-7), boxes([4-6, 6-6, 5-5, 5-3]))).

:- dynamic target/1.

target([4-7, 6-7, 4-3, 4-2]).

:- dynamic top/2.

top(4-6, 4-7).
top(5-6, 5-7).
top(6-6, 6-7).
top(7-6, 7-7).
top(3-5, 3-6).
top(4-5, 4-6).
top(5-5, 5-6).
top(6-5, 6-6).
top(4-4, 4-5).
top(5-4, 5-5).
top(4-3, 4-4).
top(5-3, 5-4).
top(4-2, 4-3).
top(5-2, 5-3).
top(4-1, 4-2).
top(5-1, 5-2).

:- dynamic right/2.

right(4-7, 5-7).
right(5-7, 6-7).
right(6-7, 7-7).
right(3-6, 4-6).
right(4-6, 5-6).
right(5-6, 6-6).
right(6-6, 7-6).
right(3-5, 4-5).
right(4-5, 5-5).
right(5-5, 6-5).
right(4-4, 5-4).
right(4-3, 5-3).
right(4-2, 5-2).
right(4-1, 5-1).

