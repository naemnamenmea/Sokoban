/*
:- module(print,
    [
        print_map/0,
        print_map/1, % +Map
        printPass/1, % +Pass
        printList/3, % +List, +Prefix, +Suffix
        printStringList/3, % +StringList, +Prefix, +Suffix
        print_wrong_maps/1, % +List
        pr/1 % +List
    ]).
*/   

print_map :- map_path(Path), format('Path: \'~w\'~n',[Path]), print_map_.
print_map(Map) :- load_map(Map), print_map_.
print_map_ :- getMaxY(MaxY), MaxY1 is MaxY+1, d(MaxY1).
    
getMaxX(MaxX) :- findall(X, right(_,X-_), Xarr), max_list(Xarr,MaxX), !.
getMaxX(1).

getMinX(MinX) :- findall(X, right(X-_,_), Xarr), min_list(Xarr,MinX), !.
getMinX(1).

getMaxY(MaxY) :- findall(Y, top(_,_-Y), Yarr), max_list(Yarr,MaxY), !.
getMaxY(1).

getMinY(MinY) :- findall(Y, top(_-Y,_), Yarr), min_list(Yarr,MinY), !.
getMinY(1).

getSymbol(P,'#') :- wall(P), !.
getSymbol(P,'@') :- initial(state(agent(P),_)), target(T), \+ member(P,T), !.
getSymbol(P,'+') :- initial(state(agent(P),_)), target(T), member(P,T), !.
getSymbol(P,'$') :- initial(state(_,boxes(B))), member(P,B), target(T), \+ member(P,T), !.
getSymbol(P,'*') :- initial(state(_,boxes(B))), member(P,B), target(T), member(P,T), !.
getSymbol(P,'.') :- target(T), member(P,T), !.
getSymbol(_,' ').

printLine(X,_,S) :- getMaxX(MaxX), MaxX1 is MaxX+1, X>MaxX1, !, reverse(S,S1), printList(S1,'',''), nl.
printLine(X,Y,String) :- getSymbol(X-Y,S), X1 is X+1, printLine(X1,Y,[S|String]).


d(Y) :- getMinY(MinY), MinY1 is MinY-1, Y<MinY1, !.
d(Y) :- getMinX(MinX), MinX1 is MinX-1, printLine(MinX1,Y,[]), Y1 is Y-1, d(Y1).

%***********************************************************************************	

pr([]).
pr([H|T]) :- write(H), nl, pr(T).

print_wrong_maps([]).
print_wrong_maps([Map|Col]) :- format('* ~w~n',[Map]), print_wrong_maps(Col).
	
printPass([]).
printPass([N-Pos-P|T]) :- format('~w. ~w  ~w',[N,Pos,P]), nl, printPass(T).

printList([],_,_).
printList([E],P,_) :- format('~w~w',[P,E]), !.
printList([H|T],P,S) :- format('~w~w~w',[P,H,S]), printList(T,P,S).

printStringList([],_,_).
printStringList([H|T],P,S) :- string_chars(H,Str), printList(Str,P,S), nl, printStringList(T,P,S).