%{
    #include<stdio.h>
    #include<string.h>
    #include<stdlib.h>
    #include<ctype.h>
    #include"lex.yy.c"
    int yyerror(const char *s);
    int yylex();
    int yywrap();
    struct node* cond_if;
    struct node* idnode;
    char *s;
    char * r;
    int lno;
    //char idname[100];
    

    void add(char);
    void insert_type();
    int search(char *);
    void insert_type();
    void check_declaration(char *);
    int success = 1;
    struct node* mknode(struct node *left, struct node *right, char *token);
    void printBT(struct node*);

    struct dataType {
        char * id_name;
        char * data_type;
        char * type;
        int line_no;
    } symbol_table[40];
    int count=0;
    int q;
    char type_n [10];
    extern int countn;
    int sem_errors=0;
    char errors[10][100];
    
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
        char type[10];
	} nd_obj; 
    struct type_name {
        char name[100];
        struct node* nd;
        char type[10];
    } type_nd_obj;
}

%token <nd_obj> PLUS MINUS TIMES DIVIDE ASSIGN MODULO BITWISE_AND BITWISE_OR BITWISE_XOR BIT_CLEAR LEFT_SHIFT RIGHT_SHIFT ADD_ASSIGN SUB_ASSIGN MUL_ASSIGN 
%token <nd_obj> DIV_ASSIGN MOD_ASSIGN AND_ASSIGN OR_ASSIGN XOR_ASSIGN LEFT_SHIFT_ASSIGN RIGHT_SHIFT_ASSIGN INCREMENT DECREMENT RECEIVE CLEAR_ASSIGN 
%token <nd_obj> SHORT_VAR VARIADIC_PARAM SELECTOR EQUAL_EQUAL NOT_EQUAL LESS_THAN LESS_THAN_OR_EQUAL GREATER_THAN GREATER_THAN_OR_EQUAL LOGICAL_AND 
%token <nd_obj> LOGICAL_OR LOGICAL_NOT IF ELSE WHILE FOR SWITCH CASE DEFAULT BREAK CONTINUE RETURN VAR INT_TYPE BOOL_TYPE STRING_TYPE IMPORT FUNCTION APPEND LEN PRINT PRINTLN
%token <nd_obj> PACKAGE CHAN CONST DEFER FALLTHROUGH GO GOTO INTERFACE MAP RANGE SELECT STRUCT TYPE LPAREN RPAREN LBRACE RBRACE LSQPAREN RSQPAREN SEMICOLON
%token <nd_obj> COMMA COLON BOOLEAN IDENTIFIER INTEGER STRING FLOAT COMMENT MULTI_LINE_COMMENT

%type <nd_obj> program PackageClause declaration declaration1 function_declaration expression type literal
%type <nd_obj> binary_op statement simple_stmt inc_dec_stmt assignment assign_op add_op_eq mul_op_eq return_stmt block_stmt 
%type <nd_obj> boolean_exp if_stmt if_stmt1 for_stmt for_clause println_stmt term thing return_ 

%%


program: PackageClause function_declaration { $$.nd = mknode($1.nd, $2.nd, "program"); head = $$.nd; } 
;

PackageClause: PACKAGE { add('H'); } IDENTIFIER {$1.nd = mknode(NULL, NULL, $1.name); $3.nd = mknode(NULL, NULL, $3.name); $$.nd = mknode($1.nd, $3.nd, "package"); }
;

declaration : VAR { add('K'); } IDENTIFIER { r=strdup(yytext); lno = yylineno; } declaration1 { $3.nd = mknode(NULL, NULL, $3.name);  idnode = $3.nd; }
            ;

declaration1 : type { add('V'); $$.nd = mknode(idnode, $1.nd, "variable"); }                                                
| type ASSIGN expression { add('V'); idnode = mknode(NULL, NULL, "identifier");  struct node* variable = mknode(idnode, $1.nd, "variable");$$.nd = mknode(variable, idnode, "="); }  
| ASSIGN expression { add('V'); idnode = mknode(NULL, NULL, "identifier"); $$.nd = mknode(idnode, $2.nd, "="); }  
;
function_declaration : FUNCTION IDENTIFIER { add('F'); } LPAREN RPAREN block_stmt { $2.nd = mknode(NULL, NULL, $2.name); $$.nd = mknode($2.nd, $6.nd, "function"); }
                     ;

thing : IDENTIFIER { check_declaration($1.name); $$.nd = mknode(NULL, NULL, $1.name);}
      | literal {$$.nd = $1.nd;}
      ;

