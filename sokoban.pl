/*
:- module(sokoban,
[
    final/1,
    eq_lists/2,
    move/3,
    blind_search/6,
    banned/3,
    wall/1,
    blocked/2,
    distance/3,
    find_shortest_total_way/2,
    find_way_cost/3,
    evFunc/2,
    unmatches/3,
    boxes_in_pos/3,
    tupik/6,
    aSearch/1,
    pos2alg/3,
    'A*'/3,
    a_star/3,
    neib/3,
    r_b_s/5,
    reachable_by_sokoban/5,
    build_path/4,
    ord_insert_list/3,
    ord_insert/3,
    start/1,
    goal/1,
    next/3,
    h/2,
    solve_map/1,    
    solve_map2/0
]).
*/

final(state(_, boxes(B))) :- target(T), eq_lists(T,B).
%final(state(_, boxes(B))) :- target(T), subset(B,T).

eq_lists(L1,L2) :- subset(L1,L2), subset(L2,L1).
 
move(state(agent(P0), boxes(Bxs0)), state(agent(P1), boxes([P2|Bxs1])), pR) :- right(P0,P1), right(P1,P2), member(P1,Bxs0), \+ banned(r,P2,Bxs0), select(P1,Bxs0,Bxs1).
move(state(agent(P0), boxes(Bxs0)), state(agent(P1), boxes([P2|Bxs1])), pL) :- right(P1,P0), right(P2,P1), member(P1,Bxs0), \+ banned(l,P2,Bxs0), select(P1,Bxs0,Bxs1).
move(state(agent(P0), boxes(Bxs0)), state(agent(P1), boxes([P2|Bxs1])), pU) :- top(P0,P1), top(P1,P2), member(P1,Bxs0), \+ banned(u,P2,Bxs0), select(P1,Bxs0,Bxs1).
move(state(agent(P0), boxes(Bxs0)), state(agent(P1), boxes([P2|Bxs1])), pD) :- top(P1,P0), top(P2,P1), member(P1,Bxs0), \+ banned(d,P2,Bxs0), select(P1,Bxs0,Bxs1).

move(state(agent(P0), boxes(Boxes)), state(agent(P1), boxes(Boxes)), r) :- right(P0,P1), \+ blocked(P1,Boxes).
move(state(agent(P0), boxes(Boxes)), state(agent(P1), boxes(Boxes)), l) :- right(P1,P0), \+ blocked(P1,Boxes).
move(state(agent(P0), boxes(Boxes)), state(agent(P1), boxes(Boxes)), u) :- top(P0,P1), \+ blocked(P1,Boxes).
move(state(agent(P0), boxes(Boxes)), state(agent(P1), boxes(Boxes)), d) :- top(P1,P0), \+ blocked(P1,Boxes).

blind_search(A,state(_, boxes(B)),_,_,_,[P]) :- move(A,state(_, boxes(B1)),P), eq_lists(B,B1), !.
blind_search(_,_,N,N,_,_) :- !, fail.
blind_search(A,C,I,N,H,[P|Pass]) :- move(A,B,P), \+ member(B,H), I1 is I+1, blind_search(B,C,I1,N,[B|H],Pass).


banned(_,X-Y,Boxes) :- blocked(X-Y,Boxes), !.
banned(l,X-Y,Boxes) :- target(T), \+ member(X-Y,T), Xl is X-1, Yd is Y-1, Yu is Y+1, tupik(Xl-Y, Xl-Yd, Xl-Yu, X-Yu, X-Yd, Boxes).
banned(r,X-Y,Boxes) :- target(T), \+ member(X-Y,T), Xr is X+1, Yd is Y-1, Yu is Y+1, tupik(Xr-Y, Xr-Yu, Xr-Yd, X-Yd, X-Yu, Boxes).
banned(u,X-Y,Boxes) :- target(T), \+ member(X-Y,T), Xl is X-1, Xr is X+1, Yu is Y+1, tupik(X-Yu, Xl-Yu, Xr-Yu, Xr-Y, Xl-Y, Boxes).
banned(d,X-Y,Boxes) :- target(T), \+ member(X-Y,T), Xl is X-1, Xr is X+1, Yd is Y-1, tupik(X-Yd, Xr-Yd, Xl-Yd, Xl-Y, Xr-Y, Boxes).

