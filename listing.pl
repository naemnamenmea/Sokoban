
:- dynamic exception/3.
:- multifile exception/3.


blocked(A-B, C) :-
	(   wall(A-B)
	;   member(A-B, C)
	).

ord_insert_list([A|C], B, E) :-
	ord_insert(A, B, D),
	ord_insert_list(C, D, E).
ord_insert_list([], A, A).

dfs([], A, A).
dfs([A|C], B, D) :-
	member(A, B), !,
	dfs(C, B, D).
dfs([A|J], L, M) :-
	(   top(A, B)
	->  C=[B]
	;   C=[]
	),
	(   top(D, A)
	->  E=[D|C]
	;   E=C
	),
	(   right(F, A)
	->  G=[F|E]
	;   G=E
	),
	(   right(A, H)
	->  I=[H|G]
	;   I=G
	),
	append(I, J, K),
	dfs(K, [A|L], M).

:- dynamic prolog_file_type/2.
:- multifile prolog_file_type/2.

prolog_file_type(pl, prolog).
prolog_file_type(prolog, prolog).
prolog_file_type(qlf, prolog).
prolog_file_type(qlf, qlf).
prolog_file_type(A, executable) :-
	system:current_prolog_flag(shared_object_extension, A).

:- multifile message_property/2.


'A*'(A, C, D-E) :-
	h(A, B),
	a_star([v(A, noparent, 0, B)], [], C-(D-E)).

:- dynamic resource/3.
:- multifile resource/3.


printList([], _).
printList([A], _) :-
	format('~w', [A]), !.
printList([A|C], B) :-
	format('~w~w', [A, B]),
	printList(C, B).

load_map(A) :-
	(   erase_map,
	    atom_concat('maps/', A, B),
	    exists_file(B)
	->  consult(B)
	).

evFunc(state(agent(_), boxes(A)), C) :-
	target(B),
	unmatches(A, B, D),
	find_shortest_total_way(A, E),
	C is D+E.

checkMaxY(B) :-
	top(_, _-A),
	A>B.

distance(C-E, B-D, A) :-
	A is sqrt((B-C)^2+(D-E)^2).

final(state(_, boxes(B))) :-
	target(A),
	eq_lists(A, B).

ord_insert(A, [], [A]).
ord_insert(A, [B|C], [A, B|C]) :-
	A=v(_, _, _, D),
	B=v(_, _, _, E),
	D=<E, !.
ord_insert(B, [A|C], [A|D]) :-
	ord_insert(B, C, D).

:- dynamic prolog_exception_hook/4.
:- multifile prolog_exception_hook/4.

prolog_exception_hook(error(A, context(D, B)), error(A, context(prolog_stack(J), B)), G, C) :-
    prolog_stack:
    (   current_prolog_flag(backtrace, true),
	(   atom(C)
	->  debug(backtrace,
		  'Got uncaught (guard = ~q) exception ~p (Ctx0=~p)',
		  [C, A, D]),
	    stack_guard(C)
	;   prolog_frame_attribute(C, predicate_indicator, E),
	    debug(backtrace,
		  'Got exception ~p (Ctx0=~p, Catcher=~p)',
		  [A, D, E]),
	    stack_guard(E)
	),
	(   current_prolog_flag(backtrace_depth, F)
	->  F>0
	;   F=20
	),
	get_prolog_backtrace(G, F, H),
	debug(backtrace, 'Stack = ~p', [H]),
	clean_stack(H, I),
	join_stacks(D, I, J)
    ).

:- dynamic file_search_path/2.
:- multifile file_search_path/2.

file_search_path(library, A) :-
	library_directory(A).
file_search_path(swi, A) :-
	system:current_prolog_flag(home, A).
file_search_path(foreign, swi(B)) :-
    system:
    (   current_prolog_flag(arch, A),
	atom_concat('lib/', A, B)
    ).
file_search_path(foreign, swi(A)) :-
    system:
    (   (   current_prolog_flag(windows, true)
	->  A=bin
	;   A=lib
	)
    ).
