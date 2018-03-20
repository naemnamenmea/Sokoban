/*
:- module(test,
[
    testSol/2,
    test_sol/2,
    q_test_sol/1
]).
*/
load_sol(Map) :- 
    retractall(solution(_)), 
    atom_concat('solutions/',Map,Sol),
    exists_file(Sol) -> consult(Sol).
    
save_sol(Map) :- 
    current_predicate(solution/1),
    aggregate_all(count, solution(_), Count), Count==1,
    working_directory(CWD,CWD),
    file_base_name(Map,Base),
    file_directory_name(Map,Dir),
    atom_concat(Dir,'/',Dir1),
    atom_concat('solutions/',Dir1,Sol),
    atom_concat(CWD,Sol,NWD),
    make_directory_path(NWD),
    working_directory(_,NWD),
    tell(Base), listing(solution/1), told,
    working_directory(_,CWD).    
    
testSol([],State) :- final(State).
testSol([Move|Pass],A) :- move(A,B,Move), !, testSol(Pass,B).

test_sol(Map) :- load_map(Map), load_sol(Map), initial(Init), solution(Sol), testSol(Sol,Init).