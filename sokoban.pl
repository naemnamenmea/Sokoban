/*
:- module(sokoban,
[
    final/1,    
    solve_map2/0
]).
*/

final(state(_, boxes(B))) :- target(T), eq_lists(T,B).
%final(state(_, boxes(B))) :- target(T), subset(B,T).

eq_lists(L1,L2) :- subset(L1,L2), subset(L2,L1).
 
move(state(agent(P0), boxes(Bxs0)), state(agent(P1), boxes([P2|Bxs1])), "R") :- right(P0,P1), right(P1,P2), member(P1,Bxs0), \+ banned(r,P2,Bxs0), select(P1,Bxs0,Bxs1).
move(state(agent(P0), boxes(Bxs0)), state(agent(P1), boxes([P2|Bxs1])), "L") :- right(P1,P0), right(P2,P1), member(P1,Bxs0), \+ banned(l,P2,Bxs0), select(P1,Bxs0,Bxs1).
move(state(agent(P0), boxes(Bxs0)), state(agent(P1), boxes([P2|Bxs1])), "U") :- top(P0,P1), top(P1,P2), member(P1,Bxs0), \+ banned(u,P2,Bxs0), select(P1,Bxs0,Bxs1).
move(state(agent(P0), boxes(Bxs0)), state(agent(P1), boxes([P2|Bxs1])), "D") :- top(P1,P0), top(P2,P1), member(P1,Bxs0), \+ banned(d,P2,Bxs0), select(P1,Bxs0,Bxs1).

move(state(agent(P0), boxes(Boxes)), state(agent(P1), boxes(Boxes)), "r") :- right(P0,P1), \+ member(P1,Boxes).
move(state(agent(P0), boxes(Boxes)), state(agent(P1), boxes(Boxes)), "l") :- right(P1,P0), \+ member(P1,Boxes).
move(state(agent(P0), boxes(Boxes)), state(agent(P1), boxes(Boxes)), "u") :- top(P0,P1), \+ member(P1,Boxes).
move(state(agent(P0), boxes(Boxes)), state(agent(P1), boxes(Boxes)), "d") :- top(P1,P0), \+ member(P1,Boxes).


blind_search(A,state(_, boxes(B)),I,N,_,[P]) :- move(A,state(_, boxes(B1)),P), eq_lists(B,B1), !.
blind_search(_,_,I,N,_,_) :- I >= N, !, fail.
blind_search(A,C,I,N,H,[P|Pass]) :- move(A,B,P), \+ member(B,H), I1 is I+1, blind_search(B,C,I1,N,[B|H],Pass).

banned(_,X-Y,Boxes) :- member(X-Y,Boxes), !.
banned(l,X-Y,Boxes) :- target(T), \+ member(X-Y,T), Xl is X-1, Yd is Y-1, Yu is Y+1, deadlock(Xl-Y, Xl-Yd, Xl-Yu, X-Yu, X-Yd, Boxes).
banned(r,X-Y,Boxes) :- target(T), \+ member(X-Y,T), Xr is X+1, Yd is Y-1, Yu is Y+1, deadlock(Xr-Y, Xr-Yu, Xr-Yd, X-Yd, X-Yu, Boxes).
banned(u,X-Y,Boxes) :- target(T), \+ member(X-Y,T), Xl is X-1, Xr is X+1, Yu is Y+1, deadlock(X-Yu, Xl-Yu, Xr-Yu, Xr-Y, Xl-Y, Boxes).
banned(d,X-Y,Boxes) :- target(T), \+ member(X-Y,T), Xl is X-1, Xr is X+1, Yd is Y-1, deadlock(X-Yd, Xr-Yd, Xl-Yd, Xl-Y, Xr-Y, Boxes).

wall(P) :- \+ ( right(_,P) ; right(P,_) ; top(_,P) ; top(P,_) ).
target_place(P) :- target(T), member(P,T).

blocked(X-Y,Boxes) :- wall(X-Y) ; member(X-Y,Boxes).

%добавить проверку на попадание в стиации:
%1. передвижение ящика к стенке в положение не являющиеся конечным и слева и справа от новой позиции нет конечным позиций + ящик нельзя сдвинуть вперед, относительно текущего движения больше никак.
%2. проверять позиции которые однозначно приводят к тупикам.

distance(X1-Y1,X2-Y2,D) :- D is sqrt((X2-X1)^2 + (Y2-Y1)^2).

%f(R) :- initial(state(_,boxes(Boxes))), find_shortest_total_way(Boxes,R). %test func

