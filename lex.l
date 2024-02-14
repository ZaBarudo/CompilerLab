%{
#include <stdio.h>
#include <string.h>
int countId = 0, countKeyword = 0, countPunctuator = 0, countOperator = 0, countLiteral = 0;
%}

/* Regular Definitions */
DIGIT       [0-9]
LETTER      [a-zA-Z]
IDENTIFIER  {LETTER}({LETTER}|{DIGIT})*
INTEGER     {DIGIT}+
STRING      \`[^\`]*\`|\"[^\"]*\"
FLOAT           {DIGIT}+"."{DIGIT}+
BOOLEAN         true|false
COMMENT      \/\/.*\n

/* Rules */
%%

"+"             { printf("PLUS\n"); countOperator++; }
"-"             { printf("MINUS\n");  countOperator++; }
"*"             { printf("TIMES\n");  countOperator++; }
"/"             { printf("DIVIDE\n");  countOperator++; }
"="             { printf("ASSIGN\n");  countOperator++; }
"%"             { printf("MODULO\n");  countOperator++; }
"&"             { printf("BITWISE_AND\n");  countOperator++; }
"|"             { printf("BITWISE_OR\n");  countOperator++; }
"^"             { printf("BITWISE_XOR\n");  countOperator++; }
"&^"            { printf("BIT_CLEAR\n");  countOperator++; }
"<<"            { printf("LEFT_SHIFT\n");  countOperator++; }
">>"            { printf("RIGHT_SHIFT\n");  countOperator++; }
"+="           { printf("ADD_ASSIGN\n");  countOperator++; }
"-="           { printf("SUB_ASSIGN\n");  countOperator++; }
"*="           { printf("MUL_ASSIGN\n");  countOperator++; }
"/="           { printf("DIV_ASSIGN\n");  countOperator++; }
"%="           { printf("MOD_ASSIGN\n");  countOperator++; }
"&="           { printf("AND_ASSIGN\n");  countOperator++; }
"|="           { printf("OR_ASSIGN\n");  countOperator++; }
"^="           { printf("XOR_ASSIGN\n");  countOperator++; }
"<<="           { printf("LEFT_SHIFT_ASSIGN\n");  countOperator++; }
">>="           { printf("RIGHT_SHIFT_ASSIGN\n");  countOperator++; }
"++"           { printf("INCREMENT\n");  countOperator++; }
"--"           { printf("DECREMENT\n");  countOperator++; }
"<-"           { printf("RECEIVE\n");  countOperator++; }
"&^="           { printf("CLEAR_ASSIGN\n");  countOperator++; }
":="           { printf("SHORT_VAR\n");  countOperator++; }
"..."           { printf("VARIADIC_PARAM\n");  countOperator++; }
"."           { printf("SELECTOR\n");  countOperator++; }
"=="            { printf("EQUAL_EQUAL\n"); countOperator++; }
"!="            { printf("NOT_EQUAL\n"); countOperator++; }
"<"             { printf("LESS_THAN\n"); countOperator++; }
"<="            { printf("LESS_THAN_OR_EQUAL\n"); countOperator++; }
">"             { printf("GREATER_THAN\n"); countOperator++; }
">="            { printf("GREATER_THAN_OR_EQUAL\n"); countOperator++; }
"&&"            { printf("LOGICAL_AND\n"); countOperator++; }
"||"            { printf("LOGICAL_OR\n"); countOperator++; }
"!"             { printf("LOGICAL_NOT\n"); countOperator++; }

"if"            { printf("IF\n"); countKeyword++; }
"else"          { printf("ELSE\n"); countKeyword++; }
"while"         { printf("WHILE\n"); countKeyword++; }
"for"           { printf("FOR\n"); countKeyword++; }
"switch"        { printf("SWITCH\n"); countKeyword++; }
"case"          { printf("CASE\n"); countKeyword++; }
"default"       { printf("DEFAULT\n"); countKeyword++; }
"break"         { printf("BREAK\n"); countKeyword++; }
"continue"      { printf("CONTINUE\n"); countKeyword++; }
"return"        { printf("RETURN\n"); countKeyword++; }
"var"           { printf("VAR\n"); countKeyword++; }
"int"           { printf("INT_TYPE\n"); countKeyword++; }
"bool"           { printf("BOOL_TYPE\n"); countKeyword++; }
"string"        { printf("STRING_TYPE\n"); countKeyword++; }
"import"        { printf("IMPORT\n"); countKeyword++; }
"func"          { printf("FUNCTION\n"); countKeyword++; }
"package"       { printf("PACKAGE\n"); countKeyword++; }
"chan"          { printf("CHAN\n"); countKeyword++;}
"const"          { printf("CONST\n"); countKeyword++;}
"defer"         { printf("DEFER\n"); countKeyword++;}    
"fallthrough"   { printf("FALLTHROUGH\n"); countKeyword++;}
"go"            { printf("GO\n"); countKeyword++;}
"goto"          { printf("GOTO\n"); countKeyword++;}
"interface"     { printf("INTERFACE\n"); countKeyword++;}
"map"           { printf("MAP\n"); countKeyword++;}
"range"         { printf("RANGE\n"); countKeyword++;}
"select"        { printf("SELECT\n"); countKeyword++;}
"struct"        { printf("STRUCT\n"); countKeyword++;}
"type"          { printf("TYPE\n"); countKeyword++;}
 
"("             { printf("LPAREN\n"); countPunctuator++; }
")"             { printf("RPAREN\n"); countPunctuator++; }
"{"             { printf("LBRACE\n"); countPunctuator++; }
"}"             { printf("RBRACE\n"); countPunctuator++; }
";"             { printf("SEMICOLON\n"); countPunctuator++; }
","             { printf("COMMA\n"); countPunctuator++; }
":"             { printf("COLON\n"); countPunctuator++; }


{BOOLEAN}       { printf("BOOLEAN: %s\n", yytext); countKeyword++; }
{IDENTIFIER}    { 
                    if(strlen(yytext)<=32){
                        printf("IDENTIFIER: %s\n", yytext); countId++;
                    } 
                    else {
                        printf("%s: Identifier is too long\n",yytext);
                    };
                }

{INTEGER}       { printf("INTEGER: %s\n", yytext); countLiteral++; }
{STRING}        { printf("STRING: %s\n", yytext); countLiteral++; }
{FLOAT}         { printf("FLOAT: %s\n", yytext); countLiteral++; }
{COMMENT}       { printf("COMMENT: %s\n", yytext);}


[ \t\n]         ; /* Skip whitespace and newlines */
.               { printf("INVALID CHARACTER: %s\n", yytext); }

%%

void displayCountToken() {
    printf("\n-----------------------------------------------\n\n");
    printf("%d Identifiers\n", countId);
    printf("%d Keywords\n", countKeyword);
    printf("%d Punctuators\n", countPunctuator);
    printf("%d Operators\n", countOperator);
    printf("%d Literals\n", countLiteral);
}

int main() {
    yylex();
    displayCountToken();
    return 0;
}
