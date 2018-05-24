/*
:- module(sokoban,
[
    final/1,    
    solve_map2/0
]).
*/

final(state(_, boxes(B))) :- target(T), eq_lists(T,B).

eq_lists(L1,L2) :- subset(L1,L2), subset(L2,L1).
 
move(state(agent(P0), boxes(Bxs0)), state(agent(P1), boxes([P2|Bxs1])), "R") :- right(P0,P1), right(P1,P2), member(P1,Bxs0), \+ banned(r,P2,Bxs0), select(P1,Bxs0,Bxs1).
move(state(agent(P0), boxes(Bxs0)), state(agent(P1), boxes([P2|Bxs1])), "L") :- right(P1,P0), right(P2,P1), member(P1,Bxs0), \+ banned(l,P2,Bxs0), select(P1,Bxs0,Bxs1).
move(state(agent(P0), boxes(Bxs0)), state(agent(P1), boxes([P2|Bxs1])), "U") :- top(P0,P1), top(P1,P2), member(P1,Bxs0), \+ banned(u,P2,Bxs0), select(P1,Bxs0,Bxs1).
move(state(agent(P0), boxes(Bxs0)), state(agent(P1), boxes([P2|Bxs1])), "D") :- top(P1,P0), top(P2,P1), member(P1,Bxs0), \+ banned(d,P2,Bxs0), select(P1,Bxs0,Bxs1).

move(state(agent(P0), boxes(Boxes)), state(agent(P1), boxes(Boxes)), "r") :- right(P0,P1), \+ member(P1,Boxes).
move(state(agent(P0), boxes(Boxes)), state(agent(P1), boxes(Boxes)), "l") :- right(P1,P0), \+ member(P1,Boxes).
move(state(agent(P0), boxes(Boxes)), state(agent(P1), boxes(Boxes)), "u") :- top(P0,P1), \+ member(P1,Boxes).
move(state(agent(P0), boxes(Boxes)), state(agent(P1), boxes(Boxes)), "d") :- top(P1,P0), \+ member(P1,Boxes).


dfs(Start,Finish,N,Path,Info) :- dfs(Start,Finish,0,N,Start,Path,Info).
dfs(A,state(_, boxes(B)),I,N,_,[P],_) :- move(A,state(_, boxes(B1)),P), eq_lists(B,B1), !.
dfs(_,_,I,N,_,_,_) :- I >= N, !, fail.
dfs(A,C,I,N,H,[P|Pass],_) :- move(A,B,P), \+ member(B,H), I1 is I+1, dfs(B,C,I1,N,[B|H],Pass,_).

banned(_,X-Y,Boxes) :- member(X-Y,Boxes), !.
banned(l,X-Y,Boxes) :- target(T), \+ member(X-Y,T), Xl is X-1, Yd is Y-1, Yu is Y+1, deadlock(Xl-Y, Xl-Yd, Xl-Yu, X-Yu, X-Yd, Boxes).
banned(r,X-Y,Boxes) :- target(T), \+ member(X-Y,T), Xr is X+1, Yd is Y-1, Yu is Y+1, deadlock(Xr-Y, Xr-Yu, Xr-Yd, X-Yd, X-Yu, Boxes).
banned(u,X-Y,Boxes) :- target(T), \+ member(X-Y,T), Xl is X-1, Xr is X+1, Yu is Y+1, deadlock(X-Yu, Xl-Yu, Xr-Yu, Xr-Y, Xl-Y, Boxes).
banned(d,X-Y,Boxes) :- target(T), \+ member(X-Y,T), Xl is X-1, Xr is X+1, Yd is Y-1, deadlock(X-Yd, Xr-Yd, Xl-Yd, Xl-Y, Xr-Y, Boxes).

wall(P) :- \+ ( right(_,P) ; right(P,_) ; top(_,P) ; top(P,_) ).
target_place(P) :- target(T), member(P,T).

blocked(X-Y,Boxes) :- wall(X-Y) ; member(X-Y,Boxes).

metric(P1,P2,D) :- pythagorean(P1,P2,D).

pythagorean(X1-Y1,X2-Y2,D) :- D is sqrt((X2-X1)^2 + (Y2-Y1)^2).
manhattan(X1-Y1,X2-Y2,D) :- D is abs(X2-X1) + abs(Y2-Y1).
goal_pull(X1-Y1,X2-Y2,D). %assertz(goal_pull(P1,P2,D))

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
asserta(h(P1,_,Val) :- goal(P2), pythagorean(P1,P2,Val)).