wall(P) :- \+ ( right(_,P) ; right(P,_) ; top(_,P) ; top(P,_) ).

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
evFunc(state(agent(P), boxes(Boxes)),Val) :- 
    target(B),
    unmatches(Boxes,B,N),
    find_shortest_total_way(Boxes,Cost), %от каждой коробки до каждой целевой позиции
    Val is N+Cost.

unmatches(B,TB,N) :- boxes_in_pos(B,TB,N1), length(TB,T), N is T-N1.
    
boxes_in_pos([],_,0) :- !.
boxes_in_pos([H|T],L,N1) :- member(H,L), !, boxes_in_pos(T,L,N), N1 is N+1.
boxes_in_pos([_|T],L,N) :- boxes_in_pos(T,L,N).
    
tupik(U, UL, UR, R, L, Boxes) :- 
	( wall(U), (wall(L) ; wall(R) ; (member(L,Boxes),blocked(UL,Boxes)) ; (member(R,Boxes),blocked(UR,Boxes))) ) ;
	( member(U,Boxes), ((blocked(L,Boxes),blocked(UL,Boxes)) ; (blocked(R,Boxes),blocked(UR,Boxes))) ).						

%***********************************************************************************
	
%'A*'(Sol) :- start(Start), 'A*'(Start, Sol, OpenNum-ClosedNum), nl, Vnum is OpenNum+ClosedNum, write( ('перебрано'-Vnum, 'из них раскрыто'-ClosedNum) ).

solve_map(Map) :- 
    load_map(Map),
    solvable(load),
    initial(A), final(C),
    statistics(runtime,_), 
    ( (load_sol(Map), test_sol(Map)) ; (N=20, blind_search(A,C,0,N,A,Pass)) ), !, 
    (var(Pass) -> 
        write('sol found\n'),
        solution(Sol),
        printList(Sol,' '), nl  
    ; 
        write('new sol\n'),
        printList(Pass,' '), nl, 
        retractall(solution(_)), 
        assert(solution(Pass)),
        save_sol(Map)
    ),
    statistics(runtime, [_,T]), write('CPU time = '), write(T), write(' msec').
    
solve_map2(Map) :- 
    load_map(Map),
    solvable(load),
    aSearch(P), 
    format('Pass: '), 
    printList(P,', ').

aSearch(P) :- start(Start), 'A*'(Start,Sol,_), pos2alg(Sol,[],Pr), reverse(Pr,P).

/***************************************************************************/

pos2alg([X,Y|T],Cs,Alg) :- move(X,Y,C), pos2alg([Y|T],[C|Cs],Alg).
pos2alg([_],Alg,Alg).
pos2alg([],Alg,Alg).

'A*'(Start, Sol, OpenNum-ClosedNum) :- h(Start, F), a_star( [ v( Start, noparent, 0, F) ], [ ] , Sol-(OpenNum-ClosedNum) ).

a_star( Opens, Closes, Sol-(OpenNum-ClosedNum) ) :- 
	Opens = [v(V, Prev ,_,_)|_], goal(V), !,
	build_path(Prev, Closes, [V], Sol), 
	length(Opens, OpenNum), length(Closes, ClosedNum).

a_star( [v(V,Prev,G,F)|Opens], Closes, Sol ) :-
	findall( v(V1,V,G1,F1), (next(V,V1,C) ,
	not( member(v(V1,_,_,_), Opens) ),
	not( member(V1-_, Closes) ), G1 is G+C,
	h(V1,H1), F1 is G1+H1), Childs ),
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
next(V,V1,1) :- move(V,V1,_).
%h(Pos,0).
h(Pos,Val) :- evFunc(Pos,Val). % выбор оценочной функции для поиска

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

reachable_by_sokoban(Loc,Loc,H,_,0) :- !.%reverse(H,H1), printList(H1,'   '), !. %можно использовать функцию расстояния
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
:- begin_tests(sokoban).
%test(smth) :- smth.
:- end_tests(sokoban).
%:- run_tests.

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