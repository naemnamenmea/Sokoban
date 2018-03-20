:- dynamic initial/1.

initial(state(agent(3-1), boxes([2-2]))).

:- dynamic target/1.

target([1-3]).

:- dynamic top/2.

top(1-1,1-2).
top(1-2,1-3).
top(2-1,2-2).
top(2-2,2-3).
top(3-1,3-2).
top(3-2,3-3).

:- dynamic right/2.

right(1-1,2-1).
right(2-1,3-1).
right(1-2,2-2).
right(2-2,3-2).
right(1-3,2-3).
right(2-3,3-3).