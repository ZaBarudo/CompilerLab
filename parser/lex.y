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

%token PLUS MINUS TIMES DIVIDE ASSIGN MODULO BITWISE_AND BITWISE_OR BITWISE_XOR BIT_CLEAR LEFT_SHIFT RIGHT_SHIFT ADD_ASSIGN SUB_ASSIGN MUL_ASSIGN 
%token DIV_ASSIGN MOD_ASSIGN AND_ASSIGN OR_ASSIGN XOR_ASSIGN LEFT_SHIFT_ASSIGN RIGHT_SHIFT_ASSIGN INCREMENT DECREMENT RECEIVE CLEAR_ASSIGN 
%token SHORT_VAR VARIADIC_PARAM SELECTOR EQUAL_EQUAL NOT_EQUAL LESS_THAN LESS_THAN_OR_EQUAL GREATER_THAN GREATER_THAN_OR_EQUAL LOGICAL_AND 
%token LOGICAL_OR LOGICAL_NOT IF ELSE WHILE FOR SWITCH CASE DEFAULT BREAK CONTINUE RETURN VAR INT_TYPE BOOL_TYPE STRING_TYPE IMPORT FUNCTION 
%token PACKAGE CHAN CONST DEFER FALLTHROUGH GO GOTO INTERFACE MAP RANGE SELECT STRUCT TYPE LPAREN RPAREN LBRACE RBRACE LSQPAREN RSQPAREN SEMICOLON 
%token COMMA COLON BOOLEAN IDENTIFIER INTEGER STRING FLOAT COMMENT MULTI-LINE-COMMENT

%define parse.error verbose
%%


program: PackageClause ';' ImportDecls TopLevelDecls
;

PackageClause: PACKAGE PackageName
;

PackageName: IDENTIFIER
;

ImportDecls: ImportDecls ImportDecl
|
;

ImportDecl: IMPORT ImportSpec
| IMPORT '(' ImportSpecs')'
;

ImportSpecs: ImportSpecs ImportSpec
| 
;

ImportSpec: '.' ImportPath ';'
| PackageName ImportPath ';'
| ImportPath ';'
;

ImportPath: STRING
;

TopLevelDecls: TopLevelDecls TopLevelDecl
| 
;

TopLevelDecl : var_declarations               
| type_declarations             
| function_declaration
;

var_declarations : VAR declaration                 
| VAR '(' declaration_list ')'    
;

declaration_list : 				                   
| declaration ';' declaration_list 
;

declaration : identifier_list IDENTIFIER                                      
| identifier_list '(' IDENTIFIER ')'                           
| identifier_list bracket_list IDENTIFIER                      
| identifier_list '=' expression_list                           
| identifier_list IDENTIFIER '=' expression_list               
| identifier_list '(' IDENTIFIER ')' '=' expression_list      
| identifier_list bracket_list IDENTIFIER '=' expression_list  
| identifier_list STRUCT '{' declaration_list '}' 		
| identifier_list bracket_list STRUCT '{' declaration_list '}'	

identifier_list :  IDENTIFIER                      
|  IDENTIFIER ',' identifier_list  
;

type_declarations : TYPE type_declaration               
| TYPE '(' type_declaration_list ')'  
;

type_declaration : IDENTIFIER IDENTIFIER                                      
		 | IDENTIFIER '(' IDENTIFIER ')'                             
		 | IDENTIFIER STRUCT '{' declaration_list '}'                 
		 | IDENTIFIER bracket_list IDENTIFIER		                
		 | IDENTIFIER bracket_list STRUCT '{' declaration_list '}'    
		 ;

type_declaration_list : 					                        
                      | type_declaration ';' type_declaration_list 
                      ;

function_declaration : FUNC IDENTIFIER signature block_stmt   
                     ;

signature : '(' parameters ')' result 	
          | '(' ')' result 		        
	      ;

result : 				
       | IDENTIFIER                   
       | bracket_list IDENTIFIER      
       | STRUCT '{' declaration_list '}' 
       | bracket_list STRUCT '{' declaration_list '}' 
       ;

parameters : parameter_unit			          
	       | parameter_unit ',' parameters    
	       ;

parameter_unit : identifier_list IDENTIFIER  
               | identifier_list '(' IDENTIFIER ')'      
               | identifier_list bracket_list IDENTIFIER
               ;

bracket : '[' INTEGER ']'   
        | '[' ']'               
        ;

bracket_list : bracket               
             | bracket bracket_list  
             ;
/* not done with rules */

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