start(Start), 'A*'(Start,Sol,_), length(Sol,L)
*/ 
/*
insert_in_ascending_list(X, [], [X]).
insert_in_ascending_list(X, [Y|Tail], [X,Y|Tail]) :-
    X @< Y, !.
insert_in_ascending_list(X, [Y|T0], [Y|Tail]) :-
    insert_in_ascending_list(X, T0, Tail).    
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
    pythagorean(Box,Target,V),
    get_min_way_cost(Box,T,Pos,Val), !,
    insert(Target,V,Pos,Val,PosNew,ValNew).
    
get_summary_way_cost([],_,0).
get_summary_way_cost([Box|Boxes],TB,TotalCost) :- 
    get_min_way_cost(Box,TB,[_|TB1],[Cost|_]), 
    get_summary_way_cost(Boxes,TB1,PrevCost), !,
    TotalCost is PrevCost + Cost.
    
evFunc(state(agent(Agent), boxes(Boxes)),Heuristic) :- 
    target(Targets),
    /*
        %count_pushes(Path,Pushes),
        %unmatches(Boxes,Targets,N),
        %get_circle_center(Boxes,C1),
        %get_circle_center(Targets,C2),
        %find_shortest_total_way(Boxes,Cost), !, %от каждой коробки до каждой целевой позиции %работает криво из-за reachable_by_sokoban в том числе
        %по сути ^ тоже самое что и goal pull distance; также на эту роль претендует opt_path - что-бы не сорить предикатами - берем уже готовый A-star
        %pythagorean(C1,C2,D),
        %pythagorean(Agent,C1,AB),
    */
    boxes_in_pos(Boxes,N),
    length(Boxes,Cnt),
    get_summary_way_cost(Boxes,Targets,Assign),
    Heuristic is (Cnt - N + Assign).
    
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

solve_Astar(Map) :-
    Algo = a-star,
    Params = (
        pull, % Distance_Metric (pull, manhattan, pythagorean)
        closest, % Assignment_Algorithm (hungarian, greedy, closest)
        once % Assignment_Recalculation (once, high)
    ),
    NewSol = true,
    solve_map(Map,Algo,Params,NewSol).
    
solve_dfs(Map) :-
    Algo = dfs,
    Params = (empty),
    NewSol = true,
    solve_map(Map,Algo,Params,NewSol).
	
solve(a-star,(Metric,Assign_Algo,Assign_Recalc),Path,Info) :- aSearch(Path,Info).
solve(dfs,Params,Path,Info) :- (initial(A), final(C), N=84, dfs(A,C,0,N,A,Path,Info)).

print_info(a-star,ClosedNum-Frontier) :- 
    format( 'Closed vertices: ~w~nMax open vertices: ~w~n',[ClosedNum,Frontier] ).
print_info(dfs,Info) :-
    format('',[]).
   
solve_map(Map,Algo,Params,NewSol) :- 
    load_map(Map),
    initial(state(agent(Agent),boxes(Boxes))), length(Boxes,Tlen),
    component_nodes(Agent,RV), length(RV,RVlen),
    format('Squares: ~w~nBoxes: ~w~n',[RVlen,Tlen]),
    (solvable(load) ->
    (statistics(runtime,_), 
    (( (test_sol(Map), not(NewSol)) -> true ; solve(Algo,Params,Path,Info) ) -> 
    (!, (var(Path) -> 
        write('sol found\nPass: '),
        solution(Path)  
    ; 
        format('new sol -- found by <~w>\nPass: ', [Algo]),
        retractall(solution(_)), 
        assert(solution(Path)),
        save_sol(Map)
    ),
    printList(Path,'',''), nl, nl,
    print_info(Algo,Info),
    length(Path,Moves),
    count_pushes(Path,Pushes),
    format('m/p: ~w/~w~n',[Moves,Pushes]),
    statistics(runtime, [_,T]), format('CPU time = ~w msec',[T])) ; format('Unsolvable.'))) ; format('Unsolvable: simple check.')).
   
/***************************************************************************/

test_opt_path(Path) :- 
    From = state(agent(1-1),boxes([2-2])),
    To = state(agent(2-2),boxes([2-3])),
    opt_path(From,To,Path).

opt_path(From,To,Path) :- 
    To = state(agent(A), boxes(B)),
    asserta((final(state(agent(A),boxes(Boxes))) :- eq_lists(B,Boxes))),
    asserta(target(B) :- !),
    asserta((next(From,To,1) :- move(From,To,Move), member(Move,["u","d","r","l"]))),
    'A*'(From,Sol,_),
    retract(final/1),
    retract(target/1),
    retract(next/3),
    steps(Sol,Path).

steps([X,Y|T],[P|NextPath]) :- move(X,Y,P), steps([Y|T],NextPath).
steps([_],[]).
steps([],[]).

aSearch(P,Info) :- 
    start(Start),
    'A*'(Start, Sol, Info),
    steps(Sol,P).

'A*'(Start, Sol, ClosedNum-Frontier) :- h(Start, F), a_star( [ v( Start, noparent, 0, F) ], [] , Sol-(ClosedNum-Frontier) ).

a_star( Opens, Closed, Sol-(ClosedNum-0) ) :- 
	Opens = [v(V, Prev ,_,_)|_], goal(V), !,
	build_path(Prev, Closed, [V], Sol), 
	length(Closed, ClosedNum).