find_shortest_total_way(Boxes,Res) :- target(TBoxes), findall(X,find_way_cost(Boxes,TBoxes,X),N), min_list(N,Res).

find_way_cost([],[],0).
find_way_cost([Box|Boxes],AvPos,N) :- member(Pos,AvPos), reachable_by_sokoban(Box,Pos,[Box],[],D), select(Pos,AvPos,RemAvPos), find_way_cost(Boxes,RemAvPos,N1), N is N1+D.
/*
f_t_c(_,[],[]).
f_t_c(S,[Box|Boxes],[N|Cost]) :- neib(Box,BoxN,_), reachable_by_sokoban(S,BoxN,[S],[],N), f_t_c(S,Boxes,Cost).

find_total_cost(_,[],[]).
find_total_cost([CB|Other],P,[N|Cost]) :- f_t_c(CB,P,N), max(Cost,Max), find_value(Cost,Max,Res), find_total_cost(Other,Boxes,Cost).

ker(E,0) :- abs(E,Ea), Ea>1, !.
ker(E,V) :- V is 3/4*(1-E^2).

find_value([],_,0).
find_value([H|T],Max,Res) :- H1 is H/Max, ker(H1,V1), find_value(T,Max,V2), Res is V1+V2.
*/
%количество ящиков не на своих местах и сумма минимальных количеств ходов, требуемых для перемещения каждого ящика при отсутствии других ящиков

get_circle_center(CoordList,X1-Y1) :- 
    length(CoordList,N),
    get_xy_sum(CoordList,X-Y),
    X1 is X / N,
    Y1 is Y / N.
    
get_xy_sum([],0-0).
get_xy_sum([X-Y|T],XC1-XC1) :- 
    get_xy_sum(T,XC-YC),
    XC1 is XC + X,
    YC1 is YC + Y.
/*
asserta(start(P1)).
asserta(goal(P2)).
asserta(next(V,V1,1,_) :- move(V,V1)).
asserta(h(P1,_,Val) :- goal(P2), distance(P1,P2,Val)).

start(Start), 'A*'(Start,Sol,_), length(Sol,L)
*/ 
/*
insert_in_ascending_list(X, [], [X]).
insert_in_ascending_list(X, [Y|Tail], [X,Y|Tail]) :-
    X @< Y, !.
insert_in_ascending_list(X, [Y|T0], [Y|Tail]) :-
    insert_in_ascending_list(X, T0, Tail).    
*/ 
/*
'A*'(Start, Sol) :- h(Start, _, F), a_star( [ v( Start, noparent, 0, F) ], [ ] , Sol ).

a_star( Opens, Closes, Sol ) :- 
	Opens = [v(V, Prev ,_,_)|_], goal(V), !,
	build_path(Prev, Closes, [V], Sol).
a_star( [v(V,Prev,G,F)|Opens], Closes, Sol ) :-
	findall( v(V1,V,G1,F1), (next(V,V1,C,D) ,
	not( member(v(V1,_,_,_), Opens) ),
	not( member(V1-_, Closes) ), G1 is G+C,
	h(V1,D,H1), F1 is G1+H1), Childs ),
	ord_insert_list( Childs, Opens, NewOpens ),
	a_star( NewOpens, [V-Prev|Closes], Sol ).
a_star([],_,fail).
*/
%%%insert_pair_in_ascending_list_by_sec_el_as_key
insert(P, V, [], [], [P], [V]).
insert(P0, V0, [P|Tp], [V|Tv], [P0,P|Tp], [V0,V|Tv]) :-
    V0 @< V, !.
insert(P0, V0, [P|Tp0], [V|Tv0], [P|Tp], [V|Tv]) :-
    insert(P0, V0, Tp0, Tv0, Tp, Tv).
   
get_min_way_cost(_,[],[],[]).
get_min_way_cost(Box,[Target|T],PosNew,ValNew) :-     
    %aSearch( Box,Target,P ),
    %length(P,V),
    distance(Box,Target,V),
    get_min_way_cost(Box,T,Pos,Val), !,
    insert(Target,V,Pos,Val,PosNew,ValNew).
    
get_summary_way_cost([],_,0).
get_summary_way_cost([Box|Boxes],TB,TotalCost) :- 
    get_min_way_cost(Box,TB,[_|TB1],[Cost|_]), 
    get_summary_way_cost(Boxes,TB1,PrevCost), !,
    TotalCost is PrevCost + Cost.
    
