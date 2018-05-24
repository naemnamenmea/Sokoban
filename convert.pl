/*
:- module(convert,
    [
        add_map_list/1,           % +File
        remove_trailing_spaces/2, % +ListI, -ListO
        delete_all_except/3,      % +ListI, +ExceptList, -ListO
        delete_all/3,             % +ListI, +DelList, -ListO
        erase_map/0               % retractall: top, right, target, initial
    ]).
*/

load_map(Map) :- 
    erase_map,
    assert(map_path(Map)),
    exists_file(Map) -> consult(Map).

add_maps([]).
add_maps([H|T]) :- 
    (atom_concat(_,'.',H); atom_concat(_,'..',H)), !,
    add_maps(T).
add_maps([H|T]) :- 
    working_directory(CWD,CWD),
    atom_concat(CWD,'levels/',LD),
    atom_concat(LD,H,D),
    exists_directory(D), !,
    directory_files(D,Files), 
    findall(Y,(member(F,Files),atom_concat(H,'/',H1),atom_concat(H1,F,Y)),Out),
    add_maps(Out),
    add_maps(T).   
add_maps([H|T]) :- 
    format('File: \'~s\'~n',[H]), 
    (add_map_list(H) ; true), nl, !, 
    add_maps(T).
    
add_maps :- 
    working_directory(CWD,CWD),
    atom_concat(CWD,'levels/',L),
    exists_directory(L),
    directory_files(L,Files), 
    findall(Y,(member(F,Files),atom_concat('levels/',F,Y)),Out),
    add_maps(Out).

add_other([],_,_).
add_other([H1,H2|T],X,Y) :-
    X1 is X+1,
    ( (H1 \== '#', H2 \== '#') -> assert(right(X-Y,X1-Y)) ; true ),
    fail. %add_other([H2|T],X1,Y). ?????
add_other([H|T],X,Y) :-
    ((H=='@' ; H=='+') -> assert(agent_(X-Y)) ; true),
    ((H=='$' ; H=='*') -> assert(box_(X-Y)) ; true),
    ((H=='.' ; H=='*' ; H=='+') -> assert(target_(X-Y)) ; true),
    X1 is X+1, add_other(T,X1,Y).

add_top([],_,_,_) :- !.
add_top(_,[],_,_) :- !.
add_top([H1|T1],[H2|T2],Y,X) :-
    X1 is X+1,
    ( (H1 \== '#', H2 \== '#') -> ( Y1 is Y+1, assert(top(X-Y,X-Y1)) ) ; true ),
    add_top(T1,T2,Y,X1).

convert(_,[],_).
convert(E,[H|T],Y) :- 
    add_other(H,0,Y),
    add_top(E,H,Y,0),
    Y1 is Y-1, convert(H,T,Y1).

add_map(MapName,[H|T]) :- 
    atom_concat(MapName,'.pl',MN),
    length([H|T],Y), Y1 is Y-1, Y2 is Y1-1,
    erase_map,
    add_other(H,0,Y1),
    convert(H,T,Y2),
    solvable(add) -> (tell(MN), write_map, told).

del_undounded_nodes([]).
del_undounded_nodes([H|T]) :- 
    ( retract(top(H,_)) ; retract(right(H,_)) ; true ),
    del_undounded_nodes(T). 

solvable(load) :-
    initial(state(agent(S),boxes(B))),
    \+ is_list(S),
    component_nodes(S,L),
    target(T),
    subset(T,L), subset(B,L), 
    length(T,Size), length(B,Size),
    findall(P,(top(P,_) ; right(P,_)),A),
    delete_all(A,L,G),
    del_undounded_nodes(G).   
    
solvable(add) :-
    aggregate_all(count, agent_(_), 1),
    agent_(S),
    component_nodes(S,L),
    findall(X,target_(X),T), 
    findall(Y,box_(Y),B), 
    subset(T,L), subset(B,L),
    length(T,Size), length(B,Size),
    assert(initial(state(agent(S),boxes(B)))),
    assert(target(T)),
    findall(P,(top(P,_) ; right(P,_)),A),
    delete_all(A,L,G),
    del_undounded_nodes(G).
  
add_map_list(File) :- 
    \+ exists_file(File), !, 
    format('File \'~w\' doesn`t exist.~n',[File]).
