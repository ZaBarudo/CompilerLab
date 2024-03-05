%{
    #include<stdio.h>
    #include<string.h>
    #include<stdlib.h>
    #include<ctype.h>
    #include"lex.yy.c"
    
    int yyerror(const char *s);
    int yylex(void);
    int yywrap();
    int success = 1;
%}

%token PLUS MINUS TIMES DIVIDE ASSIGN MODULO BITWISE_AND BITWISE_OR BITWISE_XOR BIT_CLEAR LEFT_SHIFT RIGHT_SHIFT ADD_ASSIGN SUB_ASSIGN MUL_ASSIGN DIV_ASSIGN MOD_ASSIGN AND_ASSIGN OR_ASSIGN XOR_ASSIGN LEFT_SHIFT_ASSIGN RIGHT_SHIFT_ASSIGN INCREMENT DECREMENT RECEIVE CLEAR_ASSIGN SHORT_VAR VARIADIC_PARAM SELECTOR EQUAL_EQUAL NOT_EQUAL LESS_THAN LESS_THAN_OR_EQUAL GREATER_THAN GREATER_THAN_OR_EQUAL LOGICAL_AND LOGICAL_OR LOGICAL_NOT IF ELSE WHILE FOR SWITCH CASE DEFAULT BREAK CONTINUE RETURN VAR INT_TYPE BOOL_TYPE STRING_TYPE IMPORT FUNCTION PACKAGE CHAN CONST DEFER FALLTHROUGH GO GOTO INTERFACE MAP RANGE SELECT STRUCT TYPE LPAREN RPAREN LBRACE RBRACE LSQPAREN RSQPAREN SEMICOLON COMMA COLON BOOLEAN IDENTIFIER INTEGER STRING FLOAT COMMENT MULTI-LINE-COMMENT

%define parse.error verbose
%%

program: entry '(' ')' '{' body return '}'
;


entry: datatype ID
;

datatype: INT 
| FLOAT 
| CHAR
;

body: block body
| 
;

block: WHILE '(' condition ')' ':' '{' body '}'
| IF '(' condition ')' ':' '{' body '}' else
| statement '.' 
| PRINTFF '(' STR ')' '.'
| SCANFF '(' STR ',' '&' ID ')' '.'
;

else: ELSE ':' '{' body '}'
|
;

condition: value relop value 
| TRUE 
| FALSE
;

statement: DECLARE ID datatype init 
| ID '=' expression 
| ID relop expression 
;

init: '=' value 
|
;


expression : expression addops term 
| term 
;

term : term mulops factor 
| factor 
; 

factor : base exponent base 
| LOG '(' value ',' value ')' 
| base
;

base : value 
| '(' expression ')' 
;


exponent: POW
;

mulops: MULT
| DIV
;

addops: ADD 
| SUB 
;

relop: LT
| GT
| LE
| GE
| EQ
| NE
;

value: NUMBER
| FLOAT_NUM
| ID
;

return: RETURN value '.' 
|
;

%%

int main() {
    extern FILE *yyin, *yyout;
   
    yyparse();
    if(success)
        printf("Parsing Successful\n");
    return 0;
}

int yyerror(const char *msg)
{
    extern int yylineno;
    printf("Parsing Failed\nLine Number: %d %s\n",yylineno,msg);
    success = 0;
    return 0;
}