evFunc(state(agent(A), boxes(Boxes)),P,Val1) :- 
    boxes_in_pos(Boxes,N),
    get_circle_center(Boxes,C1),
    target(T),
    get_circle_center(T,C2),
    distance(C1,C2,D),
    distance(A,C1,D1),
    length(Boxes,Cnt),
    %count_pushes(Path,Pushes),
    get_summary_way_cost(Boxes,T,V),
    Val is (Cnt / (N+1) + D + V + D1) ** 3,
    ((P == "L" ; P == "R" ; P == "U" ; P == "D") -> Val1 = Val ; Val1 is Val - 0).
/*
evFunc(state(agent(P), boxes(Boxes)),Val) :- 
    target(B),
    unmatches(Boxes,B,N),
    find_shortest_total_way(Boxes,Cost), %от каждой коробки до каждой целевой позиции
    Val is N+Cost.
*/
unmatches(B,TB,N) :- boxes_in_pos(B,N1), length(TB,T), N is T-N1.
    
boxes_in_pos([],0) :- !.
boxes_in_pos([H|T],N1) :- target(L), member(H,L), !, boxes_in_pos(T,N), N1 is N+1.
boxes_in_pos([_|T],N) :- boxes_in_pos(T,N).

deadlock(U, UL, UR, R, L, B) :- 
	( wall(U), (wall(L) ; wall(R))) ;
	(blocked(U,B), (blocked(L,B), blocked(UL,B) ; blocked(R,B), blocked(UR,B)) ).		

/*  
deadlock(U, UL, UR, R, L, Boxes) :- 
	( wall(U), (wall(L) ; wall(R) ; (member(L,Boxes),blocked(UL,Boxes)) ; (member(R,Boxes),blocked(UR,Boxes))) ) ;
	( member(U,Boxes), ((blocked(L,Boxes),blocked(UL,Boxes)) ; (blocked(R,Boxes),blocked(UR,Boxes))) ).		
*/    
    
count_pushes([],0) :- !.
count_pushes([H|T],N1) :- (H == "L" ; H == "R" ; H == "D" ; H == "U"), !, count_pushes(T,N), N1 is N+1.
count_pushes([_|T],N) :- count_pushes(T,N).	
    
    
/*    
manhattan(A,R) :- goal(B), sumDists(A,B,0,R).

sumDists(Pos1,Pos2,R0,R) :- Pos1=[[H|T]|TT], coord(H,Pos1,X1-Y1), coord(H,Pos2,X2-Y2),
                            R1 is R0+abs(X2-X1)+abs(Y2-Y1), sumDists([T|TT],Pos2,R1,R).
sumDists([[]|TT],Pos2,R0,R) :- sumDists(TT,Pos2,R0,R).
sumDists([],_,R,R).

coord(C,[[C|T]|TT],X-Y) :- length(T,X), length(TT,Y), !.
coord(C,[[_|T]|TT],X-Y) :- coord(C,[T|TT],X-Y).
coord(C,[[]|TT],X-Y) :- coord(C,TT,X-Y).
*/
%***********************************************************************************
	
%'A*'(Sol) :- start(Start), 'A*'(Start, Sol, OpenNum-ClosedNum), nl, Vnum is OpenNum+ClosedNum, write( ('перебрано'-Vnum, 'из них раскрыто'-ClosedNum) ).
/*
solve_map(Map) :- 
    load_map(Map),
    solvable(load),
    statistics(runtime,_), 
    ( (load_sol(Map), test_sol(Map)) -> true ; 
        %(initial(A), final(C), N=20, blind_search(A,C,0,N,A,Path)) 
        aSearch(Path)
    ), !, 
    (var(Path) -> 
        write('sol found\nPass: '),
        solution(Path)  
    ; 
        write('new sol\nPass: '),
        retractall(solution(_)), 
        assert(solution(Path)),
        save_sol(Map)
    ),
    printList(Path,'',' '), nl,
    length(Path,Moves),
    count_pushes(Path,Pushes),
    format('m/p: ~w/~w~n',[Moves,Pushes]),
    statistics(runtime, [_,T]), format('CPU time = ~w msec',[T]).
*/    
solve_map(Map) :- 
    load_map(Map),
    (solvable(load) ->
    (statistics(runtime,_), 
    (( (load_sol(Map), test_sol(Map)) -> true ; 
        %(initial(A), final(C), N=20, blind_search(A,C,0,N,A,Path)) 
        aSearch(Path)
    ) -> 
    (!, (var(Path) -> 
        write('sol found\nPass: '),
        solution(Path)  
    ; 
        write('new sol\nPass: '),
        retractall(solution(_)), 
        assert(solution(Path)),
        save_sol(Map)
    ),
    printList(Path,'',' '), nl,
    length(Path,Moves),
    count_pushes(Path,Pushes),
    format('m/p: ~w/~w~n',[Moves,Pushes]),
    statistics(runtime, [_,T]), format('CPU time = ~w msec',[T])) ; format('Unsolvable.'))) ; format('Unsolvable: simple check.')).
   
