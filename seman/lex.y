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
    

    void add(char);
    void insert_type();
    int search(char *);
    void insert_type();
    int check_declaration(char *);
    int success = 1;
    struct node* mknode(struct node *left, struct node *right, char *token);
    char *get_type(char *var);
    char *get_actual_type(char *var);
    void printBT(struct node*);

    struct dataType {
        char * id_name;
        char * data_type;
        char * type;
        int line_no;
    } symbol_table[40];
    int count=0;
    int q;
    char type_n[10];
    char type_temp[10];
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
	} nd_obj; 
    struct var_name2 {
        char name[100];
        struct node* nd;
        char type[10];
    } nd_obj2;
}

%token <nd_obj> PLUS MINUS TIMES DIVIDE ASSIGN MODULO BITWISE_AND BITWISE_OR BITWISE_XOR BIT_CLEAR LEFT_SHIFT RIGHT_SHIFT ADD_ASSIGN SUB_ASSIGN MUL_ASSIGN 
%token <nd_obj> DIV_ASSIGN MOD_ASSIGN AND_ASSIGN OR_ASSIGN XOR_ASSIGN LEFT_SHIFT_ASSIGN RIGHT_SHIFT_ASSIGN INCREMENT DECREMENT RECEIVE CLEAR_ASSIGN 
%token <nd_obj> SHORT_VAR VARIADIC_PARAM SELECTOR EQUAL_EQUAL NOT_EQUAL LESS_THAN LESS_THAN_OR_EQUAL GREATER_THAN GREATER_THAN_OR_EQUAL LOGICAL_AND 
%token <nd_obj> LOGICAL_OR LOGICAL_NOT IF ELSE WHILE FOR SWITCH CASE DEFAULT BREAK CONTINUE RETURN VAR INT_TYPE BOOL_TYPE STRING_TYPE IMPORT FUNCTION APPEND LEN PRINT PRINTLN
%token <nd_obj> PACKAGE CHAN CONST DEFER FALLTHROUGH GO GOTO INTERFACE MAP RANGE SELECT STRUCT TYPE LPAREN RPAREN LBRACE RBRACE LSQPAREN RSQPAREN SEMICOLON
%token <nd_obj> COMMA COLON BOOLEAN IDENTIFIER INTEGER STRING FLOAT COMMENT MULTI_LINE_COMMENT FLOAT_TYPE

%type <nd_obj> program PackageClause declaration declaration1 function_declaration type literal
%type <nd_obj> statement simple_stmt inc_dec_stmt assignment assign_op add_op_eq mul_op_eq return_stmt block_stmt 
%type <nd_obj> boolean_exp if_stmt if_stmt1 for_stmt for_clause println_stmt print_param thing return_ 
%type <nd_obj2> number expression binary_op term

%%


program: PackageClause function_declaration { $$.nd = mknode($1.nd, $2.nd, "program"); head = $$.nd; } 
;

PackageClause: PACKAGE { add('H'); } IDENTIFIER {$1.nd = mknode(NULL, NULL, $1.name); $3.nd = mknode(NULL, NULL, $3.name); $$.nd = mknode($1.nd, $3.nd, "package"); }
;

declaration : VAR { add('K'); } IDENTIFIER { r=strdup(yytext); lno = yylineno; } declaration1 { $3.nd = mknode(NULL, NULL, $3.name);  $$.nd = mknode($3.nd, $5.nd, "declaration"); }
            ;

declaration1 : type { add('V'); $$.nd = mknode(NULL, $1.nd, "variable"); }                                                
;

function_declaration : FUNCTION IDENTIFIER { add('F'); } LPAREN RPAREN block_stmt { $2.nd = mknode(NULL, NULL, $2.name); $$.nd = mknode($2.nd, $6.nd, "function"); }
                     ;

thing : IDENTIFIER { check_declaration($1.name); $$.nd = mknode(NULL, NULL, $1.name);}
      | literal {$$.nd = $1.nd;}
      ;

term: IDENTIFIER { if(check_declaration($1.name)){ $$.nd = mknode(NULL, NULL, $1.name); strcpy($$.type, get_type($1.name));}}
    | number {$$.nd = $1.nd; strcpy($$.type, $1.type);}
    | LPAREN expression RPAREN {$$.nd = $2.nd; strcpy($$.type, $2.type);}
    ;

expression : term {$$.nd = $1.nd; strcpy($$.type, $1.type);}     
           | binary_op {$$.nd = $1.nd; strcpy($$.type, $1.type);}       
           ;

