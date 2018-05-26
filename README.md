# Sokoban

Main file - __*"main.pl"*__.

Common encoded map sets stored in __*"levels"*__.

Prolog encoded maps stored in __*"maps"*__.

Solutions stored in __*"solutions"*__.

### Check the available solution for map for correctness

```prolog
test_sol/1 % +Map

?- test_sol('2.pl').
true.

?- test_sol('3.pl').
false.

?- test_sol('1.pl').
true.
```
### Load map

```prolog
load_map/1 % +Map

?- load_map('1.pl').
true.

?- load_map('100Boxes/zip.pl').
true.

?- load_map('not_exists.pl').
false.

?- load_map('path/not_exists.pl').
false.
```
### Add all map sets from _"levels"_ folder to _"maps"_ folder

```prolog
add_maps/0

?- add_maps.
File: 'takaken.txt'
All 7 map(s) has been successfully added.

File: 'lvl1'
All 1 map(s) has been successfully added.

File: 'mylvl.pl'
All 1 map(s) has been successfully added.

File: 'New/lvl1.txt'
All 1 map(s) has been successfully added.

File: 'Revenge_28.format'
All 50 map(s) has been successfully added.

File: 'test.txt'
8/9 map(s) has been successfully added.

Maps below contain some mistakes:

* test_4

true.
```
### Add custom map sets from _"levels"_ folder to _"maps"_ folder

```prolog
add_maps/1 % +MapSetArray

?- add_maps(['map_collection1.txt', 'lvl1', 'Revenge_28.format']).
File: 'map_collection1.txt'
file map_collection1.txt doesn`t exists

File: 'lvl1'
0/1 map(s) has been successfully added.

Maps below contain some mistakes:

* fff

File: 'Revenge_28.format'
All 50 map(s) has been successfully added.

true.
```
### Basic validation of the loaded map to the insolubility

```prolog
solvable/1 % +load

?- load_map('1.pl'), solvable(load).
true.
```
### Add map set

```prolog
add_map_list/1 % +File     ~     add_maps([E])

?- add_map_list('lvl1').
0/1 map(s) has been successfully added.

Maps below contain some mistakes:

fdsfds
true.    

?- add_map_list('100Boxes.txt').
All 10 map(s) has been successfully added.
true.    
```
### Print map

```prolog
print_map/1 % +Map

?- print_map('maps/696/Level 1.pl').
######
###@.#
##.$$#
## $ #
# .# #
#    #
#  ###
######
true.
```
## Uninformative search
### Solve map by DFS (limited depth & no cycles)

```prolog
solve_dfs/1 % +Map

?- solve_dfs('maps/696/Level 1.pl').
Squares: 17
Boxes: 3
new sol -- found by <dfs>
Pass: rDDLruulDlDDlddrUUldrrrUUUllDDldRluruurrdLrullDDlddrUUUrrddLruulldlddrU

m/p: 71/22
CPU time = 2090 msec
true.
```
## Informative search
### Solve map by `A*`

```prolog
solve_Astar/1 % +Map

?- solve_Astar('maps/696/Level 1.pl').
Squares: 17
Boxes: 3
new sol -- found by <a-star>
Pass: rDDLruulDlDDlddrUrrUUUlldDldRuuurrdLulDDlddrUUUrrddLruulldlddrU
Closed vertices: 951
Max open vertices: 60
m/p: 63/20
CPU time = 156 msec
true.



?- solve_map('maps/696/Level 10.pl',a-star,(_,_,_,":)"),true).
Squares: 20
Boxes: 3
new sol -- found by <a-star>
Pass: URUUlDrddlluRdrUluurrrddLLUluRdddlUrrruuuullDDDuuurrddddlLuuRldddlluRdrUrruUlllDurrrUdddllUluRRldddlluRdrUrruUddllUluRR
Closed vertices: 9962
Max open vertices: 202
m/p: 119/31
CPU time = 11326 msec
true.

?- solve_map('maps/696/Level 10.pl',a-star,(_,_,_,push_only),true).
Squares: 20
Boxes: 3
new sol -- found by <a-star>
Pass: URUUlDrddlluRdrUluurrrddLLUluRdddlUrrruuuullDDDuuurrddddlLuuRldddlluRdrUrruUlllDurrrUdddllUluRRlddrruUddlldlluRdrUUluRR
Closed vertices: 903
Max open vertices: 87
m/p: 119/31
CPU time = 437 msec
true.
```

### Tips
- You can use `<Ctrl+C>` and then `<A>` key If tired to wait the solution.