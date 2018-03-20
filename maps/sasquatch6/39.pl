:- dynamic initial/1.

initial(state(agent(9-1), boxes([9-15, 7-13, 11-13, 4-11, 9-11, 7-10, 10-10, 13-10, 2-9, 6-9, 8-9, 9-9, 8-8, 9-8, 11-8, 15-8, 4-7, 7-7, 10-7, 8-6, 13-6, 6-4, 10-4, 8-2]))).

:- dynamic target/1.

target([8-14, 10-14, 8-12, 10-12, 3-10, 5-10, 8-10, 8-9, 9-9, 10-9, 12-9, 14-9, 3-8, 5-8, 7-8, 8-8, 9-8, 9-7, 12-7, 14-7, 7-5, 9-5, 7-3, 9-3]).

:- dynamic top/2.

top(8-15, 8-16).
top(9-15, 9-16).
top(8-14, 8-15).
top(9-14, 9-15).
top(8-13, 8-14).
top(10-13, 10-14).
top(11-13, 11-14).
top(12-13, 12-14).
top(6-12, 6-13).
top(7-12, 7-13).
top(8-12, 8-13).
top(10-12, 10-13).
top(3-11, 3-12).
top(4-11, 4-12).
top(9-11, 9-12).
top(10-11, 10-12).
top(3-10, 3-11).
top(4-10, 4-11).
top(9-10, 9-11).
top(10-10, 10-11).
top(12-10, 12-11).
top(13-10, 13-11).
top(3-9, 3-10).
top(5-9, 5-10).
top(6-9, 6-10).
top(7-9, 7-10).
top(8-9, 8-10).
top(9-9, 9-10).
top(10-9, 10-10).
top(12-9, 12-10).
top(13-9, 13-10).
top(1-8, 1-9).
top(2-8, 2-9).
top(3-8, 3-9).
top(5-8, 5-9).
top(7-8, 7-9).
top(8-8, 8-9).
top(9-8, 9-9).
top(10-8, 10-9).
top(12-8, 12-9).
top(14-8, 14-9).
top(15-8, 15-9).
top(16-8, 16-9).
top(4-7, 4-8).
top(5-7, 5-8).
top(7-7, 7-8).
top(8-7, 8-8).
top(9-7, 9-8).
top(10-7, 10-8).
top(11-7, 11-8).
top(12-7, 12-8).
top(14-7, 14-8).
top(4-6, 4-7).
top(5-6, 5-7).
top(7-6, 7-7).
top(8-6, 8-7).
top(13-6, 13-7).
top(14-6, 14-7).
top(7-5, 7-6).
top(8-5, 8-6).
top(13-5, 13-6).
top(14-5, 14-6).
top(7-4, 7-5).
top(9-4, 9-5).
top(10-4, 10-5).
top(11-4, 11-5).
top(5-3, 5-4).
top(6-3, 6-4).
top(7-3, 7-4).
top(9-3, 9-4).
top(8-2, 8-3).
top(9-2, 9-3).
top(8-1, 8-2).
top(9-1, 9-2).

:- dynamic right/2.

right(8-16, 9-16).
right(8-15, 9-15).
right(8-14, 9-14).
right(9-14, 10-14).
right(10-14, 11-14).
right(11-14, 12-14).
right(6-13, 7-13).
right(7-13, 8-13).
right(10-13, 11-13).
right(11-13, 12-13).
right(3-12, 4-12).
right(6-12, 7-12).
right(7-12, 8-12).
right(8-12, 9-12).
right(9-12, 10-12).
right(3-11, 4-11).
right(9-11, 10-11).
right(12-11, 13-11).
right(3-10, 4-10).
right(4-10, 5-10).
right(5-10, 6-10).
right(6-10, 7-10).
right(7-10, 8-10).
right(8-10, 9-10).
right(9-10, 10-10).
right(12-10, 13-10).
right(1-9, 2-9).
right(2-9, 3-9).
right(5-9, 6-9).
right(6-9, 7-9).
right(7-9, 8-9).
right(8-9, 9-9).
right(9-9, 10-9).
right(12-9, 13-9).
right(13-9, 14-9).
right(14-9, 15-9).
right(15-9, 16-9).
right(1-8, 2-8).
right(2-8, 3-8).
right(3-8, 4-8).
right(4-8, 5-8).
right(7-8, 8-8).
right(8-8, 9-8).
right(9-8, 10-8).
right(10-8, 11-8).
right(11-8, 12-8).
right(14-8, 15-8).
right(15-8, 16-8).
right(4-7, 5-7).
right(7-7, 8-7).
right(8-7, 9-7).
right(9-7, 10-7).
right(10-7, 11-7).
right(11-7, 12-7).
right(12-7, 13-7).
right(13-7, 14-7).
right(4-6, 5-6).
right(7-6, 8-6).
right(13-6, 14-6).
right(7-5, 8-5).
right(8-5, 9-5).
right(9-5, 10-5).
right(10-5, 11-5).
right(13-5, 14-5).
right(5-4, 6-4).
right(6-4, 7-4).
right(9-4, 10-4).
right(10-4, 11-4).
right(5-3, 6-3).
right(6-3, 7-3).
right(7-3, 8-3).
right(8-3, 9-3).
right(8-2, 9-2).
right(8-1, 9-1).