aSearch(P) :- start(Start), 'A*'(Start,Sol,_), steps(Sol,P).

/***************************************************************************/

steps([X,Y|T],[P|NextPath]) :- move(X,Y,P), steps([Y|T],NextPath).
steps([_],[]).
steps([],[]).

'A*'(Start, Sol, OpenNum-ClosedNum) :- h(Start, _, F), a_star( [ v( Start, noparent, 0, F) ], [ ] , Sol-(OpenNum-ClosedNum) ).
/*%DELETE
a_star( [v(V,Prev,G,F)|Opens], Closes, Sol-(_-_) ) :- G == 25, !,
	build_path(Prev, Closes, [V], Sol).
%DELETE*/
a_star( Opens, Closes, Sol-(OpenNum-ClosedNum) ) :- 
	Opens = [v(V, Prev ,_,_)|_], goal(V), !,
	build_path(Prev, Closes, [V], Sol), 
	length(Opens, OpenNum), length(Closes, ClosedNum).

a_star( [v(V,Prev,G,F)|Opens], Closes, Sol ) :-
	findall( v(V1,V,G1,F1), (next(V,V1,C,D) ,
	not( member(v(V1,_,_,_), Opens) ),
	not( member(V1-_, Closes) ), G1 is G+C,
	h(V1,D,H1), F1 is G1+H1, format('~w ~w~n',[G1,H1]), nl), Childs),
	ord_insert_list( Childs, Opens, NewOpens ),
	a_star( NewOpens, [V-Prev|Closes], Sol ).

a_star([],_,fail).

build_path( noparent ,_, Path, Path ).
build_path( V, Closes, Path0, Path) :- member(V-Parent, Closes), build_path( Parent, Closes, [V|Path0], Path ).

ord_insert_list( [V|T1], L2, L3 ) :- ord_insert(V,L2,L22), ord_insert_list(T1,L22,L3).
ord_insert_list([],L3,L3).

ord_insert(V,[],[V]).
ord_insert(V,[H|T],[V,H|T]) :- V=v(_,_,_,F1), H=v(_,_,_,F2), F1=<F2, !.
ord_insert(V,[H|T],[H|T2]) :- ord_insert(V,T,T2).

%-- настройка на предметную область :
start(V) :- initial(V).
goal(V) :- final(V).
next(V,V1,1,AddData) :- move(V,V1,AddData).
%h(Pos,_,0).
h(Pos,AddData,Val) :- evFunc(Pos,AddData,Val). % выбор оценочной функции для поиска

/***************************************************************************/

neib(Loc1,Loc2,up):- top(Loc1,Loc2).
neib(Loc1,Loc2,down):- top(Loc2,Loc1).
neib(Loc1,Loc2,right):- right(Loc1,Loc2).
neib(Loc1,Loc2,left):- right(Loc2,Loc1).

r_b_s([pair(Loc3,_)|_],Loc2,History,BoxLocs,N1) :- reachable_by_sokoban(Loc3,Loc2,[Loc3|History],BoxLocs,N), N1 is N+1, !.
r_b_s([_|T],Loc2,History,BoxLocs,N) :- r_b_s(T,Loc2,History,BoxLocs,N).
/*
reachable_by_sokoban(Loc1,Loc2,_,_,0) :- neib(Loc1,Loc2,_), !. %можно использовать функцию расстояния
reachable_by_sokoban(Loc1,Loc2,History,BoxLocs,N):-
    neib(Loc1,Loc3,_),
    \+ member(Loc3,BoxLocs),
    \+ member(Loc3,History),
    reachable_by_sokoban(Loc3,Loc2,[Loc3|History],BoxLocs,N1), N is N1+1.
*/

reachable_by_sokoban(Loc,Loc,H,_,0) :- !.%reverse(H,H1), printList(H1,'','   '), !. %можно использовать функцию расстояния
reachable_by_sokoban(Loc1,Loc2,History,BoxLocs,N):- %Передавать в  эту функцию  Loc1 при запуске & при желании можно вытянуть сам кратчайший путь
    bagof(
        pair(Loc3,D), (
        neib(Loc1,Loc3,_),
        \+ member(Loc3,BoxLocs),
        \+ member(Loc3,History),
        distance(Loc3,Loc2,D)
        ),
        Cases
    ),
    sort(2,@=<,Cases,Sorted), %printList(Sorted), nl,
    r_b_s(Sorted,Loc2,History,BoxLocs,N).
    
