:- dynamic initial/1.
:- dynamic target/1.
:- dynamic top/2.
:- dynamic right/2.
:- dynamic agent_/1.
:- dynamic box_/1.
:- dynamic target_/1.
:- dynamic solution/1.

:- style_check(-singleton).
:- use_module(library(shlib), [ use_foreign_library/2 ]).
:- use_module(library(filesex), [ make_directory_path/1 ]).
:- use_module(library(readutil), [ read_line_to_string/2 ]).
:- use_module(library(lists), [ member/2,
                                reverse/2,
                                append/3,
                                subset/2,
                                subtract/3,
                                min_list/2,
                                select/3 ]).
:- use_module(library(plunit), [ begin_tests/1,
                                 end_tests/1,
                                 run_tests/0 ]).
:- use_module(library(dialect/eclipse/test_util_iso), [ test/1 ]).
:- use_module(library(aggregate), [ aggregate_all/3 ]).
:- use_module(library(listing), [ listing/1 ]).
:- use_module(library(dialect/sicstus/timeout), [ time_out/3 ]).
/*
:- use_module(sokoban).
:- use_module(print).
:- use_module(test).
:- use_module(help).
:- use_module(convert).
*/
:- consult('sokoban.pl').
:- consult('print.pl').
:- consult('test.pl').
:- consult('help.pl').
:- consult('convert.pl').

/*
atom_concat
exists_file
consult
sort
not
length
write
bagof
statistics
current_predicate
working_directory
retract
retractall
file_base_name
file_name_extension
file_directory_name
make_directory_path
exists_directory
directory_files
tell
catch
sqrt
told
access_file
format
reverse
findall
string_chars
normalize_space
assert
var
nl
*/