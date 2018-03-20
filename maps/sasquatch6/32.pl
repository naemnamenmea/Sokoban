:- dynamic initial/1.

initial(state(agent(6-6), boxes([3-9, 5-9, 7-9, 9-9, 4-8, 6-8, 8-8, 3-7, 5-7, 7-7, 9-7, 4-6, 8-6, 3-5, 5-5, 7-5, 9-5, 4-4, 6-4, 8-4, 3-3, 5-3, 7-3, 9-3]))).

:- dynamic target/1.

target([4-9, 6-9, 8-9, 3-8, 5-8, 7-8, 9-8, 4-7, 6-7, 8-7, 3-6, 5-6, 7-6, 9-6, 4-5, 6-5, 8-5, 3-4, 5-4, 7-4, 9-4, 4-3, 6-3, 8-3]).

:- dynamic top/2.

top(1-10, 1-11).
top(3-10, 3-11).
top(9-10, 9-11).
top(11-10, 11-11).
top(1-9, 1-10).
top(3-9, 3-10).
top(4-9, 4-10).
top(5-9, 5-10).
top(7-9, 7-10).
top(8-9, 8-10).
top(9-9, 9-10).
top(11-9, 11-10).
top(2-8, 2-9).
top(3-8, 3-9).
top(4-8, 4-9).
top(5-8, 5-9).
top(6-8, 6-9).
top(7-8, 7-9).
top(8-8, 8-9).
top(9-8, 9-9).
top(10-8, 10-9).
top(2-7, 2-8).
top(3-7, 3-8).
top(4-7, 4-8).
top(5-7, 5-8).
top(6-7, 6-8).
top(7-7, 7-8).
top(8-7, 8-8).
top(9-7, 9-8).
top(10-7, 10-8).
top(3-6, 3-7).
top(4-6, 4-7).
top(5-6, 5-7).
top(6-6, 6-7).
top(7-6, 7-7).
top(8-6, 8-7).
top(9-6, 9-7).
top(3-5, 3-6).
top(4-5, 4-6).
top(5-5, 5-6).
top(6-5, 6-6).
top(7-5, 7-6).
top(8-5, 8-6).
top(9-5, 9-6).
top(2-4, 2-5).
top(3-4, 3-5).
top(4-4, 4-5).
top(5-4, 5-5).
top(6-4, 6-5).
top(7-4, 7-5).
top(8-4, 8-5).
top(9-4, 9-5).
top(10-4, 10-5).
top(2-3, 2-4).
top(3-3, 3-4).
top(4-3, 4-4).
top(5-3, 5-4).
top(6-3, 6-4).
top(7-3, 7-4).
top(8-3, 8-4).
top(9-3, 9-4).
top(10-3, 10-4).
top(1-2, 1-3).
top(3-2, 3-3).
top(4-2, 4-3).
top(5-2, 5-3).
top(7-2, 7-3).
top(8-2, 8-3).
top(9-2, 9-3).
top(11-2, 11-3).
top(1-1, 1-2).
top(3-1, 3-2).
top(9-1, 9-2).
top(11-1, 11-2).

:- dynamic right/2.

right(1-11, 2-11).
right(2-11, 3-11).
right(9-11, 10-11).
right(10-11, 11-11).
right(3-10, 4-10).
right(4-10, 5-10).
right(7-10, 8-10).
right(8-10, 9-10).
right(1-9, 2-9).
right(2-9, 3-9).
right(3-9, 4-9).
right(4-9, 5-9).
right(5-9, 6-9).
right(6-9, 7-9).
right(7-9, 8-9).
right(8-9, 9-9).
right(9-9, 10-9).
right(10-9, 11-9).
right(2-8, 3-8).
right(3-8, 4-8).
right(4-8, 5-8).
right(5-8, 6-8).
right(6-8, 7-8).
right(7-8, 8-8).
right(8-8, 9-8).
right(9-8, 10-8).
right(2-7, 3-7).
right(3-7, 4-7).
right(4-7, 5-7).
right(5-7, 6-7).
right(6-7, 7-7).
right(7-7, 8-7).
right(8-7, 9-7).
right(9-7, 10-7).
right(3-6, 4-6).
right(4-6, 5-6).
right(5-6, 6-6).
right(6-6, 7-6).
right(7-6, 8-6).
right(8-6, 9-6).
right(2-5, 3-5).
right(3-5, 4-5).
right(4-5, 5-5).
right(5-5, 6-5).
right(6-5, 7-5).
right(7-5, 8-5).
right(8-5, 9-5).
right(9-5, 10-5).
right(2-4, 3-4).
right(3-4, 4-4).
right(4-4, 5-4).
right(5-4, 6-4).
right(6-4, 7-4).
right(7-4, 8-4).
right(8-4, 9-4).
right(9-4, 10-4).
right(1-3, 2-3).
right(2-3, 3-3).
right(3-3, 4-3).
right(4-3, 5-3).
right(5-3, 6-3).
right(6-3, 7-3).
right(7-3, 8-3).
right(8-3, 9-3).
right(9-3, 10-3).
right(10-3, 11-3).
right(3-2, 4-2).
right(4-2, 5-2).
right(7-2, 8-2).
right(8-2, 9-2).
right(1-1, 2-1).
right(2-1, 3-1).
right(9-1, 10-1).
right(10-1, 11-1).