/***************************************************************************/
/* Unit tests                                                              */
/***************************************************************************/
/*
:- begin_tests(sokoban).
%test(smth) :- smth.
:- end_tests(sokoban).
%:- run_tests.
*/
/***************************************************************************/
/* OTHER                                                                   */
/***************************************************************************/

/* A corner is a square which has at most one neighbour square in vertical */
/* and one in horizontal. It is defined using the counter-rule noncorner.  */
corner(X) :- \+ noncorner(X).
noncorner(X) :- top(_,X),top(X,_).
noncorner(X) :- right(_,X),right(X,_).


/* Some position for boxes must be avoided (unless they are solutions)     */
/* because the Sokoban won't be able to move them further:                 */
/*  - corners: the Sokoban can't move a box which is placed at a corner.   */
stuck(X) :-
    \+ solution(X),
    corner(X).

/*  - horizontally adjacent boxes can only be moved up or down... if there */
/*    are empty squares for the Sokoban to push and for the boxes to move. */
stuck(X, Y) :-
    (right(X,Y); right(Y,X)),
    (\+ solution(X); \+ solution(Y)),
    (\+ top(X,_); \+ top(_,X)),
    (\+ top(Y,_); \+ top(_,Y)).

/*  - vertically adjacent boxes can only be moved right or left... if there*/
/*    are empty squares for the Sokoban to push and for the boxes to move. */
stuck(X, Y) :-
    (top(X,Y); top(Y,X)),
    (\+ solution(X); \+ solution(Y)),
    (\+ right(X,_); \+ right(_,X)),
    (\+ right(Y,_); \+ right(_,Y)).

/* The Sokoban can move to any empty position in the board, but cannot go  */
/* through boxes.                                                          */
can_reach(P1, P1, _Boxes, _Visited).
can_reach(P1, P2, Boxes, _Visited) :-
    neib(P1, P2, _),
    \+ member(P2, Boxes).
can_reach(P1, P2, Boxes, Visited) :-
    neib(P1, P3, _),
    P3 \== P2,
    \+ member(P3, Visited),
    \+ member(P3, Boxes),
    can_reach(P3, P2, Boxes, [P3|Visited]).

/* A good place to move a box is one that:                                 */
/*  - is not already occupied by a box.                                    */
/*  - is not one of the positions to avoid regarding the board and boxes.  */
good_move(X, Boxes) :-
    \+ member(X, Boxes),
    \+ stuck(X),
    foreach(member(Box, Boxes), \+ stuck(X, Box)).

/* Selection of a good movement given a state:                             */
/*  - any valid movement for every box                                     */
/*  - the Sokoban must be able to access the push position                 */
movement(state(Sokoban, Boxes), move(Box, Dir)) :-
    select(Box, Boxes, BoxesRemain),
    neib(Box, NextLoc, Dir),
    good_move(NextLoc, BoxesRemain),
    neib(PushPosition, Box, Dir),
    /*can_reach(Sokoban, PushPosition, Boxes, []),*/ /* Enable this rule to consider Sokoban movement constraint */
    \+ member(PushPosition, Boxes).


update(state(_Sokoban, Boxes), move(Box, Dir), state(NewSokoban, NewBoxes)) :-
    NewSokoban = Box,
    subtract(Boxes, [Box], TempList),
    neib(Box, NewPosition, Dir),
    append(TempList, [NewPosition], NewBoxes).
    
solve_dfs(Problem, State, _History, []) :-
    final_state(Problem, State).

/* If not, we have to explore new states                                   */
solve_dfs(Problem, State, History, [Move|Moves]) :-
    movement(State, Move),
    update(State, Move, NewState),
    \+ member(NewState, History),   /* No quiero ciclos en el grafo de búsqueda */
    solve_dfs(Problem, NewState, [NewState|History], Moves).

/* Actually solve the problem                                              */
solve_problem(Problem, Solution) :-
    format('=============~n'),
    format('|| Problem: ~w~n', Problem),
    format('=============~n'),
    initial_state(Problem, Initial),
    format('Initial state: ~w~n', Initial),
    solve_dfs(Problem, Initial, [Initial], Solution).    
    
/***************************************************************************/
/*                                                                OTHER    */
/***************************************************************************/    