term: IDENTIFIER { check_declaration($1.name); $$.nd = mknode(NULL, NULL, $1.name);}
    | literal {$$.nd = $1.nd;}
    | LPAREN expression RPAREN {$$.nd = $2.nd;}
    ;

expression : term {$$.nd = $1.nd;}     
           | binary_op {$$.nd = $1.nd;}       
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
          | BREAK { add('K'); } statement { $$.nd = mknode(NULL, NULL, $1.name); $$.nd = mknode($1.nd, $3.nd, "statement") ;}  				
          | CONTINUE { add('K'); } statement { $$.nd = mknode(NULL, NULL, $1.name); $$.nd = mknode($1.nd, $3.nd, "statement") ;}  			
          | block_stmt statement { $$.nd = mknode($1.nd, $2.nd, "statement") ;}  			
          | if_stmt	statement { $$.nd = mknode($1.nd, $2.nd, "statement") ;}  		
          | for_stmt statement { $$.nd = mknode($1.nd, $2.nd, "statement") ;}  						
          | println_stmt statement { $$.nd = mknode($1.nd, $2.nd, "statement") ;}  
          | COMMENT statement { $$.nd = mknode(NULL, $2.nd, "COMMENT") ;}  
          | { $$.nd = NULL ;}  
          ;



simple_stmt :inc_dec_stmt { $$.nd = $1.nd; }
            | assignment { $$.nd = $1.nd; }
            ;



inc_dec_stmt : IDENTIFIER { check_declaration($1.name); } INCREMENT { $1.nd = mknode(NULL, NULL, $1.name); $$.nd = mknode($1.nd, NULL, "INCREMENT"); }
             | IDENTIFIER { check_declaration($1.name); } DECREMENT { $1.nd = mknode(NULL, NULL, $1.name); $$.nd = mknode($1.nd, NULL, "DECREMENT"); }
             ;

/* https://golang.org/ref/spec#Operands
 The blank identifier may appear as an operand only on the left-hand side of an assignment. */ 
assignment : IDENTIFIER { check_declaration($1.name); } ASSIGN expression { $1.nd = mknode(NULL, NULL, $1.name); $$.nd = mknode($1.nd, $3.nd, "="); }
           | IDENTIFIER { check_declaration($1.name); } assign_op expression { $1.nd = mknode(NULL, NULL, $1.name); $$.nd = mknode($1.nd, $3.nd, $1.name); }
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



return_stmt : RETURN { add('K'); } return_ { $1.nd = mknode(NULL, NULL, "return"); $$.nd = mknode($1.nd, $3.nd, "RETURN"); }
            ;
return_ : thing { $$.nd = $1.nd; }
        | { $$.nd = NULL ;}

block_stmt : LBRACE statement RBRACE { $$.nd = $2.nd; }
           ; 


boolean_exp: term LOGICAL_OR term { $$.nd = mknode($1.nd, $3.nd, $2.name); }     
         | term LOGICAL_AND term { $$.nd = mknode($1.nd, $3.nd, $2.name); }        
         | term EQUAL_EQUAL term { $$.nd = mknode($1.nd, $3.nd, $2.name); }      
         | term NOT_EQUAL term { $$.nd = mknode($1.nd, $3.nd, $2.name); }   
         | term LESS_THAN_OR_EQUAL term { $$.nd = mknode($1.nd, $3.nd, $2.name); }   
         | term GREATER_THAN_OR_EQUAL term { $$.nd = mknode($1.nd, $3.nd, $2.name); }   
         | term LESS_THAN term { $$.nd = mknode($1.nd, $3.nd, $2.name); }         
         | term GREATER_THAN term  { $$.nd = mknode($1.nd, $3.nd, $2.name); }
        ;       
if_stmt: IF { add('K'); } boolean_exp block_stmt if_stmt1  { cond_if = mknode($3.nd,$4.nd,"IF-PART"); }
        ;
if_stmt1 : { $$.nd = cond_if; }
        | ELSE { add('K'); } if_stmt  { $$.nd = mknode(cond_if, $3.nd, "IF-ELSE-IF"); }
        | ELSE { add('K'); } block_stmt  { $$.nd = mknode(cond_if, $3.nd, "IF-ELSE"); }
        ;




for_stmt : FOR { add('K'); } for_clause block_stmt  { $$.nd = mknode($3.nd, $4.nd, "FOR"); }
            ;

for_clause : assignment SEMICOLON boolean_exp SEMICOLON simple_stmt  {struct node* ass_bool = mknode($1.nd, $3.nd, "ass-bool");  $$.nd = mknode(ass_bool, $5.nd, "FOR-CLAUSE"); }
           ;