binary_op : expression LOGICAL_OR term { if(strcmp($1.type, $3.type)){sprintf(errors[sem_errors], "Line %d: Type mismatch in expression!\n", countn+1);sem_errors++;} else {$$.nd = mknode($1.nd, $3.nd, $2.name);} }          
         | expression LOGICAL_AND term { if(strcmp($1.type, $3.type)){sprintf(errors[sem_errors], "Line %d: Type mismatch in expression!\n", countn+1);sem_errors++;} else {$$.nd = mknode($1.nd, $3.nd, $2.name);} }               
         | expression EQUAL_EQUAL term { if(strcmp($1.type, $3.type)){sprintf(errors[sem_errors], "Line %d: Type mismatch in expression!\n", countn+1);sem_errors++;} else {$$.nd = mknode($1.nd, $3.nd, $2.name);} }             
         | expression NOT_EQUAL term { if(strcmp($1.type, $3.type)){sprintf(errors[sem_errors], "Line %d: Type mismatch in expression!\n", countn+1);sem_errors++;} else {$$.nd = mknode($1.nd, $3.nd, $2.name);} }          
         | expression LESS_THAN_OR_EQUAL term { if(strcmp($1.type, $3.type)){sprintf(errors[sem_errors], "Line %d: Type mismatch in expression!\n", countn+1);sem_errors++;} else {$$.nd = mknode($1.nd, $3.nd, $2.name);} }          
         | expression GREATER_THAN_OR_EQUAL term { if(strcmp($1.type, $3.type)){sprintf(errors[sem_errors], "Line %d: Type mismatch in expression!\n", countn+1);sem_errors++;} else {$$.nd = mknode($1.nd, $3.nd, $2.name);} }          
         | expression LESS_THAN term { if(strcmp($1.type, $3.type)){sprintf(errors[sem_errors], "Line %d: Type mismatch in expression!\n", countn+1);sem_errors++;} else {$$.nd = mknode($1.nd, $3.nd, $2.name);} }                
         | expression GREATER_THAN term { if(strcmp($1.type, $3.type)){sprintf(errors[sem_errors], "Line %d: Type mismatch in expression!\n", countn+1);sem_errors++;} else {$$.nd = mknode($1.nd, $3.nd, $2.name);} }                
         | expression PLUS term { if(strcmp($1.type, $3.type)){sprintf(errors[sem_errors], "Line %d: Type mismatch in expression!\n", countn+1);sem_errors++;} else {$$.nd = mknode($1.nd, $3.nd, $2.name);} }               
         | expression MINUS term { if(strcmp($1.type, $3.type)){sprintf(errors[sem_errors], "Line %d: Type mismatch in expression!\n", countn+1);sem_errors++;} else {$$.nd = mknode($1.nd, $3.nd, $2.name);} }                
         | expression BITWISE_OR term { if(strcmp($1.type, $3.type)){sprintf(errors[sem_errors], "Line %d: Type mismatch in expression!\n", countn+1);sem_errors++;} else {$$.nd = mknode($1.nd, $3.nd, $2.name);} }                
         | expression BITWISE_XOR term { if(strcmp($1.type, $3.type)){sprintf(errors[sem_errors], "Line %d: Type mismatch in expression!\n", countn+1);sem_errors++;} else {$$.nd = mknode($1.nd, $3.nd, $2.name);} }                
         | expression TIMES term { if(strcmp($1.type, $3.type)){sprintf(errors[sem_errors], "Line %d: Type mismatch in expression!\n", countn+1);sem_errors++;} else {$$.nd = mknode($1.nd, $3.nd, $2.name);} }                
         | expression DIVIDE term { if(strcmp($1.type, $3.type)){sprintf(errors[sem_errors], "Line %d: Type mismatch in expression!\n", countn+1);sem_errors++;} else {$$.nd = mknode($1.nd, $3.nd, $2.name);} }                
         | expression MODULO term { if(strcmp($1.type, $3.type)){sprintf(errors[sem_errors], "Line %d: Type mismatch in expression!\n", countn+1);sem_errors++;} else {$$.nd = mknode($1.nd, $3.nd, $2.name);} }                
         | expression RIGHT_SHIFT term { if(strcmp($1.type, $3.type)){sprintf(errors[sem_errors], "Line %d: Type mismatch in expression!\n", countn+1);sem_errors++;} else {$$.nd = mknode($1.nd, $3.nd, $2.name);} }        
         | expression LEFT_SHIFT term { if(strcmp($1.type, $3.type)){sprintf(errors[sem_errors], "Line %d: Type mismatch in expression!\n", countn+1);sem_errors++;} else {$$.nd = mknode($1.nd, $3.nd, $2.name);} }         
         | expression BITWISE_AND term { if(strcmp($1.type, $3.type)){sprintf(errors[sem_errors], "Line %d: Type mismatch in expression!\n", countn+1);sem_errors++;} else {$$.nd = mknode($1.nd, $3.nd, $2.name);} }                
         | expression BIT_CLEAR term { if(strcmp($1.type, $3.type)){sprintf(errors[sem_errors], "Line %d: Type mismatch in expression!\n", countn+1);sem_errors++;} else {$$.nd = mknode($1.nd, $3.nd, $2.name);} }          
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
assignment : IDENTIFIER { } ASSIGN expression { 
                if(check_declaration($1.name)){
                    if(strcmp(get_type($1.name), $4.type)) {
                    
                    sprintf(errors[sem_errors], "Line %d: Type mismatch in assignment!\n", countn+1);
                    sem_errors++;
                } else {
                    
                    $1.nd = mknode(NULL, NULL, $1.name); $$.nd = mknode($1.nd, $4.nd, "="); 
                    }
                }
                
            }
           | IDENTIFIER { } assign_op expression { 
                if(check_declaration($1.name)){
                    if(strcmp(get_type($1.name), $4.type)) {
                    
                    sprintf(errors[sem_errors], "Line %d: Type mismatch in assignment!\n", countn+1);
                    sem_errors++;
                } else {
                    
                    $1.nd = mknode(NULL, NULL, $1.name); $$.nd = mknode($1.nd, $4.nd, $1.name); 
                    }
                }
                
            }
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
return_ : thing { strcpy(type_temp, get_actual_type($1.name)); if(!strcmp(type_temp, "Variable") || !strcmp(type_temp, "Constant")){$$.nd = $1.nd; } else {sprintf(errors[sem_errors], "Line %d: Invalid return\n", countn+1);sem_errors++;}}
        | { $$.nd = NULL ;}