file_search_path(path, C) :-
    system:
    (   getenv('PATH', A),
	(   current_prolog_flag(windows, true)
	->  atomic_list_concat(B, ;, A)
	;   atomic_list_concat(B, :, A)
	),
	'$member'(C, B),
	'$no-null-bytes'(C)
    ).
file_search_path(user_profile, app_preferences('.')).
file_search_path(app_preferences, app_data('.')).
file_search_path(app_data, B) :-
    '$toplevel':
    (   current_prolog_flag(windows, true),
	catch(win_folder(appdata, A), _, fail),
	atom_concat(A, '/SWI-Prolog', B),
	(   exists_directory(B)
	->  true
	;   catch(make_directory(B), _, fail)
	)
    ).
file_search_path(app_preferences, A) :-
	'$toplevel':catch(expand_file_name(~, [A]), _, fail).
file_search_path(autoload, library('.')).
file_search_path(pack, app_data(pack)).
file_search_path(pack, swi(pack)).
file_search_path(library, A) :-
	'$pack':pack_dir(_, prolog, A).
file_search_path(foreign, A) :-
	'$pack':pack_dir(_, foreign, A).
file_search_path(pce, A) :-
	link_xpce:pcehome_(A).
file_search_path(library, pce('prolog/lib')).
file_search_path(foreign, pce(B)) :-
    link_xpce:
    (   current_prolog_flag(arch, A),
	atom_concat('lib/', A, B)
    ).

movement(state(_, B), move(A, C)) :-
	select(A, B, E),
	neib(A, D, C),
	good_move(D, E),
	neib(F, A, C),
	\+ member(F, B).

pos2alg([A, B|C], E, F) :-
	move(A, B, D),
	pos2alg([B|C], [D|E], F).
pos2alg([_], A, A).
pos2alg([], A, A).

:- dynamic prolog_load_file/2.
:- multifile prolog_load_file/2.


:- multifile prolog_clause_name/2.


solve_map(A) :-
	load_map(A),
	solvable(load),
	initial(B),
	final(C),
	statistics(runtime, _),
	(   load_sol(A),
	    test_sol(A)
	;   D=20,
	    blind_search(B, C, 0, D, B, E)
	), !,
	(   var(E)
	->  write('sol found\n'),
	    solution(F),
	    printList(F, ' '),
	    nl
	;   write('new sol\n'),
	    printList(E, ' '),
	    nl,
	    retractall(solution(_)),
	    assert(solution(E)),
	    save_sol(A)
	),
	statistics(runtime, [_, G]),
	write('CPU time = '),
	write(G),
	write(' msec').

:- dynamic target/1.


wall(A) :-
	\+ (   right(_, A)
	   ;   right(A, _)
	   ;   top(_, A)
	   ;   top(A, _)
	   ).

getMinX(A) :-
	right(A-_, _),
	\+ checkMinX(A), !.

