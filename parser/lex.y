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
    struct node* mknode(struct node *left, struct node *right, char *token);
    void printBT(struct node*);

    // int success = 1;
    struct node *head;
    struct node { 
        struct node *left; 
        struct node *right; 
        char *token; 
    };
%}

%union { 
	struct var_name { 
		char name[100]; 
		struct node* nd;
	} nd_obj; 
}

%token <nd_obj> PLUS MINUS TIMES DIVIDE ASSIGN MODULO BITWISE_AND BITWISE_OR BITWISE_XOR BIT_CLEAR LEFT_SHIFT RIGHT_SHIFT ADD_ASSIGN SUB_ASSIGN MUL_ASSIGN 
%token <nd_obj> DIV_ASSIGN MOD_ASSIGN AND_ASSIGN OR_ASSIGN XOR_ASSIGN LEFT_SHIFT_ASSIGN RIGHT_SHIFT_ASSIGN INCREMENT DECREMENT RECEIVE CLEAR_ASSIGN 
%token <nd_obj> SHORT_VAR VARIADIC_PARAM SELECTOR EQUAL_EQUAL NOT_EQUAL LESS_THAN LESS_THAN_OR_EQUAL GREATER_THAN GREATER_THAN_OR_EQUAL LOGICAL_AND 
%token <nd_obj> LOGICAL_OR LOGICAL_NOT IF ELSE WHILE FOR SWITCH CASE DEFAULT BREAK CONTINUE RETURN VAR INT_TYPE BOOL_TYPE STRING_TYPE IMPORT FUNCTION APPEND LEN PRINT PRINTLN
%token <nd_obj> PACKAGE CHAN CONST DEFER FALLTHROUGH GO GOTO INTERFACE MAP RANGE SELECT STRUCT TYPE LPAREN RPAREN LBRACE RBRACE LSQPAREN RSQPAREN SEMICOLON
%token <nd_obj> COMMA COLON BOOLEAN IDENTIFIER INTEGER STRING FLOAT COMMENT MULTI_LINE_COMMENT

%type <nd_obj> program PackageClause ImportDecls ImportDecl var_declarations declaration identifier_list function_declaration signature parameters expression_list expression primary_expression type literal
%type <nd_obj> binary_op statement simple_stmt inc_dec_stmt

%define parse.error verbose
%%


program: PackageClause ImportDecls function_declaration
;

PackageClause: PACKAGE IDENTIFIER
;

// PackageName: IDENTIFIER
// ;

ImportDecls: ImportDecl ImportDecls
| 
;

ImportDecl: IMPORT STRING
// | IMPORT LPAREN ImportSpecs RPAREN
;

// ImportSpecs: ImportSpecs STRING
// | 
// ;


// ImportSpec: '.' STRING 
// | IDENTIFIER STRING 
// | STRING
// ;

// ImportPath: STRING
// ;
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
| IDENTIFIER ASSIGN expression_list
// | IDENTIFIER type
// | IDENTIFIER STRING_TYPE ASSIGN expression_list
// | IDENTIFIER STRING_TYPE        
// | identifier_list LPAREN IDENTIFIER  RPAREN ASSIGN expression_list      
// | identifier_list bracket_list IDENTIFIER ASSIGN expression_list  
// | identifier_list STRUCT LBRACE declaration_list RBRACE 		
// | identifier_list bracket_list STRUCT LBRACE declaration_list RBRACE	

identifier_list : IDENTIFIER type
// | IDENTIFIER    
| IDENTIFIER type COMMA identifier_list

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

parameters : identifier_list			          
	    //    | parameter_unit COMMA parameters    
	       ;

// parameter_unit : identifier_list IDENTIFIER  
//                | identifier_list LPAREN IDENTIFIER  RPAREN      
//                | identifier_list bracket_list IDENTIFIER
               ;

// bracket : '[' INTEGER ']'   
//         | '[' ']'               
//         ;

// bracket_list : bracket               
//              | bracket bracket_list  
//              ;

/* changing from here */

expression_list : expression                        
                | expression COMMA expression_list
                ;

expression : primary_expression                   
           | binary_op                            
           ;

primary_expression : IDENTIFIER
                   | literal
                   | LPAREN expression  RPAREN
                   | primary_expression LPAREN expression_list  RPAREN 
                //    | primary_expression LPAREN  RPAREN                 
                //    | primary_expression '.' IDENTIFIER         
                //    | primary_expression '[' expression ']'      
                   ;

type : INT_TYPE
     | STRING_TYPE
     | BOOL_TYPE

literal : INTEGER                           
        | STRING                             
        | FLOAT                              
        | BOOLEAN                       
        ;

binary_op : primary_expression LOGICAL_OR primary_expression           
         | primary_expression LOGICAL_AND primary_expression           
         | primary_expression EQUAL_EQUAL primary_expression         
         | primary_expression NOT_EQUAL primary_expression      
         | primary_expression LESS_THAN_OR_EQUAL primary_expression      
         | primary_expression GREATER_THAN_OR_EQUAL primary_expression      
         | primary_expression LESS_THAN primary_expression            
         | primary_expression GREATER_THAN primary_expression            
         | primary_expression PLUS primary_expression            
         | primary_expression MINUS primary_expression            
         | primary_expression BITWISE_OR primary_expression            
         | primary_expression BITWISE_XOR primary_expression            
         | primary_expression TIMES primary_expression            
         | primary_expression DIVIDE primary_expression            
         | primary_expression MODULO primary_expression            
         | primary_expression RIGHT_SHIFT primary_expression    
         | primary_expression LEFT_SHIFT primary_expression     
         | primary_expression BITWISE_AND primary_expression            
         | primary_expression BIT_CLEAR primary_expression      
         ;


statement : var_declarations statement	       
          | simple_stmt statement			
          | return_stmt statement	
          | BREAK statement				
          | CONTINUE statement			
          | block_stmt statement			
          | if_stmt	statement
        //   | switch_stmt statement		
          | for_stmt statement						
          | println_stmt statement
          | COMMENT statement
          |
          ;

// declaration_stmt : var_declarations
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

inc_dec_stmt : IDENTIFIER INCREMENT
             | IDENTIFIER DECREMENT
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
            | RETURN primary_expression
            ;

block_stmt : LBRACE statement RBRACE
           | LBRACE RBRACE
           ; 

// statement_list : statement 
//                | statement statement_list
//                ;

boolean_op: primary_expression LOGICAL_OR primary_expression           
         | primary_expression LOGICAL_AND primary_expression           
         | primary_expression EQUAL_EQUAL primary_expression         
         | primary_expression NOT_EQUAL primary_expression      
         | primary_expression LESS_THAN_OR_EQUAL primary_expression      
         | primary_expression GREATER_THAN_OR_EQUAL primary_expression      
         | primary_expression LESS_THAN primary_expression            
         | primary_expression GREATER_THAN primary_expression      

if_stmt : IF boolean_op block_stmt
        // | IF simple_stmt expression block_stmt
	    // | IF simple_stmt expression block_stmt ELSE if_stmt
	    // | IF simple_stmt expression block_stmt ELSE block_stmt
        | IF boolean_op block_stmt ELSE if_stmt
        | IF boolean_op block_stmt ELSE block_stmt
        ;


for_stmt : FOR for_clause block_stmt
        //  | FOR expression block_stmt
        //  | FOR block_stmt
         ;

for_clause : simple_stmt SEMICOLON boolean_op SEMICOLON simple_stmt
        //    | simple_stmt SEMICOLON simple_stmt
           ;

println_stmt : PRINTLN LPAREN expression_list  RPAREN
             | PRINTLN LPAREN  RPAREN

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
