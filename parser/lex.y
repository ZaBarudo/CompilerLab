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

%type <nd_obj> program PackageClause declaration function_declaration expression type literal
%type <nd_obj> binary_op statement simple_stmt inc_dec_stmt assignment assign_op add_op_eq mul_op_eq return_stmt block_stmt 
%type <nd_obj> boolean_exp if_stmt for_stmt for_clause println_stmt term thing return_ 

%define parse.error verbose
%%


program: PackageClause function_declaration { $$.nd = mknode($1.nd, $2.nd, "program"); head = $$.nd; } 
;

PackageClause: PACKAGE IDENTIFIER {$1.nd = mknode(NULL, NULL, $1.name); $2.nd = mknode(NULL, NULL, $2.name); $$.nd = mknode($1.nd, $2.nd, "package");}
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

// var_declarations : VAR declaration { $$.nd = $2.nd; }           
// | VAR LPAREN declaration_list  RPAREN    
;

// declaration_list : 				                   
// | declaration declaration_list 
// ;

declaration : VAR IDENTIFIER type { $2.nd = mknode(NULL, NULL, $2.name); $$.nd = mknode($2.nd, $3.nd, "variable");}                             
// | identifier_list LPAREN IDENTIFIER  RPAREN                           
// | identifier_list bracket_list IDENTIFIER                      
| VAR IDENTIFIER type ASSIGN expression { $2.nd = mknode(NULL, NULL, $2.name);  struct node* variable = mknode($2.nd, $3.nd, "variable");$$.nd = mknode(variable, $5.nd, "="); }  
| VAR IDENTIFIER ASSIGN expression { $2.nd = mknode(NULL, NULL, $2.name); $$.nd = mknode($2.nd, $4.nd, "="); }  
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
                    //   ;

function_declaration : FUNCTION IDENTIFIER LPAREN RPAREN block_stmt { $2.nd = mknode(NULL, NULL, $2.name); $$.nd = mknode($2.nd, $5.nd, "function"); }
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
//               ;

// bracket : '[' INTEGER ']'   
//         | '[' ']'               
//         ;

// bracket_list : bracket               
//              | bracket bracket_list  
//              ;

thing : IDENTIFIER {$$.nd = mknode(NULL, NULL, $1.name);}
      | literal {$$.nd = $1.nd;}
      ;

term: IDENTIFIER {$$.nd = mknode(NULL, NULL, $1.name);}
    | literal {$$.nd = $1.nd;}
    | LPAREN expression RPAREN {$$.nd = $2.nd;}
    ;

expression : term {$$.nd = $1.nd;}     
           | binary_op {$$.nd = $1.nd;}       
           ;

// primary_expression : IDENTIFIER
//                    | literal
//                    | LPAREN expression  RPAREN
//                    | primary_expression LPAREN expression  RPAREN

                //    | primary_expression LPAREN  RPAREN                 
                //    | primary_expression '.' IDENTIFIER         
                //    | primary_expression '[' expression ']'      
                   ;



binary_op : expression LOGICAL_OR term { $$.nd = mknode($1.nd, $3.nd, $2.name); }         
         | expression LOGICAL_AND term { $$.nd = mknode($1.nd, $3.nd, $2.name); }              
         | expression EQUAL_EQUAL term { $$.nd = mknode($1.nd, $3.nd, $2.name); }            
         | expression NOT_EQUAL term { $$.nd = mknode($1.nd, $3.nd, $2.name); }         
         | expression LESS_THAN_OR_EQUAL term { $$.nd = mknode($1.nd, $3.nd, $2.name); }         
         | expression GREATER_THAN_OR_EQUAL term { $$.nd = mknode($1.nd, $3.nd, $2.name); }         
         | expression LESS_THAN term { $$.nd = mknode($1.nd, $3.nd, $2.name); }               
         | expression GREATER_THAN term { $$.nd = mknode($1.nd, $3.nd, $2.name); }               
         | expression PLUS term { $$.nd = mknode($1.nd, $3.nd, $2.name); }               
         | expression MINUS term { $$.nd = mknode($1.nd, $3.nd, $2.name); }               
         | expression BITWISE_OR term { $$.nd = mknode($1.nd, $3.nd, $2.name); }               
         | expression BITWISE_XOR term { $$.nd = mknode($1.nd, $3.nd, $2.name); }               
         | expression TIMES term { $$.nd = mknode($1.nd, $3.nd, $2.name); }               
         | expression DIVIDE term { $$.nd = mknode($1.nd, $3.nd, $2.name); }               
         | expression MODULO term { $$.nd = mknode($1.nd, $3.nd, $2.name); }               
         | expression RIGHT_SHIFT term { $$.nd = mknode($1.nd, $3.nd, $2.name); }       
         | expression LEFT_SHIFT term { $$.nd = mknode($1.nd, $3.nd, $2.name); }        
         | expression BITWISE_AND term { $$.nd = mknode($1.nd, $3.nd, $2.name); }               
         | expression BIT_CLEAR term { $$.nd = mknode($1.nd, $3.nd, $2.name); }         
         ;