getSymbol(A, #) :-
	\+ right(A, _),
	\+ right(_, A),
	\+ top(_, A),
	\+ top(A, _), !.
getSymbol(A, @) :-
	initial(state(agent(A), _)),
	target(B),
	\+ member(A, B), !.
getSymbol(A, +) :-
	initial(state(agent(A), _)),
	target(B),
	member(A, B), !.
getSymbol(A, $) :-
	initial(state(_, boxes(B))),
	member(A, B),
	target(C),
	\+ member(A, C), !.
getSymbol(A, *) :-
	initial(state(_, boxes(B))),
	member(A, B),
	target(C),
	member(A, C), !.
getSymbol(A, '.') :-
	target(B),
	member(A, B), !.
getSymbol(_, ' ').

tupik(A, E, F, C, B, D) :-
	(   wall(A),
	    (   wall(B)
	    ;   wall(C)
	    ;   member(B, D),
		blocked(E, D)
	    ;   member(C, D),
		blocked(F, D)
	    )
	;   member(A, D),
	    (   blocked(B, D),
		blocked(E, D)
	    ;   blocked(C, D),
		blocked(F, D)
	    )
	).

move(state(agent(A), boxes(D)), state(agent(B), boxes([C|E])), pR) :-
	right(A, B),
	right(B, C),
	member(B, D),
	\+ banned(r, C, D),
	select(B, D, E).
move(state(agent(B), boxes(D)), state(agent(A), boxes([C|E])), pL) :-
	right(A, B),
	right(C, A),
	member(A, D),
	\+ banned(l, C, D),
	select(A, D, E).
move(state(agent(A), boxes(D)), state(agent(B), boxes([C|E])), pU) :-
	top(A, B),
	top(B, C),
	member(B, D),
	\+ banned(u, C, D),
	select(B, D, E).
move(state(agent(B), boxes(D)), state(agent(A), boxes([C|E])), pD) :-
	top(A, B),
	top(C, A),
	member(A, D),
	\+ banned(d, C, D),
	select(A, D, E).
move(state(agent(B), boxes(A)), state(agent(C), boxes(A)), r) :-
	right(B, C),
	\+ blocked(C, A).
move(state(agent(C), boxes(A)), state(agent(B), boxes(A)), l) :-
	right(B, C),
	\+ blocked(B, A).
move(state(agent(B), boxes(A)), state(agent(C), boxes(A)), u) :-
	top(B, C),
	\+ blocked(C, A).
move(state(agent(C), boxes(A)), state(agent(B), boxes(A)), d) :-
	top(B, C),
	\+ blocked(B, A).

delete_all_except([], _, []).
delete_all_except([A|C], B, [A|D]) :-
	member(A, B), !,
	delete_all_except(C, B, D).
delete_all_except([_|A], B, C) :-
	delete_all_except(A, B, C).

getMaxY(A) :-
	top(_, _-A),
	\+ checkMaxY(A), !.

h(A, B) :-
	evFunc(A, B).

aSearch(D) :-
	start(A),
	'A*'(A, B, _),
	pos2alg(B, [], C),
	reverse(C, D).

:- dynamic expand_query/4.
:- multifile expand_query/4.


load_sol(A) :-
	(   retractall(solution(_)),
	    atom_concat('solutions/', A, B),
	    exists_file(B)
	->  consult(B)
	).

printStringList([], _).
printStringList([A|D], C) :-
	string_chars(A, B),
	printList(B, C),
	nl,
	printStringList(D, C).

find_way_cost([], [], 0).
find_way_cost([B|D], A, F) :-
	member(C, A),
	reachable_by_sokoban(B, C, [B], [], H),
	select(C, A, E),
	find_way_cost(D, E, G),
	F is G+H.

:- dynamic agent_/1.


getMinY(A) :-
	top(_-A, _),
	\+ checkMinY(A), !.

blind_search(A, state(_, boxes(C)), _, _, _, [B]) :-
	move(A, state(_, boxes(D)), B),
	eq_lists(C, D), !.
blind_search(_, _, A, A, _, _) :- !,
	fail.
blind_search(A, F, E, H, D, [B|I]) :-
	move(A, C, B),
	\+ member(C, D),
	G is E+1,
	blind_search(C,
		     F,
		     G,
		     H,
		     [C|D],
		     I).

next(A, B, 1) :-
	move(A, B, _).

draw_map(A) :-
	load_map(A),
	getMaxY(B),
	C is B+1,
	d(C).

dfs(A, B) :-
	dfs([A], [], B).

start(A) :-
	initial(A).

solve_dfs(A, B, _, []) :-
	final_state(A, B).
solve_dfs(E, A, D, [B|F]) :-
	movement(A, B),
	update(A, B, C),
	\+ member(C, D),
	solve_dfs(E, C, [C|D], F).

convert(_, [], _).
convert(C, [A|D], B) :-
	add_other(A, 0, B),
	add_top(C, A, B, 0),
	E is B+ -1,
	convert(A, D, E).

add_maps :-
	working_directory(A, A),
	atom_concat(A, 'levels/', B),
	exists_directory(B),
	directory_files(B, C),
	add_maps(C).

:- dynamic expand_answer/2.
:- multifile expand_answer/2.


solvable(load) :-
	initial(state(agent(A), boxes(D))),
	\+ is_list(A),
	dfs(A, C),
	target(B),
	subset(B, C),
	subset(D, C),
	length(B, E),
	length(D, E),
	findall(F,
		(   top(F, _)
		;   right(F, _)
		),
		G),
	delete_all(G, C, H),
	del_undounded_nodes(H).
solvable(add) :-
	aggregate_all(count, agent_(_), 1),
	agent_(A),
	dfs(A, E),
	findall(B, target_(B), D),
	findall(C, box_(C), F),
	subset(D, E),
	subset(F, E),
	length(D, G),
	length(F, G),
	assert(initial(state(agent(A), boxes(F)))),
	assert(target(D)),
	findall(H,
		(   top(H, _)
		;   right(H, _)
		),
		I),
	delete_all(I, E, J),
	del_undounded_nodes(J).

s_help(draw_map) :-
	format('\n    "#" is a wall\n    space or "-" is an empty passage\n    "." is a target square\n    "$" is a red bead in a passage\n    "@" is a blue bead in a passage\n    "*" is a red bead on a target square\n    "+" is a blue bead on a target square\n    Any other line separates levels\n').

checkMinY(B) :-
	top(_-A, _),
	A<B.

checkMaxX(B) :-
	right(_, A-_),
	A>B.

eq_lists(A, B) :-
	subset(A, B),
	subset(B, A).

r_b_s([pair(A, _)|_], B, C, D, E) :-
	reachable_by_sokoban(A,
			     B,
			     [A|C],
			     D,
			     F),
	E is F+1, !.
r_b_s([_|A], B, C, D, E) :-
	r_b_s(A, B, C, D, E).

a_star(A, D, E-(F-G)) :-
	A=[v(B, C, _, _)|_],
	goal(B), !,
	build_path(C, D, [B], E),
	length(A, F),
	length(D, G).
a_star([v(A, L, F, _)|C], D, M) :-
	findall(v(B, A, E, H),
		( next(A, B, G),
		  not(member(v(B, _, _, _), C)),
		  not(member(B-_, D)),
		  E is F+G,
		  h(B, I),
		  H is E+I
		),
		J),
	ord_insert_list(J, C, K),
	a_star(K, [A-L|D], M).
a_star([], _, fail).

:- dynamic library_directory/1.
:- multifile library_directory/1.

library_directory(B) :-
    '$parms':
    (   cached_library_directory(local, A=lib, A),
	B=A
    ).
library_directory(B) :-
    '$parms':
    (   cached_library_directory(user,
				 expand_file_name('~/lib/prolog', [A]),
				 A),
	B=A
    ).
library_directory(B) :-
    '$parms':
    (   cached_library_directory(system,
				 absolute_file_name(swi(library), A),
				 A),
	B=A
    ).
library_directory(B) :-
    '$parms':
    (   cached_library_directory(clp,
				 absolute_file_name(swi('library/clp'), A),
				 A),
	B=A
    ).

can_reach(A, A, _, _).
can_reach(A, B, C, _) :-
	neib(A, B, _),
	\+ member(B, C).
can_reach(A, C, E, D) :-
	neib(A, B, _),
	B\==C,
	\+ member(B, D),
	\+ member(B, E),
	can_reach(B, C, E, [B|D]).

update(state(_, C), move(B, D), state(A, G)) :-
	A=B,
	subtract(C, [B], E),
	neib(B, F, D),
	append(E, [F], G).

add_map(A, [B|C]) :-
	(   atom_concat(A, '.pl', G),
	    length([B|C], D),
	    E is D+ -1,
	    F is E+ -1,
	    erase_map,
	    add_other(B, 0, E),
	    convert(B, C, F),
	    solvable(add)
	->  tell(G),
	    write_map,
	    told
	).

:- dynamic prolog_event_hook/1.
:- multifile prolog_event_hook/1.


delete_all([], _, []).
delete_all([A|C], B, D) :-
	member(A, B), !,
	delete_all(C, B, D).
delete_all([A|B], C, [A|D]) :-
	delete_all(B, C, D).

add_map_list(A) :-
	atom_concat('levels/', A, B),
	\+ exists_file(B), !,
	format('file ~w doesn`t exists~n', [A]).
add_map_list(A) :-
	(   atom_concat('levels/', A, B),
	    access_file(B, read)
	->  catch(open(B, read, M),
		  C,
		  ( print_message(error, C),
		    fail
		  )),
	    file_directory_name(A, F),
	    file_base_name(B, D),
	    file_name_extension(H, _, D),
	    working_directory(E, E),
	    atom_concat(F, /, G),
	    atom_concat(G, H, I),
	    atom_concat('maps/', I, J),
	    atom_concat(J, /, K),
	    atom_concat(E, K, L),
	    make_directory_path(L),
	    working_directory(_, L),
	    read_line_to_string(M, N),
	    add_map_list_(N, M, [], 0, 0, [], ''),
	    working_directory(_, E),
	    close(M)
	).

s_help :-
	format('\n    add_map_list\\1 % +File\n    add_maps\\0 %\n    add_maps\\1 %\n    load_map\\0  %\n    solve_map\\1 % +Map\n    draw_map\\1 % +Map\n    test_sol\\1 % +Map\n').

:- dynamic target_/1.


drawLine(B, _, D) :-
	getMaxX(A),
	C is A+1,
	B>C, !,
	reverse(D, E),
	printList(E, ''),
	nl.
drawLine(A, B, E) :-
	getSymbol(A-B, D),
	C is A+1,
	drawLine(C, B, [D|E]).

:- dynamic top/2.


d(B) :-
	getMinY(A),
	C is A+ -1,
	B<C, !.
d(C) :-
	getMinX(A),
	B is A+ -1,
	drawLine(B, C, []),
	D is C+ -1,
	d(D).

banned(_, A-B, C) :-
	blocked(A-B, C), !.
banned(l, A-B, G) :-
	target(C),
	\+ member(A-B, C),
	D is A+ -1,
	E is B+ -1,
	F is B+1,
	tupik(D-B,
	      D-E,
	      D-F,
	      A-F,
	      A-E,
	      G).
banned(r, A-B, G) :-
	target(C),
	\+ member(A-B, C),
	D is A+1,
	F is B+ -1,
	E is B+1,
	tupik(D-B,
	      D-E,
	      D-F,
	      A-F,
	      A-E,
	      G).
banned(u, A-B, G) :-
	target(C),
	\+ member(A-B, C),
	E is A+ -1,
	F is A+1,
	D is B+1,
	tupik(A-D,
	      E-D,
	      F-D,
	      F-B,
	      E-B,
	      G).
banned(d, A-B, G) :-
	target(C),
	\+ member(A-B, C),
	F is A+ -1,
	E is A+1,
	D is B+ -1,
	tupik(A-D,
	      E-D,
	      F-D,
	      F-B,
	      E-B,
	      G).

solve_problem(A, C) :-
	format('=============~n'),
	format('|| Problem: ~w~n', A),
	format('=============~n'),
	initial_state(A, B),
	format('Initial state: ~w~n', B),
	solve_dfs(A, B, [B], C).

goal(A) :-
	final(A).

write_map :-
	listing(initial/1),
	listing(target/1),
	listing(top/2),
	listing(right/2).

stuck(A, B) :-
	(   right(A, B)
	;   right(B, A)
	),
	(   \+ solution(A)
	;   \+ solution(B)
	),
	(   \+ top(A, _)
	;   \+ top(_, A)
	),
	(   \+ top(B, _)
	;   \+ top(_, B)
	).
stuck(A, B) :-
	(   top(A, B)
	;   top(B, A)
	),
	(   \+ solution(A)
	;   \+ solution(B)
	),
	(   \+ right(A, _)
	;   \+ right(_, A)
	),
	(   \+ right(B, _)
	;   \+ right(_, B)
	).

:- dynamic portray/1.
:- multifile portray/1.


test_sol(A) :-
	load_map(A),
	load_sol(A),
	initial(C),
	solution(B),
	testSol(B, C).

corner(A) :-
	\+ noncorner(A).

add_maps([]).
add_maps([A|B]) :-
	(   atom_concat(_, '.', A)
	;   atom_concat(_, .., A)
	), !,
	add_maps(B).
add_maps([C|J]) :-
	working_directory(A, A),
	atom_concat(A, 'levels/', B),
	atom_concat(B, C, D),
	exists_directory(D), !,
	directory_files(D, E),
	findall(H,
		( member(G, E),
		  atom_concat(C, /, F),
		  atom_concat(F, G, H)
		),
		I),
	add_maps(I),
	add_maps(J).
add_maps([A|B]) :-
	format('__==\'~s\'==__~n', [A]),
	(   add_map_list(A)
	;   true
	),
	nl, !,
	add_maps(B).

add_map_list_(end_of_file, _, C, D, B, E, A) :- !,
	(   A\==''
	->  H is B+1,
	    (   add_map(A, C)
	    ->  F is D+1,
		G=E
	    ;   F=D,
		G=[A|E]
	    )
	;   F=D,
	    H=B,
	    G=E
	),
	(   G\==[]
	->  format('~w/~w map(s) has been successfully added.\n\n',
		   [F, H]),
	    reverse(G, I),
	    format('Maps below contain some mistakes:\n\n'),
	    printStringList(I, '')
	;   format('All ~w map(s) has been successfully added.\n', [H])
	).
add_map_list_(A, R, E, I, N, J, F) :-
	string_chars(A, B),
	(   member(;, B)
	->  delete_all(B, [\, /, :, *, ?, '"', <, >, '|', ;, '\t', '\r'], C),
	    string_chars(D, C),
	    normalize_space(atom(G), D),
	    reverse(E, H),
	    (   F\==''
	    ->  M=G,
		(   add_map(F, H)
		->  K is I+1,
		    L=J
		;   K=I,
		    L=[F|J]
		)
	    ;   add_map(G, H)
	    ->  K is I+1,
		L=J,
		M=''
	    ;   K=I,
		(   N==0
		->  M=G,
		    O=0,
		    L=J
		;   M=F,
		    L=[G|J]
		)
	    ),
	    (   var(O)
	    ->  O is N+1
	    ;   true
	    ),
	    Q=[]
	;   delete_all_except(B, [#, ' ', -, $, '.', @, *, +], C),
	    remove_trailing_spaces(C, P),
	    (   P\==[]
	    ->  Q=[P|E]
	    ;   Q=E
	    ),
	    K=I,
	    O=N,
	    L=J,
	    M=F
	),
	read_line_to_string(R, S),
	add_map_list_(S,
		      R,
		      Q,
		      K,
		      O,
		      L,
		      M).

:- dynamic box_/1.


testSol([], A) :-
	final(A).
testSol([B|C], A) :-
	move(A, D, B), !,
	testSol(C, D).

reachable_by_sokoban(A, A, _, _, 0) :- !.
reachable_by_sokoban(A, E, D, C, I) :-
	bagof(pair(B, F),
	      (neib(A, B, _), \+member(B, C), \+member(B, D), distance(B, E, F)),
	      G),
	sort(2, @=<, G, H),
	r_b_s(H, E, D, C, I).

build_path(noparent, _, A, A).
build_path(A, B, D, E) :-
	member(A-C, B),
	build_path(C, B, [A|D], E).

neib(A, B, up) :-
	top(A, B).
neib(B, A, down) :-
	top(A, B).
neib(A, B, right) :-
	right(A, B).
neib(B, A, left) :-
	right(A, B).

:- dynamic initial/1.


checkMinX(B) :-
	right(A-_, _),
	A<B.

add_top([], _, _, _) :- !.
add_top(_, [], _, _) :- !.
add_top([B|F], [C|G], D, A) :-
	H is A+1,
	(   B\== #,
	    C\== #
	->  E is D+1,
	    assert(top(A-D, A-E))
	;   true
	),
	add_top(F, G, D, H).

del_undounded_nodes([]).
del_undounded_nodes([A|B]) :-
	(   retract(top(A, _))
	;   retract(right(A, _))
	;   true
	),
	del_undounded_nodes(B).

add_other([], _, _).
add_other([B, C|_], A, D) :-
	E is A+1,
	(   B\== #,
	    C\== #
	->  assert(right(A-D, E-D))
	;   true
	),
	fail.
add_other([A|D], B, C) :-
	(   (   A==(@)
	    ;   A==(+)
	    )
	->  assert(agent_(B-C))
	;   true
	),
	(   (   A==($)
	    ;   A==(*)
	    )
	->  assert(box_(B-C))
	;   true
	),
	(   (   A==('.')
	    ;   A==(*)
	    ;   A==(+)
	    )
	->  assert(target_(B-C))
	;   true
	),
	E is B+1,
	add_other(D, E, C).

noncorner(A) :-
	top(_, A),
	top(A, _).
noncorner(A) :-
	right(_, A),
	right(A, _).

solve_map2(A) :-
	load_map(A),
	solvable(load),
	aSearch(B),
	format('Pass: '),
	printList(B, ', ').

:- multifile prolog_predicate_name/2.


:- thread_local thread_message_hook/3.
:- dynamic thread_message_hook/3.
:- volatile thread_message_hook/3.


erase_map :-
	retractall(initial(_)),
	retractall(target(_)),
	retractall(top(_, _)),
	retractall(right(_, _)),
	retractall(agent_(_)),
	retractall(box_(_)),
	retractall(target_(_)).

boxes_in_pos([], _, 0) :- !.
boxes_in_pos([A|C], B, D) :-
	member(A, B), !,
	boxes_in_pos(C, B, E),
	D is E+1.
boxes_in_pos([_|A], B, C) :-
	boxes_in_pos(A, B, C).

:- multifile prolog_list_goal/1.


getMaxX(A) :-
	right(_, A-_),
	\+ checkMaxX(A), !.

remove_trailing_spaces([], []).
remove_trailing_spaces([A|B], [A|C]) :-
	remove_trailing_spaces(B, C),
	C\==[], !.
remove_trailing_spaces([A|B], [A|C]) :-
	A\==' ',
	A\==(-), !,
	remove_trailing_spaces(B, C).
remove_trailing_spaces([_|A], B) :-
	remove_trailing_spaces(A, B).

good_move(A, B) :-
	\+ member(A, B),
	\+ stuck(A),
	foreach(member(C, B), \+stuck(A, C)).

save_sol(C) :-
	current_predicate(solution/1),
	aggregate_all(count, solution(_), A),
	A==1,
	working_directory(B, B),
	file_base_name(C, H),
	file_directory_name(C, D),
	atom_concat(D, /, E),
	atom_concat('solutions/', E, F),
	atom_concat(B, F, G),
	make_directory_path(G),
	working_directory(_, G),
	tell(H),
	listing(solution/1),
	told,
	working_directory(_, B).

stuck(A) :-
	\+ solution(A),
	corner(A).

:- dynamic message_hook/3.
:- multifile message_hook/3.

message_hook(make(done(A)), _, _) :-
    plunit:
    (   make_run_tests(A),
	fail
    ).

unmatches(A, B, C) :-
	boxes_in_pos(A, B, E),
	length(B, D),
	C is D-E.

:- dynamic solution/1.


printPass([]) :- !.
printPass([A-B-C|D]) :-
	format('~w. ~w  ~w', [A, B, C]),
	nl,
	printPass(D).

:- dynamic right/2.


find_shortest_total_way(A, E) :-
	target(B),
	findall(C, find_way_cost(A, B, C), D),
	min_list(D, E).
