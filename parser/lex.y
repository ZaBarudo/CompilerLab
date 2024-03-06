%{
    #include<stdio.h>
    #include<string.h>
    #include<stdlib.h>
    #include<ctype.h>
    #define YYDEBUG 1
    int yyerror(const char *s);
    int yylex(void);
    int yywrap();
    int success = 1;
    extern int yylineno;
%}

%token PLUS MINUS TIMES DIVIDE ASSIGN MODULO BITWISE_AND BITWISE_OR BITWISE_XOR BIT_CLEAR LEFT_SHIFT RIGHT_SHIFT ADD_ASSIGN SUB_ASSIGN MUL_ASSIGN 
%token DIV_ASSIGN MOD_ASSIGN AND_ASSIGN OR_ASSIGN XOR_ASSIGN LEFT_SHIFT_ASSIGN RIGHT_SHIFT_ASSIGN INCREMENT DECREMENT RECEIVE CLEAR_ASSIGN 
%token SHORT_VAR VARIADIC_PARAM SELECTOR EQUAL_EQUAL NOT_EQUAL LESS_THAN LESS_THAN_OR_EQUAL GREATER_THAN GREATER_THAN_OR_EQUAL LOGICAL_AND 
%token LOGICAL_OR LOGICAL_NOT IF ELSE WHILE FOR SWITCH CASE DEFAULT BREAK CONTINUE RETURN VAR INT_TYPE BOOL_TYPE STRING_TYPE IMPORT FUNCTION APPEND LEN PRINT PRINTLN
%token PACKAGE CHAN CONST DEFER FALLTHROUGH GO GOTO INTERFACE MAP RANGE SELECT STRUCT TYPE LPAREN RPAREN LBRACE RBRACE LSQPAREN RSQPAREN SEMICOLON
%token COMMA COLON BOOLEAN IDENTIFIER INTEGER STRING FLOAT COMMENT MULTI_LINE_COMMENT

%define parse.error verbose
%%


program: PackageClause ImportDecls function_declaration
;

PackageClause: PACKAGE PackageName
;

PackageName: IDENTIFIER
;

ImportDecls: ImportDecls ImportDecl
|
;

ImportDecl: IMPORT ImportSpecs
| IMPORT LPAREN ImportSpecs RPAREN
;

ImportSpecs: ImportSpecs ImportSpec
| 
;


ImportSpec: '.' ImportPath 
| PackageName ImportPath 
| ImportPath
;

ImportPath: STRING
;
/*------*/

var_declarations : VAR declaration                 
// | VAR LPAREN declaration_list  RPAREN    
;

// declaration_list : 				                   
// | declaration declaration_list 
// ;

declaration : identifier_list                                   
// | identifier_list LPAREN IDENTIFIER  RPAREN                           
// | identifier_list bracket_list IDENTIFIER                      
| identifier_list ASSIGN expression_list                           
| IDENTIFIER INT_TYPE ASSIGN expression_list
| IDENTIFIER INT_TYPE
| IDENTIFIER STRING_TYPE ASSIGN expression_list
| IDENTIFIER STRING_TYPE        
// | identifier_list LPAREN IDENTIFIER  RPAREN ASSIGN expression_list      
// | identifier_list bracket_list IDENTIFIER ASSIGN expression_list  
// | identifier_list STRUCT LBRACE declaration_list RBRACE 		
// | identifier_list bracket_list STRUCT LBRACE declaration_list RBRACE	

identifier_list : IDENTIFIER          
|  IDENTIFIER COMMA identifier_list
;

// type_declarations : TYPE type_declaration               
// | TYPE LPAREN type_declaration_list  RPAREN  
;

// type_declaration : IDENTIFIER IDENTIFIER                                      
// 		 | IDENTIFIER LPAREN IDENTIFIER  RPAREN                             
// 		 | IDENTIFIER STRUCT LBRACE declaration_list RBRACE                 
// 		 | IDENTIFIER bracket_list IDENTIFIER		                
// 		 | IDENTIFIER bracket_list STRUCT LBRACE declaration_list RBRACE    
// 		 ;

// type_declaration_list : 					                        
//                       | type_declaration type_declaration_list 
                      ;

function_declaration : FUNCTION IDENTIFIER signature block_stmt   
                     ;

signature : LPAREN parameters RPAREN //result
          | LPAREN RPAREN //result
	      ;

// result : 				
//        | IDENTIFIER                   
//        | bracket_list IDENTIFIER      
//        | STRUCT LBRACE declaration_list RBRACE 
//        | bracket_list STRUCT LBRACE declaration_list RBRACE 
//        ;

parameters : parameter_unit			          
	       | parameter_unit COMMA parameters    
	       ;

parameter_unit : identifier_list IDENTIFIER  
               | identifier_list LPAREN IDENTIFIER  RPAREN      
               | identifier_list bracket_list IDENTIFIER
               ;

bracket : '[' INTEGER ']'   
        | '[' ']'               
        ;

bracket_list : bracket               
             | bracket bracket_list  
             ;

