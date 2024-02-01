%{
 #include <stdio.h>

 int countId = 0, countKeyword = 0, countPunctuator = 0, countOperator =0, countLiteral =0;
%}



/* Regular Definitions */
DIGIT       [0-9]
LETTER      [a-zA-Z]
IDENTIFIER  {LETTER}({LETTER}|{DIGIT})*
INTEGER     {DIGIT}+
STRING      \"[^\"]*\"

/* Rules */
%%



"+"             { printf("PLUS\n"); countOperator++; }
"-"             { printf("MINUS\n");  countOperator++; }
"*"             { printf("TIMES\n");  countOperator++; }
"/"             { printf("DIVIDE\n");  countOperator++; }
"="             { printf("ASSIGN\n");  countOperator++; }
"%"             { printf("MODULO\n");  countOperator++; }

"if"            { printf("IF\n"); countKeyword++; }
"else"          { printf("ELSE\n"); countKeyword++; }
"while"         { printf("WHILE\n"); countKeyword++; }
"var"           { printf("VAR\n"); countKeyword++; }
"int"           { printf("INT_TYPE\n"); countKeyword++; }
"string"        { printf("STRING_TYPE\n"); countKeyword++; }
"import"        { printf("IMPORT\n"); countKeyword++; }
"func"          { printf("FUNCTION\n"); countKeyword++; }


"("             { printf("LPAREN\n"); countPunctuator++; }
")"             { printf("RPAREN\n"); countPunctuator++; }
"{"             { printf("LBRACE\n"); countPunctuator++; }
"}"             { printf("RBRACE\n"); countPunctuator++; }
";"             { printf("SEMICOLON\n"); countPunctuator++; }

{IDENTIFIER}    { printf("IDENTIFIER: %s\n", yytext); countId++; }

{INTEGER}       { printf("INTEGER: %s\n", yytext); countLiteral++; }
{STRING}        { printf("STRING: %s\n", yytext); countLiteral++; }

[ \t\n]         ; /* Skip whitespace and newlines */
.               { printf("INVALID CHARACTER: %s\n", yytext); }

%%

void displayCountToken(){
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
