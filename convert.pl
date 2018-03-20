/*
:- module(convert,
    [
        add_map_list/1,           % +File
        remove_trailing_spaces/2, % +ListI, -ListO
        delete_all_except/3,      % +ListI, +ExceptList, -ListO
        delete_all/3,             % +ListI, +DelList, -ListO
        erase_map/0                   % retractall: top, right, target, initial
    ]).
*/
%=============================================================================
%===================================COMMENTS==================================
%=============================================================================
/*
“#” is a wall
space or “-” is an empty passage
“.” is a target square
“$” is a red bead in a passage
“@” is a blue bead in a passage
“*” is a red bead on a target square
“+” is a blue bead on a target square
Any other line separates levels

======================
при добалении карт, выводить сообщения аля: "такого файла не существует" и если не удалось добавить карту, то какая именно ошибка возникла

добавлять с перезаписью или нет
==================
reachable_by_sokoban возвращать не кол-во шагов, а сам путь

проблема повторной загрузки файла карты (consult(Map), draw_map(Map) выдает ошибку) если не ошибаюсь если использовать модули

make
user:
если работаем с файлами как с модулями вообще дичь получается

1. расстояние до цели использовать при выборе новой клетки, и если одна не подходитЮ более выгодная, то выбрать другую

!!! заменить consult на ensure_loaded !!!
namespaces как вообще они работают: что за ?? с help:help(X) ~ helpfgdgdf:help(X)

запретить перемещения бочек в тупики
*/
%=============================================================================
%=====================================TEST====================================
%=============================================================================



%=============================================================================
%=====================================CODE====================================
%=============================================================================

load_map(Map) :- 
    erase_map,
    atom_concat('maps/',Map,Fmap),
    exists_file(Fmap) -> consult(Fmap).

add_maps([]).
add_maps([H|T]) :- (atom_concat(_,'.',H); atom_concat(_,'..',H)), !, add_maps(T).
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
    format('__==\'~s\'==__~n',[H]), 
    (add_map_list(H) ; true), nl, !, 
    add_maps(T).
    
add_maps :- 
    working_directory(CWD,CWD),
    atom_concat(CWD,'levels/',L),
    exists_directory(L),
    directory_files(L,Files), 
    add_maps(Files).

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
convert(E,[H|T],Y) :- add_other(H,0,Y), add_top(E,H,Y,0), Y1 is Y-1, convert(H,T,Y1).

add_map(MapName,[H|T]) :- 
    atom_concat(MapName,'.pl',MN),
    length([H|T],Y), Y1 is Y-1, Y2 is Y1-1,
    erase_map,
    add_other(H,0,Y1),
    convert(H,T,Y2),
    solvable(add) -> (tell(MN), write_map, told).

del_undounded_nodes([]).
del_undounded_nodes([H|T]) :- ( retract(top(H,_)) ; retract(right(H,_)) ; true ), del_undounded_nodes(T). 

solvable(load) :-
    initial(state(agent(S),boxes(B))),
    \+ is_list(S),
    dfs(S,L),
    target(T),
    subset(T,L), subset(B,L), 
    length(T,Size), length(B,Size),
    findall(P,(top(P,_) ; right(P,_)),A),
    delete_all(A,L,G),
    del_undounded_nodes(G).   
    
solvable(add) :-
    aggregate_all(count, agent_(_), 1),
    agent_(S),
    dfs(S,L),
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
    atom_concat('levels/',File,Path), 
    \+ exists_file(Path), !, 
    format('file ~w doesn`t exists~n',[File]).
add_map_list(File) :-
    atom_concat('levels/',File,Path),
    access_file(Path,read) ->
    (
    catch(open(Path, read, In), E, ( print_message(error, E), fail )),    
    file_directory_name(File,Dir),
    file_base_name(Path,Base),
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
        printStringList(EM2,'')
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
    ; %potential problems with construction if-then-else
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
   
dfs(Root,Visited) :-
    dfs([Root],[],Visited).
dfs([],Visited,Visited).
dfs([H|T],Visited,V) :-
    member(H,Visited), !,
    dfs(T,Visited,V).
dfs([H|T],Visited,V) :-
    ( top(H,Top) -> L=[Top] ; L=[]),
    ( top(Bot,H) -> L1=[Bot|L] ; L1=L),
    ( right(Left,H) -> L2=[Left|L1] ; L2=L1),
    ( right(H,Right) -> L3=[Right|L2] ; L3=L2),
    append(L3,T,ToVisit),
    dfs(ToVisit,[H|Visited],V).
   
remove_trailing_spaces([],[]).
remove_trailing_spaces([H|T],[H|Out]) :- remove_trailing_spaces(T,Out), Out\==[], !.
remove_trailing_spaces([H|T],[H|Out]) :- H\==' ', H\=='-', !, remove_trailing_spaces(T,Out).
remove_trailing_spaces([_|T],Out) :- remove_trailing_spaces(T,Out).

delete_all([],_,[]).
delete_all([H|T],L,Result) :- member(H,L), !, delete_all(T,L,Result).
delete_all([H|T],L,[H|Result]) :- delete_all(T,L,Result).

delete_all_except([],_,[]).
delete_all_except([H|T],L,[H|Result]) :- member(H,L), !, delete_all_except(T,L,Result).
delete_all_except([_|T],L,Result) :- delete_all_except(T,L,Result).    

erase_map :-
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