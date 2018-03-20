:- dynamic initial/1.

initial(state(agent(1-6), boxes([8-7, 2-6, 8-6, 3-5, 5-4, 6-4, 7-4, 4-3]))).

:- dynamic target/1.

target([7-5, 8-5, 5-4, 6-4, 7-4, 8-4, 5-3, 7-3]).

:- dynamic top/2.

top(5-7, 5-8).
top(6-7, 6-8).
top(7-7, 7-8).
top(8-7, 8-8).
top(9-7, 9-8).
top(3-6, 3-7).
top(7-6, 7-7).
top(8-6, 8-7).
top(2-5, 2-6).
top(3-5, 3-6).
top(7-5, 7-6).
top(8-5, 8-6).
top(4-4, 4-5).
top(5-4, 5-5).
top(6-4, 6-5).
top(7-4, 7-5).
top(8-4, 8-5).
top(9-4, 9-5).
top(4-3, 4-4).
top(5-3, 5-4).
top(7-3, 7-4).
top(8-3, 8-4).
top(9-3, 9-4).
top(4-2, 4-3).
top(5-2, 5-3).
top(4-1, 4-2).
top(5-1, 5-2).

:- dynamic right/2.

right(5-8, 6-8).
right(6-8, 7-8).
right(7-8, 8-8).
right(8-8, 9-8).
right(3-7, 4-7).
right(4-7, 5-7).
right(5-7, 6-7).
right(6-7, 7-7).
right(7-7, 8-7).
right(8-7, 9-7).
right(1-6, 2-6).
right(2-6, 3-6).
right(7-6, 8-6).
right(2-5, 3-5).
right(3-5, 4-5).
right(4-5, 5-5).
right(5-5, 6-5).
right(6-5, 7-5).
right(7-5, 8-5).
right(8-5, 9-5).
right(4-4, 5-4).
right(5-4, 6-4).
right(6-4, 7-4).
right(7-4, 8-4).
right(8-4, 9-4).
right(4-3, 5-3).
right(7-3, 8-3).
right(8-3, 9-3).
right(4-2, 5-2).
right(4-1, 5-1).