block_stmt : LBRACE statement RBRACE { $$.nd = $2.nd; }
           ; 


boolean_exp: term LOGICAL_OR term { if(strcmp($1.type, $3.type)){sprintf(errors[sem_errors], "Line %d: Type mismatch in Boolean!\n", countn+1);sem_errors++;} else {$$.nd = mknode($1.nd, $3.nd, $2.name);} }    
         | term LOGICAL_AND term { if(strcmp($1.type, $3.type)){sprintf(errors[sem_errors], "Line %d: Type mismatch in Boolean!\n", countn+1);sem_errors++;} else {$$.nd = mknode($1.nd, $3.nd, $2.name);} }     
         | term EQUAL_EQUAL term { if(strcmp($1.type, $3.type)){sprintf(errors[sem_errors], "Line %d: Type mismatch in Boolean!\n", countn+1);sem_errors++;} else {$$.nd = mknode($1.nd, $3.nd, $2.name);} }   
         | term NOT_EQUAL term { if(strcmp($1.type, $3.type)){sprintf(errors[sem_errors], "Line %d: Type mismatch in Boolean!\n", countn+1);sem_errors++;} else {$$.nd = mknode($1.nd, $3.nd, $2.name);} }
         | term LESS_THAN_OR_EQUAL term { if(strcmp($1.type, $3.type)){sprintf(errors[sem_errors], "Line %d: Type mismatch in Boolean!\n", countn+1);sem_errors++;} else {$$.nd = mknode($1.nd, $3.nd, $2.name);} }
         | term GREATER_THAN_OR_EQUAL term { if(strcmp($1.type, $3.type)){sprintf(errors[sem_errors], "Line %d: Type mismatch in Boolean!\n", countn+1);sem_errors++;} else {$$.nd = mknode($1.nd, $3.nd, $2.name);} }
         | term LESS_THAN term { if(strcmp($1.type, $3.type)){sprintf(errors[sem_errors], "Line %d: Type mismatch in Boolean!\n", countn+1);sem_errors++;} else {$$.nd = mknode($1.nd, $3.nd, $2.name);} }      
         | term GREATER_THAN term { if(strcmp($1.type, $3.type)){sprintf(errors[sem_errors], "Line %d: Type mismatch in Boolean!\n", countn+1);sem_errors++;} else {$$.nd = mknode($1.nd, $3.nd, $2.name);} }
        ;       
if_stmt : IF { add('K'); } boolean_exp block_stmt if_stmt1 { cond_if = mknode($3.nd, $4.nd, "IF-STUFF"); $$.nd = mknode(cond_if, $5.nd, "IF-PART"); }
        ;

if_stmt1 :  { $$.nd = NULL; }
        |   ELSE { add('K'); } if_stmt  { $1.nd = mknode(NULL, NULL, $1.name); $$.nd = mknode($1.nd, $3.nd, "IF-ELSE-IF"); }
        |   ELSE { add('K'); } block_stmt  { $1.nd = mknode(NULL, NULL, $1.name); $$.nd = mknode($1.nd, $3.nd, "IF-ELSE"); }
        ;

