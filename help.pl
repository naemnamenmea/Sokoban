/*
:- module(help,
[
    s_help/0,
    s_help/1, % +print_map
]).
*/

s_help :- format('
    add_map_list/1 % +File
    add_maps/0 %
    add_maps/1 % +ListOfFilesWithLvls
    add_map_list/1 % +FileWithLvls
    load_map/1  % +Map
    solve_map/1 % +Map
    solvable/1 % +load
    print_map/0
    print_map/1 % +Map
    test_sol/1 % +Map
    solve_dfs/1 % +Map
    solve_Astar/1 % +Map
').

s_help(print_map) :- format('
    "#" is a wall
    space or "-" is an empty square
    "." is a target square
    "$" is a box in a square
    "@" is a player in a square
    "*" is a box on a target square
    "+" is a player on a target square
').