#!/bin/bash


lex lex.l

yacc -v -d parser.y
gcc y.tab.c


./a.out<input.txt