a_star( [v(V,Prev,G,F)|Opens], Closed, Sol-(ClosedNum-FrontierMax) ) :-
	findall( v(V1,V,G1,F1), (next(V,V1,C) ,
	not( member(v(V1,_,_,_), Opens) ),
	not( member(V1-_, Closed) ), G1 is G+C,
	h(V1,H1), F1 is G1+H1), Childs),
	ord_insert_list( Childs, Opens, NewOpens ),
	a_star( NewOpens, [V-Prev|Closed], Sol-(ClosedNum-FrontierPrevMax) ),
    length(NewOpens, NewOpensNum),
    (NewOpensNum > FrontierPrevMax -> FrontierMax = NewOpensNum ; FrontierMax = FrontierPrevMax).

a_star([],_,fail).

build_path( noparent ,_, Path, Path ).
build_path( V, Closed, Path0, Path) :- member(V-Parent, Closed), build_path( Parent, Closed, [V|Path0], Path ).

ord_insert_list( [V|T1], L2, L3 ) :- ord_insert(V,L2,L22), ord_insert_list(T1,L22,L3).
ord_insert_list([],L3,L3).

ord_insert(V,[],[V]).
ord_insert(V,[H|T],[V,H|T]) :- V=v(_,_,_,F1), H=v(_,_,_,F2), F1=<F2, !.
ord_insert(V,[H|T],[H|T2]) :- ord_insert(V,T,T2).

%-- настройка на предметную область:
start(V) :- initial(V).
goal(V) :- final(V).
next(From,To,Cost) :- move(From,To,Move), (member(Move,["U","D","R","L"]) -> Cost = 0 ; Cost = 1).
%h(Pos,0).
h(Pos,Val) :- evFunc(Pos,Val). % выбор оценочной функции для поиска

/***************************************************************************/

neib(Loc1,Loc2,up):- top(Loc1,Loc2).
neib(Loc1,Loc2,down):- top(Loc2,Loc1).
neib(Loc1,Loc2,right):- right(Loc1,Loc2).
neib(Loc1,Loc2,left):- right(Loc2,Loc1).

/*
reachable_by_sokoban(Loc1,Loc2,_,_,0) :- neib(Loc1,Loc2,_), !. %можно использовать функцию расстояния
reachable_by_sokoban(Loc1,Loc2,History,BoxLocs,N):-
    neib(Loc1,Loc3,_),
    \+ member(Loc3,BoxLocs),
    \+ member(Loc3,History),
    reachable_by_sokoban(Loc3,Loc2,[Loc3|History],BoxLocs,N1), N is N1+1.
*/

r_b_s([pair(Loc3,_)|_],Loc2,History,BoxLocs,N1) :- reachable_by_sokoban(Loc3,Loc2,[Loc3|History],BoxLocs,N), N1 is N+1.
r_b_s([_|T],Loc2,History,BoxLocs,N) :- r_b_s(T,Loc2,History,BoxLocs,N).

reachable_by_sokoban(Loc,Loc,H,_,0) :- !.%, reverse(H,H1), printList(H1,'','   '). %можно использовать функцию расстояния
reachable_by_sokoban(Loc1,Loc2,History,BoxLocs,N):- %Передавать в  эту функцию  Loc1 при запуске & при желании можно вытянуть сам кратчайший путь
    bagof(
        pair(Loc3,D), (
        neib(Loc1,Loc3,_),
        \+ member(Loc3,BoxLocs),
        \+ member(Loc3,History),
        pythagorean(Loc3,Loc2,D)
        ),
        Cases
    ),
    sort(2,@=<,Cases,Sorted), %printList(Sorted), nl,
    r_b_s(Sorted,Loc2,History,BoxLocs,N).

find_all_push_moves(Root,Boxes,PushMoves) :-
    find_all_push_moves([Root],Boxes,[],PushMoves).
find_all_push_moves([],_,_,[]).
find_all_push_moves([V|Open],Boxes,History,AllPM) :-
    findall(Vm, (move(state(agent(V), boxes(Boxes)), state(agent(Vm), _), M), member(M,["d","u","l","r"]), \+ member(Vm,History)), Expanded),
    append(Open,Expanded,NewOpen),
    append([V|Expanded],History,NewHistory),
    find_all_push_moves(NewOpen,Boxes,NewHistory,OtherPM),
    findall(edge(Vp,M), (move(state(agent(V), boxes(Boxes)), Vp, M), member(M,["D","U","L","R"])), NewPM),
    append(OtherPM,NewPM,AllPM).
 
pr_queue_push(V,[],[V]).
pr_queue_push(V,[H|T],[V,H|T]) :- V=(F1,_), H=(F2,_), F1=<F2, !.
pr_queue_push(V,[H|T],[H|T2]) :- pr_queue_push(V,T,T2).

/***************************************************************************/
/* Unit tests                                                              */
/***************************************************************************/
/*
:- begin_tests(sokoban).
%test(smth) :- smth.
:- end_tests(sokoban).
%:- run_tests.
*/    