println_stmt : PRINTLN LPAREN IDENTIFIER { check_declaration($1.name); } RPAREN { $1.nd = mknode(NULL, NULL, "println"); $3.nd = mknode(NULL, NULL, $3.name); $$.nd = mknode($1.nd, $3.nd, "PRINTLN"); }
             | PRINTLN LPAREN STRING RPAREN { $1.nd = mknode(NULL, NULL, "println"); $3.nd = mknode(NULL, NULL, $3.name);$$.nd = mknode($1.nd, $3.nd, "PRINTLN"); }

type : INT_TYPE { s = yytext; strcpy(type_n,s); $$.nd = mknode(NULL, NULL, $1.name); }  
     | STRING_TYPE { s = yytext; strcpy(type_n,s); $$.nd = mknode(NULL, NULL, $1.name); }  
     | BOOL_TYPE { s = yytext; strcpy(type_n,s); $$.nd = mknode(NULL, NULL, $1.name); }  

literal : INTEGER {add('C'); $$.nd = mknode(NULL, NULL, $1.name);}                        
        | STRING {add('C'); $$.nd = mknode(NULL, NULL, $1.name);}                      
        | FLOAT {add('C'); $$.nd = mknode(NULL, NULL, $1.name);}                        
        | BOOLEAN {add('C'); $$.nd = mknode(NULL, NULL, $1.name);}                   
        ;
%%

int main() {
    extern FILE *yyin, *yyout;
   
    yyparse();
    printf("\n\n \t\t\t\t\t\t PHASE 1: LEXICAL ANALYSIS \n\n");
	printf("\nSYMBOL   DATATYPE   TYPE   LINE NUMBER \n");
	printf("_______________________________________\n\n");
	int i=0;
	for(i=0; i<count; i++) {
		printf("%s\t%s\t%s\t%d\t\n", symbol_table[i].id_name, symbol_table[i].data_type, symbol_table[i].type, symbol_table[i].line_no);
	}
	for(i=0;i<count;i++){
		free(symbol_table[i].id_name);
		free(symbol_table[i].type);
	}
	printf("\n\n");
    if(success)
        printf("Parsing Successful\n");
    printf("\t\t\t\t\t\t\t\t PHASE 3: SEMANTIC ANALYSIS \n\n");
	if(sem_errors>0) {
		printf("Semantic analysis completed with %d errors\n", sem_errors);
		for(int i=0; i<sem_errors; i++){
			printf("\t - %s", errors[i]);
		}
	} else {
		printf("Semantic analysis completed with no errors");
	}
	printf("\n\n");
    return 0;
}

void check_declaration(char *c) {
    q = search(c);
    if(!q) {
        sprintf(errors[sem_errors], "Line %d: Variable \"%s\" not declared before usage!\n", countn+1, c);
		sem_errors++;
    }
}

int search(char *type_n) { 
    int i; 
    
    for(i=count-1; i>=0; i--) {
        if(strcmp(symbol_table[i].id_name, type_n)==0) {  
            
            return -1;
            break;  
        }
    } 
    return 0;
}

void add(char c) {
   
  if(c == 'V') {q=search(r);}
  else q=search(yytext);
  
  if(!q) {
    if(c == 'H') {
      symbol_table[count].id_name=strdup(yytext);        
      symbol_table[count].data_type=strdup(type_n);     
      symbol_table[count].line_no=yylineno;    
      symbol_table[count].type=strdup("Header");
      count++;  
    }  
    else if(c == 'K') {
      symbol_table[count].id_name=strdup(yytext);
      symbol_table[count].data_type=strdup("N/A");
      symbol_table[count].line_no=yylineno;
      symbol_table[count].type=strdup("Keyword\t");   
      count++;  
    }  else if(c == 'V') {
      
      symbol_table[count].id_name=strdup(r);
      symbol_table[count].data_type=strdup(type_n);
      symbol_table[count].line_no=lno;
      symbol_table[count].type=strdup("Variable");   
      count++;  
    }  else if(c == 'C') {
      symbol_table[count].id_name=strdup(yytext);
      symbol_table[count].data_type=strdup("CONST");
      symbol_table[count].line_no=yylineno;
      symbol_table[count].type=strdup("Constant");   
      count++;  
    }  else if(c == 'F') {
      symbol_table[count].id_name=strdup(yytext);
      symbol_table[count].data_type=strdup(type_n);
      symbol_table[count].line_no=yylineno;
      symbol_table[count].type=strdup("Function");   
      count++;  
    }
}
}
void insert_type() {
    printf("%s\n",yytext);
	strcpy(type_n, s);
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