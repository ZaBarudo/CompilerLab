%{
#include <stdio.h>
#include <string.h>
#include "y.tab.h"

int countn = 0;
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

"+"             { strcpy(yylval.nd_obj.name,(yytext)); return PLUS; }
"-"             { strcpy(yylval.nd_obj.name,(yytext)); return MINUS; }
"*"             { strcpy(yylval.nd_obj.name,(yytext)); return TIMES; }
"/"             { strcpy(yylval.nd_obj.name,(yytext)); return DIVIDE; }
"="             { strcpy(yylval.nd_obj.name,(yytext)); return ASSIGN; }
"%"             { strcpy(yylval.nd_obj.name,(yytext)); return MODULO; }
"&"             { strcpy(yylval.nd_obj.name,(yytext)); return BITWISE_AND; }
"|"             { strcpy(yylval.nd_obj.name,(yytext)); return BITWISE_OR; }
"^"             { strcpy(yylval.nd_obj.name,(yytext)); return BITWISE_XOR; }
"&^"            { strcpy(yylval.nd_obj.name,(yytext)); return BIT_CLEAR; }
"<<"            { strcpy(yylval.nd_obj.name,(yytext)); return LEFT_SHIFT; }
">>"            { strcpy(yylval.nd_obj.name,(yytext)); return RIGHT_SHIFT; }
"+="            { strcpy(yylval.nd_obj.name,(yytext)); return ADD_ASSIGN; }
"-="            { strcpy(yylval.nd_obj.name,(yytext)); return SUB_ASSIGN; }
"*="            { strcpy(yylval.nd_obj.name,(yytext)); return MUL_ASSIGN; }
"/="            { strcpy(yylval.nd_obj.name,(yytext)); return DIV_ASSIGN; }
"%="            { strcpy(yylval.nd_obj.name,(yytext)); return MOD_ASSIGN; }
"&="            { strcpy(yylval.nd_obj.name,(yytext)); return AND_ASSIGN; }
"|="            { strcpy(yylval.nd_obj.name,(yytext)); return OR_ASSIGN; }
"^="            { strcpy(yylval.nd_obj.name,(yytext)); return XOR_ASSIGN; }
"<<="           { strcpy(yylval.nd_obj.name,(yytext)); return LEFT_SHIFT_ASSIGN; }
">>="           { strcpy(yylval.nd_obj.name,(yytext)); return RIGHT_SHIFT_ASSIGN; }
"++"            { strcpy(yylval.nd_obj.name,(yytext)); return INCREMENT; }
"--"            { strcpy(yylval.nd_obj.name,(yytext)); return DECREMENT; }
"<-"            { strcpy(yylval.nd_obj.name,(yytext)); return RECEIVE; }
"&^="           { strcpy(yylval.nd_obj.name,(yytext)); return CLEAR_ASSIGN; }
":="            { strcpy(yylval.nd_obj.name,(yytext)); return SHORT_VAR; }
"..."           { strcpy(yylval.nd_obj.name,(yytext)); return VARIADIC_PARAM; }
"."             { strcpy(yylval.nd_obj.name,(yytext)); return SELECTOR; }
"=="            { strcpy(yylval.nd_obj.name,(yytext)); return EQUAL_EQUAL; }
"!="            { strcpy(yylval.nd_obj.name,(yytext)); return NOT_EQUAL; }
"<"             { strcpy(yylval.nd_obj.name,(yytext)); return LESS_THAN; }
"<="            { strcpy(yylval.nd_obj.name,(yytext)); return LESS_THAN_OR_EQUAL; }
">"             { strcpy(yylval.nd_obj.name,(yytext)); return GREATER_THAN; }
">="            { strcpy(yylval.nd_obj.name,(yytext)); return GREATER_THAN_OR_EQUAL; }
"&&"            { strcpy(yylval.nd_obj.name,(yytext)); return LOGICAL_AND; }
"||"            { strcpy(yylval.nd_obj.name,(yytext)); return LOGICAL_OR; }
"!"             { strcpy(yylval.nd_obj.name,(yytext)); return LOGICAL_NOT; }

"if"            { strcpy(yylval.nd_obj.name,(yytext)); return IF; }
"else"          { strcpy(yylval.nd_obj.name,(yytext)); return ELSE; }
"while"         { strcpy(yylval.nd_obj.name,(yytext)); return WHILE; }
"for"           { strcpy(yylval.nd_obj.name,(yytext)); return FOR; }
"switch"        { strcpy(yylval.nd_obj.name,(yytext)); return SWITCH; }
"case"          { strcpy(yylval.nd_obj.name,(yytext)); return CASE; }
"default"       { strcpy(yylval.nd_obj.name,(yytext)); return DEFAULT; }
"break"         { strcpy(yylval.nd_obj.name,(yytext)); return BREAK; }
"continue"      { strcpy(yylval.nd_obj.name,(yytext)); return CONTINUE; }
"return"        { strcpy(yylval.nd_obj.name,(yytext)); return RETURN; }
"var"           { strcpy(yylval.nd_obj.name,(yytext)); return VAR; }
"int"           { strcpy(yylval.nd_obj.name,(yytext)); return INT_TYPE; }
"bool"          { strcpy(yylval.nd_obj.name,(yytext)); return BOOL_TYPE; }
"string"        { strcpy(yylval.nd_obj.name,(yytext)); return STRING_TYPE; }
"import"        { strcpy(yylval.nd_obj.name,(yytext)); return IMPORT; }
"func"          { strcpy(yylval.nd_obj.name,(yytext)); return FUNCTION; }
"package"       { strcpy(yylval.nd_obj.name,(yytext)); return PACKAGE; }
"chan"          { strcpy(yylval.nd_obj.name,(yytext)); return CHAN; }
"const"         { strcpy(yylval.nd_obj.name,(yytext)); return CONST; }
"defer"         { strcpy(yylval.nd_obj.name,(yytext)); return DEFER; }
"fallthrough"   { strcpy(yylval.nd_obj.name,(yytext)); return FALLTHROUGH; }
"go"            { strcpy(yylval.nd_obj.name,(yytext)); return GO; }
"goto"          { strcpy(yylval.nd_obj.name,(yytext)); return GOTO; }
"interface"     { strcpy(yylval.nd_obj.name,(yytext)); return INTERFACE; }
"map"           { strcpy(yylval.nd_obj.name,(yytext)); return MAP; }
"range"         { strcpy(yylval.nd_obj.name,(yytext)); return RANGE; }
"select"        { strcpy(yylval.nd_obj.name,(yytext)); return SELECT; }
"struct"        { strcpy(yylval.nd_obj.name,(yytext)); return STRUCT; }
"println"      { strcpy(yylval.nd_obj.name,(yytext)); return PRINTLN; }

"("             { strcpy(yylval.nd_obj.name,(yytext)); return LPAREN; }
")"             { strcpy(yylval.nd_obj.name,(yytext)); return RPAREN; }
"{"             { strcpy(yylval.nd_obj.name,(yytext)); return LBRACE; }
"}"             { strcpy(yylval.nd_obj.name,(yytext)); return RBRACE; }
"["             { strcpy(yylval.nd_obj.name,(yytext)); return LSQPAREN; }
"]"             { strcpy(yylval.nd_obj.name,(yytext)); return RSQPAREN; }
";"             { strcpy(yylval.nd_obj.name,(yytext)); return SEMICOLON; }
","             { strcpy(yylval.nd_obj.name,(yytext)); return COMMA; }
":"             { strcpy(yylval.nd_obj.name,(yytext)); return COLON; }


{BOOLEAN}       { strcpy(yylval.nd_obj.name,(yytext)); return BOOLEAN; }
{IDENTIFIER}    { 
                    if(strlen(yytext)<=32){
                        strcpy(yylval.nd_obj.name,(yytext)); return IDENTIFIER;
                    } 
                    else {
                        printf("%s: Identifier is too long\n",yytext);
                    };
                }

{INTEGER}       { strcpy(yylval.nd_obj.name,(yytext)); return INTEGER; }
{STRING}        { strcpy(yylval.nd_obj.name,(yytext)); return STRING; }
{FLOAT}         { strcpy(yylval.nd_obj.name,(yytext)); return FLOAT; }
{COMMENT}       { strcpy(yylval.nd_obj.name,(yytext)); return COMMENT; }
{MLCOMMENT}     { strcpy(yylval.nd_obj.name,(yytext)); return MULTI_LINE_COMMENT; }
[^\t\n\f\r\040] { printf("Error: Illegal character - %s\n", yytext); }
\"[^\"\n]*$ { printf("Error: Unterminated string - %s\n", yytext); }

[ \t\n\r]         { ; } /* Skip whitespace and newlines */
\n              { yylineno++; countn++; }
%%

int yywrap() {
   return 1;
}