statement : declaration statement { $$.nd = mknode($1.nd, $2.nd, "statement") ;}   
          | simple_stmt statement { $$.nd = mknode($1.nd, $2.nd, "statement") ;}  			
          | return_stmt { $$.nd = mknode($1.nd, NULL, "statement") ;}  
          | BREAK statement { $$.nd = mknode(NULL, NULL, $1.name); $$.nd = mknode($1.nd, $2.nd, "statement") ;}  				
          | CONTINUE statement { $$.nd = mknode(NULL, NULL, $1.name); $$.nd = mknode($1.nd, $2.nd, "statement") ;}  			
          | block_stmt statement { $$.nd = mknode($1.nd, $2.nd, "statement") ;}  			
          | if_stmt	statement { $$.nd = mknode($1.nd, $2.nd, "statement") ;}  
        //   | switch_stmt statement { $$.nd = mknode($1.nd, $2.nd, "statement") ;}  		
          | for_stmt statement { $$.nd = mknode($1.nd, $2.nd, "statement") ;}  						
          | println_stmt statement { $$.nd = mknode($1.nd, $2.nd, "statement") ;}  
          | COMMENT statement { $$.nd = mknode(NULL, $2.nd, "COMMENT") ;}  
          | { $$.nd = NULL ;}  
          ;

// declaration_stmt : var_declarations
                //  | type_declarations
                 ;

simple_stmt :
            // | expression_stmt
              inc_dec_stmt { $$.nd = $1.nd; }
            | assignment { $$.nd = $1.nd; }
            // | short_variable_declaration
            ;

// expression_stmt : expression	/* weed to make sure its a function call */ { $$ = new_Expr_Simple_Statement($1, @1.first_line); }	
                // ;

inc_dec_stmt : IDENTIFIER INCREMENT { $1.nd = mknode(NULL, NULL, $1.name); $$.nd = mknode($1.nd, NULL, "INCREMENT"); }
             | IDENTIFIER DECREMENT { $1.nd = mknode(NULL, NULL, $1.name); $$.nd = mknode($1.nd, NULL, "DECREMENT"); }
             ;

/* https://golang.org/ref/spec#Operands
 The blank identifier may appear as an operand only on the left-hand side of an assignment. */ 
assignment : IDENTIFIER ASSIGN expression { $1.nd = mknode(NULL, NULL, $1.name); $$.nd = mknode($1.nd, $3.nd, "="); }
           | IDENTIFIER assign_op expression { $1.nd = mknode(NULL, NULL, $1.name); $$.nd = mknode($1.nd, $3.nd, $2.name); }
           ;

assign_op : add_op_eq {$$.nd = $1.nd;}
          | mul_op_eq {$$.nd = $1.nd;}			
          ;

add_op_eq : ADD_ASSIGN {$$.nd = mknode(NULL, NULL, $1.name);}
          | SUB_ASSIGN {$$.nd = mknode(NULL, NULL, $1.name);}
          | OR_ASSIGN {$$.nd = mknode(NULL, NULL, $1.name);}
          | XOR_ASSIGN {$$.nd = mknode(NULL, NULL, $1.name);}
          ;

mul_op_eq : MUL_ASSIGN {$$.nd = mknode(NULL, NULL, $1.name);}
          | DIV_ASSIGN {$$.nd = mknode(NULL, NULL, $1.name);}
          | MOD_ASSIGN {$$.nd = mknode(NULL, NULL, $1.name);}
          | LEFT_SHIFT_ASSIGN {$$.nd = mknode(NULL, NULL, $1.name);}
          | RIGHT_SHIFT_ASSIGN {$$.nd = mknode(NULL, NULL, $1.name);}
          | AND_ASSIGN {$$.nd = mknode(NULL, NULL, $1.name);}
          | CLEAR_ASSIGN {$$.nd = mknode(NULL, NULL, $1.name);}
          ;

// short_variable_declaration : expression SHORT_VAR expression
//                            ;

return_stmt : RETURN return_ { $1.nd = mknode(NULL, NULL, "return"); $$.nd = mknode($1.nd, $2.nd, "RETURN"); }
            ;
return_ : thing { $$.nd = $1.nd; }
        | { $$.nd = NULL ;}

block_stmt : LBRACE statement RBRACE { $$.nd = $2.nd; }
           ; 

