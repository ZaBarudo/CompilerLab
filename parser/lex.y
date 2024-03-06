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

%type <nd_obj> program PackageClause var_declarations declaration function_declaration expression type literal
%type <nd_obj> binary_op statement simple_stmt inc_dec_stmt assignment assign_op add_op_eq mul_op_eq return_stmt block_stmt 
%type <nd_obj> boolean_exp if_stmt for_stmt for_clause println_stmt term

%define parse.error verbose
%%


program: PackageClause function_declaration
;

PackageClause: PACKAGE IDENTIFIER
;

// PackageName: IDENTIFIER
// ;

// ImportDecls: ImportDecl ImportDecls
// |
// ;

// ImportDecl: IMPORT STRING
// | IMPORT LPAREN ImportSpecs RPAREN
// ;

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

declaration : IDENTIFIER type                                   
// | identifier_list LPAREN IDENTIFIER  RPAREN                           
// | identifier_list bracket_list IDENTIFIER                      
| IDENTIFIER type ASSIGN expression                           
| IDENTIFIER ASSIGN expression
// | IDENTIFIER type
// | IDENTIFIER STRING_TYPE ASSIGN expression_list
// | IDENTIFIER STRING_TYPE        
// | identifier_list LPAREN IDENTIFIER  RPAREN ASSIGN expression_list      
// | identifier_list bracket_list IDENTIFIER ASSIGN expression_list  
// | identifier_list STRUCT LBRACE declaration_list RBRACE 		
// | identifier_list bracket_list STRUCT LBRACE declaration_list RBRACE	

// identifier_list : IDENTIFIER type
// | IDENTIFIER    
// | IDENTIFIER type COMMA identifier_list

// ;

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

function_declaration : FUNCTION IDENTIFIER LPAREN RPAREN block_stmt   
                     ;

// signature : LPAREN parameters RPAREN //result
//           | LPAREN RPAREN //result
// 	      ;

// result : 				
//        | IDENTIFIER                   
//        | bracket_list IDENTIFIER      
//        | STRUCT LBRACE declaration_list RBRACE 
//        | bracket_list STRUCT LBRACE declaration_list RBRACE 
//        ;

// parameters : identifier_list			          
// 	    //    | parameter_unit COMMA parameters    
// 	       ;

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

thing : IDENTIFIER
      | literal
      ;

term: IDENTIFIER
    | literal
    | LPAREN expression RPAREN
    ;

expression : term               
           | binary_op                         
           ;

// primary_expression : IDENTIFIER
//                    | literal
//                    | LPAREN expression  RPAREN
//                    | primary_expression LPAREN expression  RPAREN

                //    | primary_expression LPAREN  RPAREN                 
                //    | primary_expression '.' IDENTIFIER         
                //    | primary_expression '[' expression ']'      
                   ;



binary_op : expression LOGICAL_OR term           
         | expression LOGICAL_AND term           
         | expression EQUAL_EQUAL term         
         | expression NOT_EQUAL term      
         | expression LESS_THAN_OR_EQUAL term      
         | expression GREATER_THAN_OR_EQUAL term      
         | expression LESS_THAN term            
         | expression GREATER_THAN term            
         | expression PLUS term            
         | expression MINUS term            
         | expression BITWISE_OR term            
         | expression BITWISE_XOR term            
         | expression TIMES term            
         | expression DIVIDE term            
         | expression MODULO term            
         | expression RIGHT_SHIFT term    
         | expression LEFT_SHIFT term     
         | expression BITWISE_AND term            
         | expression BIT_CLEAR term      
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
            // | short_variable_declaration
            ;

// expression_stmt : expression	/* weed to make sure its a function call */ { $$ = new_Expr_Simple_Statement($1, @1.first_line); }	
                // ;

inc_dec_stmt : IDENTIFIER INCREMENT
             | IDENTIFIER DECREMENT
             ;

/* https://golang.org/ref/spec#Operands
 The blank identifier may appear as an operand only on the left-hand side of an assignment. */ 
assignment : IDENTIFIER ASSIGN expression
           | IDENTIFIER assign_op expression
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

// short_variable_declaration : expression SHORT_VAR expression
//                            ;

return_stmt : RETURN
            | RETURN thing
            ;

block_stmt : LBRACE statement RBRACE
        //    | LBRACE RBRACE
           ; 

// statement_list : statement 
//                | statement statement_list
//                ;

boolean_exp: term LOGICAL_OR term           
         | term LOGICAL_AND term           
         | term EQUAL_EQUAL term         
         | term NOT_EQUAL term      
         | term LESS_THAN_OR_EQUAL term      
         | term GREATER_THAN_OR_EQUAL term      
         | term LESS_THAN term            
         | term GREATER_THAN term
        ;       

if_stmt : IF boolean_exp block_stmt
        // | IF simple_stmt term block_stmt
	    // | IF simple_stmt expression block_stmt ELSE if_stmt
	    // | IF simple_stmt expression block_stmt ELSE block_stmt
        | IF boolean_exp block_stmt ELSE if_stmt
        | IF boolean_exp block_stmt ELSE block_stmt
        ;


for_stmt : FOR for_clause block_stmt
        //  | FOR expression block_stmt
        //  | FOR block_stmt
         ;

for_clause : assignment SEMICOLON boolean_exp SEMICOLON simple_stmt
        //    | simple_stmt SEMICOLON simple_stmt
           ;

println_stmt : PRINTLN LPAREN IDENTIFIER RPAREN
             | PRINTLN LPAREN STRING RPAREN

type : INT_TYPE
     | STRING_TYPE
     | BOOL_TYPE

literal : INTEGER                           
        | STRING                             
        | FLOAT                              
        | BOOLEAN                       
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

void printBTHelper(char* prefix, struct node* ptr, int isLeft) {
    if( ptr != NULL ) {
        printf("%s",prefix);
        if(isLeft) { printf("├──"); } 
		else { printf("└──"); }
        printf("%s",ptr->token);
		printf("\n");
		char* addon = isLeft ? "│   " : "    ";
    	int len2 = strlen(addon);
    	int len1 = strlen(prefix);
    	char* result = (char*)malloc(len1 + len2 + 1);
    	strcpy(result, prefix);
    	strcpy(result + len1, addon);
		printBTHelper(result, ptr->left, 1);
		printBTHelper(result, ptr->right, 0);
    	free(result);
    }
}

void printBT(struct node* ptr) {
	printf("\n");
    printBTHelper("", ptr, 0);    
}

struct node* mknode(struct node *left, struct node *right, char *token) {	
	struct node *newnode = (struct node *)malloc(sizeof(struct node));
	char *newstr = (char *)malloc(strlen(token)+1);
	strcpy(newstr, token);
	newnode->left = left;
	newnode->right = right;
	newnode->token = newstr;
	return(newnode);
}