add_map_list(File) :-
    atom_concat('levels/',Path,File),
    access_file(File,read) ->
    (
    catch(open(File, read, In), E, ( print_message(error, E), fail )),    
    file_directory_name(Path,Dir),
    file_base_name(File,Base),
    file_name_extension(Name,_,Base),
    working_directory(CWD,CWD),
    atom_concat(Dir,'/',Dir2),
    atom_concat(Dir2,Name,Dir3),
    atom_concat('maps/',Dir3,MD1),
    atom_concat(MD1,'/',MD2),
    atom_concat(CWD,MD2,NWD),
    make_directory_path(NWD),
    working_directory(_,NWD),
    read_line_to_string(In,S1),
    add_map_list_(S1,In,[],0,0,[],''),
    working_directory(_,CWD),
    close(In)
    ).
 
add_map_list_(end_of_file,_,M,N,T,EM,MN) :- !,
    (
        ( MN\=='' -> T1 is T+1, ( add_map(MN,M) -> (N1 is N+1, EM1=EM) ; (N1=N, EM1=[MN|EM]) ) ) ; (N1=N, T1=T, EM1=EM)
    ),
    ( EM1\==[] -> (
        format('~w/~w map(s) has been successfully added.\n\n',[N1,T1]),
        reverse(EM1,EM2),
        format('Maps below contain some mistakes:\n\n'),
        print_wrong_maps(EM2)
        ) ; format('All ~w map(s) has been successfully added.\n',[T1])
    ).
add_map_list_(S,In,M,N,T,EM,MN) :-
    string_chars(S,C),
    (
    member(';',C) -> 
        (
        delete_all(C,['\\','/',':','*','?','"','<','>','|',';','\t','\r'],C1),
        string_chars(S1,C1),
        normalize_space(atom(S2),S1),
        %format('|~w~n|~w~n~n',[S2,MN]), 
        reverse(M,M1),
        (
            ( MN\=='' -> MN1=S2, ( add_map(MN,M1) -> (N1 is N+1, EM1=EM) ; (N1=N, EM1=[MN|EM]) ) ) ;
            ( add_map(S2,M1) -> (N1 is N+1, EM1=EM, MN1='') ; (N1=N, (T==0 -> (MN1=S2,T1=0,EM1=EM) ; (MN1=MN,EM1=[S2|EM]))) )
        ),
        (var(T1) -> T1 is T+1 ; true),
        L=[]
        )
    ;
        ( delete_all_except(C,['#',' ','-','$','.','@','*','+'],C1),
        remove_trailing_spaces(C1,C2),
        ( C2\==[] -> L=[C2|M] ; L=M),
        N1=N,
        T1=T,
        EM1=EM,
        MN1=MN
        )
    ),
    read_line_to_string(In,S_),
    add_map_list_(S_,In,L,N1,T1,EM1,MN1).
   
component_nodes(Root,Closed) :-
    component_nodes([Root],[],Closed).
component_nodes([],Closed,Closed).
component_nodes([H|T],Closed,V) :-
    member(H,Closed), !,
    component_nodes(T,Closed,V).
component_nodes([H|T],Closed,V) :-
    ( top(H,Top) -> L=[Top] ; L=[]),
    ( top(Bot,H) -> L1=[Bot|L] ; L1=L),
    ( right(Left,H) -> L2=[Left|L1] ; L2=L1),
    ( right(H,Right) -> L3=[Right|L2] ; L3=L2),
    append(L3,T,Open),
    component_nodes(Open,[H|Closed],V).
 
remove_trailing_spaces([H|T],R) :-
    remove_trailing_spaces(T,T1),
    ((T1==[], H\==' ' ; T1\==[]) -> R=[H|T1] ; R=[]).
remove_trailing_spaces([],[]).

delete_all([],_,[]).
delete_all([H|T],L,Result) :- member(H,L), !, delete_all(T,L,Result).
delete_all([H|T],L,[H|Result]) :- delete_all(T,L,Result).

delete_all_except([],_,[]).
delete_all_except([H|T],L,[H|Result]) :- member(H,L), !, delete_all_except(T,L,Result).
delete_all_except([_|T],L,Result) :- delete_all_except(T,L,Result).    

erase_map :-
    retractall(map_path(_)),
    retractall(initial(_)),
    retractall(target(_)),
    retractall(top(_,_)),
    retractall(right(_,_)),
    retractall(agent_(_)),
    retractall(box_(_)),
    retractall(target_(_)).
    
write_map :-
    listing(initial/1),
    listing(target/1),
    listing(top/2),
    listing(right/2).