for_stmt : FOR { add('K'); } for_clause block_stmt  { $$.nd = mknode($3.nd, $4.nd, "FOR"); }
            ;

for_clause : assignment SEMICOLON boolean_exp SEMICOLON simple_stmt  {struct node* ass_bool = mknode($1.nd, $3.nd, "ass-bool");  $$.nd = mknode(ass_bool, $5.nd, "FOR-CLAUSE"); }
           ;

println_stmt : PRINTLN { add('K'); } LPAREN print_param { $1.nd = mknode(NULL, NULL, "println"); $$.nd = mknode($1.nd, $4.nd, "PRINTLN"); }

print_param : STRING RPAREN { $1.nd = mknode(NULL, NULL, "println"); $$.nd = mknode(NULL, NULL, $1.name); }
            | expression RPAREN   { $1.nd = mknode(NULL, NULL, "println"); $$.nd = mknode(NULL, NULL, $1.name); }
            ;

type : INT_TYPE { s = yytext; strcpy(type_n,s); $$.nd = mknode(NULL, NULL, $1.name); }  
     | STRING_TYPE { s = yytext; strcpy(type_n,s); $$.nd = mknode(NULL, NULL, $1.name); }  
     | BOOL_TYPE { s = yytext; strcpy(type_n,s); $$.nd = mknode(NULL, NULL, $1.name); }
     | FLOAT_TYPE { s = yytext; strcpy(type_n,s); $$.nd = mknode(NULL, NULL, $1.name); }

literal : INTEGER {add('C'); $$.nd = mknode(NULL, NULL, $1.name);}                        
        | STRING {add('C'); $$.nd = mknode(NULL, NULL, $1.name);}                      
        | FLOAT {add('C'); $$.nd = mknode(NULL, NULL, $1.name);}                        
        | BOOLEAN {add('C'); $$.nd = mknode(NULL, NULL, $1.name);}                   
        ;

number : INTEGER {add('C'); $$.nd = mknode(NULL, NULL, $1.name); sprintf($$.type, "int"); }    
         | FLOAT {add('C'); $$.nd = mknode(NULL, NULL, $1.name); sprintf($$.type, "float");} 
         | BOOLEAN  {add('C'); $$.nd = mknode(NULL, NULL, $1.name); sprintf($$.type, "bool");} 
         ;

%%

int main() {
    extern FILE *yyin, *yyout;
   
    yyparse();
    printf("\n\n\t\t\t\t\t\t\t\t PHASE 1: LEXICAL ANALYSIS \n\n");
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

    printf("\t\t\t\t\t\t\t\t PHASE 2: SYNTAX ANALYSIS \n\n");
    if(success)
    printf("Parsing Successful\n");
    printf("PARSE TREE");
    printf("\n\n");
	printBT(head);
    printf("\n\n");
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

int check_declaration(char *c) {
    q = search(c);
    if(!q) {
        sprintf(errors[sem_errors], "Line %d: Variable \"%s\" not declared before usage!\n", countn+1, c);
		sem_errors++;
        return 0;
    }
    return 1;
}

char *get_type(char *var) { 
    for(int i=0; i<count; i++) {  
        if(!strcmp(symbol_table[i].id_name, var)) {   
            return symbol_table[i].data_type;  
        }
    }
}

char *get_actual_type(char *var) { 
    for(int i=0; i<count; i++) {  
        if(!strcmp(symbol_table[i].id_name, var)) {   
            return symbol_table[i].type;  
        }
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
        }  
        else if(c == 'V') {
        symbol_table[count].id_name=strdup(r);
        symbol_table[count].data_type=strdup(type_n);
        symbol_table[count].line_no=lno;
        symbol_table[count].type=strdup("Variable");   
        count++;  
        }
        else if(c == 'C') {
        symbol_table[count].id_name=strdup(yytext);
        symbol_table[count].data_type=strdup("CONST");
        symbol_table[count].line_no=yylineno;
        symbol_table[count].type=strdup("Constant");   
        count++;  
        }
        else if(c == 'F') {
        symbol_table[count].id_name=strdup(yytext);
        symbol_table[count].data_type=strdup(type_n);
        symbol_table[count].line_no=yylineno;
        symbol_table[count].type=strdup("Function");   
        count++;  
        }
    }
    else if(c == 'V' && q) {
        sprintf(errors[sem_errors], "Line %d: Multiple declarations of \"%s\" not allowed!\n", countn, r );
		sem_errors++;
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