/* changing from here */

expression_list : expression                        
                | expression COMMA expression_list
                ;

expression : primary_expression                   
           | binary_op              
           | builtin                
           ;

primary_expression : IDENTIFIER                                
                   | literal                                    
                   | LPAREN expression  RPAREN                         
                   | primary_expression LPAREN expression_list  RPAREN 
                   | primary_expression LPAREN  RPAREN                 
                   | primary_expression '.' IDENTIFIER         
                   | primary_expression '[' expression ']'      
                   ;

literal : INTEGER                           
        | STRING                             
        | FLOAT                              
        | BOOLEAN                       
        ;

binary_op : expression LOGICAL_OR expression           
         | expression LOGICAL_AND expression           
         | expression EQUAL_EQUAL expression         
         | expression NOT_EQUAL expression      
         | expression LESS_THAN_OR_EQUAL expression      
         | expression GREATER_THAN_OR_EQUAL expression      
         | expression LESS_THAN expression            
         | expression GREATER_THAN expression            
         | expression PLUS expression            
         | expression MINUS expression            
         | expression BITWISE_OR expression            
         | expression BITWISE_XOR expression            
         | expression TIMES expression            
         | expression DIVIDE expression            
         | expression MODULO expression            
         | expression RIGHT_SHIFT expression    
         | expression LEFT_SHIFT expression     
         | expression BITWISE_AND expression            
         | expression BIT_CLEAR expression      
         ;

builtin : APPEND LPAREN expression COMMA expression  RPAREN     
        | LEN LPAREN expression  RPAREN                       
        ;

statement : declaration_stmt statement	       
          | simple_stmt	statement			
          | return_stmt statement	
          | break_stmt statement				
          | continue_stmt statement			
          | block_stmt statement			
          | if_stmt	statement		
        //   | switch_stmt statement		
          | for_stmt statement				
          | print_stmt statement			
          | println_stmt statement
          | COMMENT statement
          |
          ;

declaration_stmt : var_declarations
                //  | type_declarations
                 ;

simple_stmt :
            // | expression_stmt
            | inc_dec_stmt
            | assignment
            | short_variable_declaration
            ;

// expression_stmt : expression	/* weed to make sure its a function call */ { $$ = new_Expr_Simple_Statement($1, @1.first_line); }	
                // ;

inc_dec_stmt : expression INCREMENT
             | expression DECREMENT
             ;

/* https://golang.org/ref/spec#Operands
 The blank identifier may appear as an operand only on the left-hand side of an assignment. */ 
assignment : expression_list ASSIGN expression_list
           | expression assign_op expression
           ;

assign_op : add_op_eq				
          | mul_op_eq				
          ;

add_op_eq : ADD_ASSIGN
          | SUB_ASSIGN
          | OR_ASSIGN
          | XOR_ASSIGN
          ;

mul_op_eq : MUL_ASSIGN
          | DIV_ASSIGN
          | MOD_ASSIGN
          | LEFT_SHIFT_ASSIGN
          | RIGHT_SHIFT_ASSIGN
          | AND_ASSIGN
          | CLEAR_ASSIGN
          ;

short_variable_declaration : expression_list SHORT_VAR expression_list
                           ;

return_stmt : RETURN
            | RETURN expression
            ;

break_stmt : BREAK
           ;

continue_stmt : CONTINUE
              ;

block_stmt : LBRACE statement RBRACE
           | LBRACE RBRACE
           ; 

// statement_list : statement 
//                | statement statement_list
//                ;

if_stmt : IF expression block_stmt
        | IF simple_stmt expression block_stmt
	    | IF simple_stmt expression block_stmt ELSE if_stmt
	    | IF simple_stmt expression block_stmt ELSE block_stmt
        | IF expression block_stmt ELSE if_stmt
        | IF expression block_stmt ELSE block_stmt
        ;

// switch_stmt : expression_switch_stmt
            ;               

// expression_switch_stmt : SWITCH switch_on LBRACE expression_case_clause_list RBRACE
//                        ;

// switch_on : /* empty */
//           | simple_stmt expression
//           | simple_stmt
//           | expression
//           ;

// expression_case_clause : CASE expression_list  ':' statement
//                        | CASE expression_list  ':'
//                        | DEFAULT ':' statement
//                        | DEFAULT ':'
// 	               | DEFAULT
// 	               ;

/* weed to check maximum 1 default in a switch statement */

// expression_case_clause_list : /* empty */
//                             | expression_case_clause_list expression_case_clause
//                             ;

for_stmt : FOR block_stmt
         | FOR expression block_stmt
         | FOR for_clause block_stmt
         ;

for_clause : simple_stmt SEMICOLON simple_stmt
           | simple_stmt SEMICOLON expression SEMICOLON simple_stmt
           ;

print_stmt : PRINT LPAREN expression_list  RPAREN
           | PRINT LPAREN  RPAREN

println_stmt : PRINTLN LPAREN expression_list  RPAREN
             | PRINTLN LPAREN  RPAREN


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
