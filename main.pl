:- dynamic initial/1.
:- dynamic target/1.
:- dynamic top/2.
:- dynamic right/2.
:- dynamic agent_/1.
:- dynamic box_/1.
:- dynamic target_/1.
:- dynamic solution/1.

:- style_check(-singleton).
:- use_module(library(filesex), [ make_directory_path/1 ]).
/*
:- use_module(sokoban).
:- use_module(draw).
:- use_module(test).
:- use_module(help).
:- use_module(convert).
*/
:- consult('sokoban.pl').
:- consult('draw.pl').
:- consult('test.pl').
:- consult('help.pl').
:- consult('convert.pl').