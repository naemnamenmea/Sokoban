make_dir_r(Dir) :- exists_directory(Dir), !.  
make_dir_r(Dir) :- 
    atom_concat(Dir,'../',Dir2),
    make_dir_r(Dir2),
    catch(make_directory(Dir), E, ( print_message(error, E), fail )).


/*
dfs(Root) :-
    dfs([Root], []).
dfs([],_).
dfs([H|T],Visited) :-
    member(H,Visited),
    dfs(T,Visited).
dfs([H|T],Visited) :-
    not(member(H,Visited)),
    findall(Nb,move(H,Nb),Nbs),
    append(Nbs,T, ToVisit),
    dfs(ToVisit,[H|Visited]).
*/
/*
:- module(
  fruit,
  [
    add_fruit/3, % +Name:atom, +Price:float, +Color:atom
    current_fruit/3 % ?Name:atom, ?Price:float, ?Color:atom
  ]
).

:- use_module(library(persistency)).

:- persistent(fruit(name:atom, price:float, color:atom)).

:- initialization(db_attach('fruit1.pl', [])).

add_fruit(Name, Price, Color):-
  with_mutex(fruit_db, assert_fruit(Name, Price, Color)).

current_fruit(Name, Price, Color):-
  with_mutex(fruit_db, fruit(Name, Price, Color)).
*/  
/*
:- dynamic a/1.
a(5).
a(4).
%a(3,9).

%:- expects_dialect(sicstus). OR :- use_module(library(dialect/sicstus)). %read_line/2
*/
/*
?- tell('a_db.txt'), listing(a), told.
true.

?- listing(a).
:- dynamic a/1.

a(1).
a(2).
a(3).

true.
*/

/*
:- multifile user:message_property/2.

user:message_property(help, color([fg(blue)])).
*/

%:- consult('sokoban.pl').

%r(L) :- open('levels/lvl1.txt',read,Stream,[]), read_line(Stream,L), close(Stream).
r(L) :- open('levels/lvl1.txt',read,Stream,[]), read_line_to_codes(Stream,L), close(Stream).
%r :- open('levels/100Boxes.txt',read,Stream,[]), read_string(Stream,L,S), split_string(S,'\n','\n',S1), printStringList(S1,''), close(Stream).
%r :-  tell('other/out.txt'), consult('sokoban.pl'), listing(move), told.



/*
    read_string/2
    abolish/1 /2 - not only removes all predicate clauses but also makes the predicate unknown to the runtime
    retract/1
    retractall/1 (  retractall(pred(_)).  ) - remove all clauses for a dynamic predicate but the predicate will still be known by the runtime
    erase/1 
    
*/


readFileSee(InputFile) :- seeing(OldStream),
                          see(InputFile),
                          repeat,
                          read(Term),
                          ( Term == end_of_file -> true ; 
                            write(Term), fail
                          ),
                          seen,
                          see(OldStream).
                          
                          
browse(File) :- 
          seeing(Old),      /* save for later */ 
          see(File),        /* open this file */ 
          repeat, 
          read(Data),       /* read from File */ 
          process(Data),    
          seen,             /* close File */ 
          see(Old),         /*  previous read source */ 
          !.                /* stop now */ 
 
process(end-of-file) :- !. 
process(Data) :-  write(Data), nl, fail.                           