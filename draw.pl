/*
:- module(draw,
    [
        draw_map/1,
        printPass/1,
        printList/2,
        printStringList/2
    ]).
*/   
draw_map(Map) :- load_map(Map), getMaxY(MaxY), MaxY1 is MaxY+1, d(MaxY1).
    
checkMaxX(X) :- right(_,X1-_), X1>X.
getMaxX(X) :- right(_,X-_), \+ checkMaxX(X), !.

checkMinX(X) :- right(X1-_,_), X1<X.
getMinX(X) :- right(X-_,_), \+ checkMinX(X), !.

checkMaxY(Y) :- top(_,_-Y1), Y1>Y.
getMaxY(Y) :- top(_,_-Y), \+ checkMaxY(Y), !.

checkMinY(Y) :- top(_-Y1,_), Y1<Y.
getMinY(Y) :- top(_-Y,_), \+ checkMinY(Y), !.

getSymbol(P,'#') :- \+ right(P,_), \+ right(_,P), \+ top(_,P), \+ top(P,_), !.
getSymbol(P,'@') :- initial(state(agent(P),_)), target(T), \+ member(P,T), !.
getSymbol(P,'+') :- initial(state(agent(P),_)), target(T), member(P,T), !.
getSymbol(P,'$') :- initial(state(_,boxes(B))), member(P,B), target(T), \+ member(P,T), !.
getSymbol(P,'*') :- initial(state(_,boxes(B))), member(P,B), target(T), member(P,T), !.
getSymbol(P,'.') :- target(T), member(P,T), !.
getSymbol(_,' ').

drawLine(X,_,S) :- getMaxX(MaxX), MaxX1 is MaxX+1, X>MaxX1, !, reverse(S,S1), printList(S1,''), nl.
drawLine(X,Y,String) :- getSymbol(X-Y,S), X1 is X+1, drawLine(X1,Y,[S|String]).


d(Y) :- getMinY(MinY), MinY1 is MinY-1, Y<MinY1, !.
d(Y) :- getMinX(MinX), MinX1 is MinX-1, drawLine(MinX1,Y,[]), Y1 is Y-1, d(Y1).

%***********************************************************************************	
	
printPass([]) :- !.
printPass([N-Pos-P|T]) :- format('~w. ~w  ~w',[N,Pos,P]), nl, printPass(T).

printList([],_).
printList([E],_) :- format('~w',[E]), !.
printList([H|T],D) :- format('~w~w',[H,D]), printList(T,D).

printStringList([],_).
printStringList([H|T],Sep) :- string_chars(H,S), printList(S,Sep), nl, printStringList(T,Sep).