// statement_list : statement 
//                | statement statement_list
//                ;

boolean_exp: term LOGICAL_OR term { $$.nd = mknode($1.nd, $3.nd, $2.name); }     
         | term LOGICAL_AND term { $$.nd = mknode($1.nd, $3.nd, $2.name); }        
         | term EQUAL_EQUAL term { $$.nd = mknode($1.nd, $3.nd, $2.name); }      
         | term NOT_EQUAL term { $$.nd = mknode($1.nd, $3.nd, $2.name); }   
         | term LESS_THAN_OR_EQUAL term { $$.nd = mknode($1.nd, $3.nd, $2.name); }   
         | term GREATER_THAN_OR_EQUAL term { $$.nd = mknode($1.nd, $3.nd, $2.name); }   
         | term LESS_THAN term { $$.nd = mknode($1.nd, $3.nd, $2.name); }         
         | term GREATER_THAN term  { $$.nd = mknode($1.nd, $3.nd, $2.name); }
        ;       

if_stmt : IF boolean_exp block_stmt  { $$.nd = mknode($2.nd, $3.nd, "IF"); }
        // | IF simple_stmt term block_stmt
	    // | IF simple_stmt expression block_stmt ELSE if_stmt
	    // | IF simple_stmt expression block_stmt ELSE block_stmt
        | IF boolean_exp block_stmt ELSE if_stmt  { struct node* cond_if = mknode($2.nd, $3.nd, "IF-PART"); $$.nd = mknode(cond_if, $5.nd, "IF-ELSE-IF"); }
        | IF boolean_exp block_stmt ELSE block_stmt  { struct node* cond_if = mknode($2.nd, $3.nd, "IF-PART");  $$.nd = mknode(cond_if, $5.nd, "IF-ELSE"); }
        ;


// switch_stmt : SWITCH simple_stmt '{' switch_cases '}' { $$.nd = mknode($2.nd, $4.nd, "SWITCH"); }
//             ;

// switch_cases : switch_case
//             | switch_cases switch_case { $$.nd = mknode($1.nd, $2.nd, "SWITCH-CASES"); }
//             ;

// switch_case : CASE expression_list ':' statement_list { $$.nd = mknode($2.nd, $4.nd, "CASE"); }
//            | DEFAULT ':' statement_list { $$.nd = mknode(NULL, $3.nd, "DEFAULT"); }
//            ;

// expression_list : expression
//                | expression_list ',' expression { $$.nd = mknode($1.nd, $3.nd, "EXPR-LIST"); }
//                ;

// statement_list : statement
//               | statement_list statement { $$.nd = mknode($1.nd, $2.nd, "STMT-LIST"); }
//               ;


for_stmt : FOR for_clause block_stmt  { $$.nd = mknode($2.nd, $3.nd, "FOR"); }
        //  | FOR expression block_stmt
        //  | FOR block_stmt
         ;

for_clause : assignment SEMICOLON boolean_exp SEMICOLON simple_stmt  {struct node* ass_bool = mknode($1.nd, $3.nd, "ass-bool");  $$.nd = mknode(ass_bool, $5.nd, "FOR-CLAUSE"); }
        //    | simple_stmt SEMICOLON simple_stmt
           ;

println_stmt : PRINTLN LPAREN IDENTIFIER RPAREN { $1.nd = mknode(NULL, NULL, "println"); $3.nd = mknode(NULL, NULL, $3.name); $$.nd = mknode($1.nd, $3.nd, "PRINTLN"); }
             | PRINTLN LPAREN STRING RPAREN { $1.nd = mknode(NULL, NULL, "println"); $3.nd = mknode(NULL, NULL, $3.name);$$.nd = mknode($1.nd, $3.nd, "PRINTLN"); }

type : INT_TYPE {$$.nd = mknode(NULL, NULL, $1.name);}  
     | STRING_TYPE {$$.nd = mknode(NULL, NULL, $1.name);}  
     | BOOL_TYPE {$$.nd = mknode(NULL, NULL, $1.name);}  

literal : INTEGER {$$.nd = mknode(NULL, NULL, $1.name);}                        
        | STRING {$$.nd = mknode(NULL, NULL, $1.name);}                      
        | FLOAT {$$.nd = mknode(NULL, NULL, $1.name);}                        
        | BOOLEAN {$$.nd = mknode(NULL, NULL, $1.name);}                   
        ;
%%

int main() {
    extern FILE *yyin, *yyout;
   
    yyparse();
    if(success)
        printf("Parsing Successful\n");
    printf("\n\n");
    printf("PARSE TREE");
    printf("\n\n");
	printBT(head);
    printf("\n\n");
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
