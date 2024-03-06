%{
#include <stdio.h>
#include <string.h>
#include "y.tab.h"
int line_no=0;
%}
%option yylineno

/* Regular Definitions */
DIGIT       [0-9]
LETTER      [a-zA-Z]
IDENTIFIER  {LETTER}({LETTER}|{DIGIT})*
INTEGER     [0-9]{DIGIT}*
STRING      \`[^\`]*\`|\"[^\"]*\"
FLOAT           {DIGIT}+"."{DIGIT}+
BOOLEAN         true|false
COMMENT      \/\/.*\n
MLCOMMENT    "/*"([^*]|\*+[^*/])*\*+"/"



/* Rules */
%%

"+"             { return PLUS; }
"-"             { return MINUS; }
"*"             { return TIMES; }
"/"             { return DIVIDE; }
"="             { return ASSIGN; }
"%"             { return MODULO; }
"&"             { return BITWISE_AND; }
"|"             { return BITWISE_OR; }
"^"             { return BITWISE_XOR; }
"&^"            { return BIT_CLEAR; }
"<<"            { return LEFT_SHIFT; }
">>"            { return RIGHT_SHIFT; }
"+="            { return ADD_ASSIGN; }
"-="            { return SUB_ASSIGN; }
"*="            { return MUL_ASSIGN; }
"/="            { return DIV_ASSIGN; }
"%="            { return MOD_ASSIGN; }
"&="            { return AND_ASSIGN; }
"|="            { return OR_ASSIGN; }
"^="            { return XOR_ASSIGN; }
"<<="           { return LEFT_SHIFT_ASSIGN; }
">>="           { return RIGHT_SHIFT_ASSIGN; }
"++"            { return INCREMENT; }
"--"            { return DECREMENT; }
"<-"            { return RECEIVE; }
"&^="           { return CLEAR_ASSIGN; }
":="            { return SHORT_VAR; }
"..."           { return VARIADIC_PARAM; }
"."             { return SELECTOR; }
"=="            { return EQUAL_EQUAL; }
"!="            { return NOT_EQUAL; }
"<"             { return LESS_THAN; }
"<="            { return LESS_THAN_OR_EQUAL; }
">"             { return GREATER_THAN; }
">="            { return GREATER_THAN_OR_EQUAL; }
"&&"            { return LOGICAL_AND; }
"||"            { return LOGICAL_OR; }
"!"             { return LOGICAL_NOT; }

"if"            { return IF; }
"else"          { return ELSE; }
"while"         { return WHILE; }
"for"           { return FOR; }
"switch"        { return SWITCH; }
"case"          { return CASE; }
"default"       { return DEFAULT; }
"break"         { return BREAK; }
"continue"      { return CONTINUE; }
"return"        { return RETURN; }
"var"           { return VAR; }
"int"           { return INT_TYPE; }
"bool"          { return BOOL_TYPE; }
"string"        { return STRING_TYPE; }
"import"        { return IMPORT; }
"func"          { return FUNCTION; }
"package"       { return PACKAGE; }
"chan"          { return CHAN; }
"const"         { return CONST; }
"defer"         { return DEFER; }
"fallthrough"   { return FALLTHROUGH; }
"go"            { return GO; }
"goto"          { return GOTO; }
"interface"     { return INTERFACE; }
"map"           { return MAP; }
"range"         { return RANGE; }
"select"        { return SELECT; }
"struct"        { return STRUCT; }
"println"      { return PRINTLN; }

"("             { return LPAREN; }
")"             { return RPAREN; }
"{"             { return LBRACE; }
"}"             { return RBRACE; }
"["             { return LSQPAREN; }
"]"             { return RSQPAREN; }
";"             { return SEMICOLON; }
","             { return COMMA; }
":"             { return COLON; }


{BOOLEAN}       { return BOOLEAN; }
{IDENTIFIER}    { 
                    if(strlen(yytext)<=32){
                        return IDENTIFIER;
                    } 
                    else {
                        printf("%s: Identifier is too long\n",yytext);
                    };
                }

{INTEGER}       { return INTEGER; }
{STRING}        { return STRING; }
{FLOAT}         { return FLOAT; }
{COMMENT}       { return COMMENT; }
{MLCOMMENT}     { return MULTI_LINE_COMMENT; }
[^\t\n\f\r\040] { printf("Error: Illegal character - %s\n", yytext); }
\"[^\"\n]*$ { printf("Error: Unterminated string - %s\n", yytext); }

[ \t\n\r]         { ; } /* Skip whitespace and newlines */
\n              { yylineno++; }
%%

int yywrap(void) {
   return 1;
}
