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
    struct node* mknode(struct node *left, struct node *right, char *token, int val);
    int add_val(char *type_n, int val);
    int get_val(char *type_n);
    char *get_type(char *var);
    char *get_actual_type(char *var);
    void printBT(struct node*);

    struct dataType {
        char * id_name;
        char * data_type;
        char * type;
        int line_no;
        int value;
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
        int val;
    };

    int temp_var=0; 
    int label=0; 
    int is_for=0;
    char icg[50][100];
	char buff[100];
	int ic_idx=0;
    char snum[5];
    
%}

%union { 
	struct var_name { 
		char name[100]; 
		struct node* nd;
        int value;
	} nd_obj; 
    struct var_name2 {
        char name[100];
        struct node* nd;
        char type[10];
        int value;
    } nd_obj2;
    struct var_name3 {
        char name[100];
        struct node* nd;
        char if_body[5];
        char else_body[5]; 
        char after_else_body[5];
        int value;
    } nd_obj3;
}

%token <nd_obj> PLUS MINUS TIMES DIVIDE ASSIGN MODULO BITWISE_AND BITWISE_OR BITWISE_XOR BIT_CLEAR LEFT_SHIFT RIGHT_SHIFT ADD_ASSIGN SUB_ASSIGN MUL_ASSIGN 
%token <nd_obj> DIV_ASSIGN MOD_ASSIGN AND_ASSIGN OR_ASSIGN XOR_ASSIGN LEFT_SHIFT_ASSIGN RIGHT_SHIFT_ASSIGN INCREMENT DECREMENT RECEIVE CLEAR_ASSIGN 
%token <nd_obj> SHORT_VAR VARIADIC_PARAM SELECTOR EQUAL_EQUAL NOT_EQUAL LESS_THAN LESS_THAN_OR_EQUAL GREATER_THAN GREATER_THAN_OR_EQUAL LOGICAL_AND 
%token <nd_obj> LOGICAL_OR LOGICAL_NOT IF ELSE WHILE FOR SWITCH CASE DEFAULT BREAK CONTINUE RETURN VAR INT_TYPE BOOL_TYPE STRING_TYPE IMPORT FUNCTION APPEND LEN PRINT PRINTLN
%token <nd_obj> PACKAGE CHAN CONST DEFER FALLTHROUGH GO GOTO INTERFACE MAP RANGE SELECT STRUCT TYPE LPAREN RPAREN LBRACE RBRACE LSQPAREN RSQPAREN SEMICOLON
%token <nd_obj> COMMA COLON BOOLEAN IDENTIFIER INTEGER STRING FLOAT COMMENT MULTI_LINE_COMMENT FLOAT_TYPE

%type <nd_obj> program PackageClause declaration declaration1 function_declaration type literal
%type <nd_obj> statement simple_stmt inc_dec_stmt assignment assign_op add_op_eq mul_op_eq return_stmt block_stmt 
%type <nd_obj> if_stmt if_stmt1 println_stmt print_param thing return_ relop op
%type <nd_obj2> number expression binary_op term
%type <nd_obj3> boolean_exp for_clause for_stmt

%%


program: PackageClause function_declaration { $$.nd = mknode($1.nd, $2.nd, "program", $$.value); head = $$.nd; } 
;

PackageClause: PACKAGE { add('H'); } IDENTIFIER {$1.nd = mknode(NULL, NULL, $1.name, $$.value); $3.nd = mknode(NULL, NULL, $3.name, $$.value); $$.nd = mknode($1.nd, $3.nd, "package", $$.value); }
;

declaration : VAR { add('K'); } IDENTIFIER { r=strdup(yytext); lno = yylineno; } declaration1 { $3.nd = mknode(NULL, NULL, $3.name, $$.value);  $$.nd = mknode($3.nd, $5.nd, "declaration", $$.value); }
            ;

declaration1 : type { add('V'); $$.nd = mknode(NULL, $1.nd, "variable", $$.value); }                                                
;

function_declaration : FUNCTION IDENTIFIER { add('F'); } LPAREN RPAREN block_stmt { $2.nd = mknode(NULL, NULL, $2.name, $$.value); $$.nd = mknode($2.nd, $6.nd, "function", $$.value); }
                     ;

thing : IDENTIFIER { check_declaration($1.name); $$.nd = mknode(NULL, NULL, $1.name, $$.value);}
      | literal {$$.nd = $1.nd;}
      ;

term: IDENTIFIER { if(check_declaration($1.name)){  
            $$.value = get_val($1.name); 
            strcpy($$.name,$1.name); 
            $$.nd = mknode(NULL, NULL, $1.name, $$.value); 
            strcpy($$.type, get_type($1.name));
        }
    }
    | number { $$.value = $1.value; strcpy($$.name,$1.name); $$.nd = $1.nd; strcpy($$.type, $1.type);}
    | LPAREN expression RPAREN { $$.value = $2.value; strcpy($$.name,$2.name); $$.nd = $2.nd; strcpy($$.type, $2.type);
    }
    ;

expression : term { $$.value = $1.value; strcpy($$.name,$1.name); $$.nd = $1.nd; strcpy($$.type, $1.type);}     
           | binary_op { $$.value = $1.value; strcpy($$.name,$1.name); $$.nd = $1.nd; strcpy($$.type, $1.type);}       
           ;

binary_op : expression op term { 
        if(strcmp($1.type, $3.type)){
            sprintf(errors[sem_errors], "Line %d: Type mismatch in expression!\n", countn+1);
            sem_errors++;
        } else {
            if(!strcmp($2.name, "+")){
                $$.value = $3.value + $1.value;
            } else if(!strcmp($2.name, "-")){
                $$.value = $1.value - $3.value;
            } else if(!strcmp($2.name, "*")){
                $$.value = $1.value * $3.value;
            }
            $$.nd = mknode($1.nd, $3.nd, $2.name, $$.value);
        } 
        sprintf($$.name, "t%d", temp_var);
        temp_var++;
        sprintf(icg[ic_idx++], "%s = %s %s %s\n",  $$.name, $1.name, $2.name, $3.name);

    }          
    ;
        
op : LOGICAL_OR {$$.nd = mknode(NULL, NULL, $1.name, $$.value);}
    | LOGICAL_AND {$$.nd = mknode(NULL, NULL, $1.name, $$.value);}
    | EQUAL_EQUAL {$$.nd = mknode(NULL, NULL, $1.name, $$.value);}
    | NOT_EQUAL {$$.nd = mknode(NULL, NULL, $1.name, $$.value);}
    | GREATER_THAN_OR_EQUAL {$$.nd = mknode(NULL, NULL, $1.name, $$.value);}
    | LESS_THAN {$$.nd = mknode(NULL, NULL, $1.name, $$.value);}
    | GREATER_THAN {$$.nd = mknode(NULL, NULL, $1.name, $$.value);}
    | PLUS {$$.nd = mknode(NULL, NULL, $1.name, $$.value);}
    | MINUS {$$.nd = mknode(NULL, NULL, $1.name, $$.value);}
    | BITWISE_OR {$$.nd = mknode(NULL, NULL, $1.name, $$.value);}
    | BITWISE_XOR {$$.nd = mknode(NULL, NULL, $1.name, $$.value);}
    | TIMES {$$.nd = mknode(NULL, NULL, $1.name, $$.value);}
    | DIVIDE {$$.nd = mknode(NULL, NULL, $1.name, $$.value);}
    | MODULO {$$.nd = mknode(NULL, NULL, $1.name, $$.value);}
    | RIGHT_SHIFT {$$.nd = mknode(NULL, NULL, $1.name, $$.value);}
    | LEFT_SHIFT {$$.nd = mknode(NULL, NULL, $1.name, $$.value);}
    | BITWISE_AND {$$.nd = mknode(NULL, NULL, $1.name, $$.value);}
    | BIT_CLEAR {$$.nd = mknode(NULL, NULL, $1.name, $$.value);}
;

statement : declaration statement { $$.value = $1.value; $$.nd = mknode($1.nd, $2.nd, "statement", $$.value) ;}   
          | simple_stmt statement { $$.value = $1.value; $$.nd = mknode($1.nd, $2.nd, "statement", $$.value) ;}  			
          | return_stmt { $$.nd = mknode($1.nd, NULL, "statement", $$.value) ;}  
          | BREAK { add('K'); } statement { $$.nd = mknode(NULL, NULL, $1.name, $$.value); $$.nd = mknode($1.nd, $3.nd, "statement", $$.value) ;}  				
          | CONTINUE { add('K'); } statement { $$.nd = mknode(NULL, NULL, $1.name, $$.value); $$.nd = mknode($1.nd, $3.nd, "statement", $$.value) ;}  			
          | block_stmt statement { $$.nd = mknode($1.nd, $2.nd, "statement", $$.value) ;}  			
          | if_stmt	statement { $$.nd = mknode($1.nd, $2.nd, "statement", $$.value) ;}  		
          | for_stmt statement { $$.nd = mknode($1.nd, $2.nd, "statement", $$.value) ;}  						
          | println_stmt statement { $$.nd = mknode($1.nd, $2.nd, "statement", $$.value) ;}  
          | COMMENT statement { $$.nd = mknode(NULL, $2.nd, "COMMENT", $$.value) ;}  
          | { $$.nd = NULL ;}  
          ;



simple_stmt : inc_dec_stmt { $$.nd = $1.nd; $$.value = $1.value; }
            | assignment { $$.nd = $1.nd; $$.value = $1.value;}
            ;



inc_dec_stmt : IDENTIFIER { check_declaration($1.name); } INCREMENT { 
                            if(strcmp(get_type($1.name),"int")){
                                sprintf(errors[sem_errors], "Line %d: Type mismatch in assignment!\n", countn+1);
                                sem_errors++;
                            } else {
                                $1.nd = mknode(NULL, NULL, $1.name, $$.value); $$.nd = mknode($1.nd, NULL, "INCREMENT", $$.value); 
                                // sprintf(buff, "t%d = %s + 1\n%s = t%d\n", temp_var, $1.name, $1.name, temp_var++); 
                                sprintf(icg[ic_idx++], "t%d = %s + 1\n", temp_var, $1.name);
                                sprintf(icg[ic_idx++], "%s = t%d\n",$1.name, temp_var++);
                                $$.value = $1.value + 1;
                            }
                            }
             | IDENTIFIER { check_declaration($1.name); } DECREMENT { 
                            if(strcmp(get_type($1.name),"int")){
                                sprintf(errors[sem_errors], "Line %d: Type mismatch in assignment!\n", countn+1);
                                sem_errors++;
                            } else {
                                $1.nd = mknode(NULL, NULL, $1.name, $$.value); $$.nd = mknode($1.nd, NULL, "INCREMENT", $$.value); 
                                // sprintf(buff, "t%d = %s - 1\n%s = t%d\n", temp_var, $1.name, $1.name, temp_var++); 
                                sprintf(icg[ic_idx++], "t%d = %s - 1\n", temp_var, $1.name);
                                sprintf(icg[ic_idx++], "%s = t%d\n",$1.name, temp_var++);
                                $$.value = $1.value - 1;
                            }
                        }
             ;

/* https://golang.org/ref/spec#Operands
 The blank identifier may appear as an operand only on the left-hand side of an assignment. */ 
assignment : IDENTIFIER { } ASSIGN expression { 
                if(check_declaration($1.name)){
                    if(strcmp(get_type($1.name), $4.type)) {
                        sprintf(errors[sem_errors], "Line %d: Type mismatch in assignment!\n", countn+1);
                        sem_errors++;
                    } else {
                        $1.value = $4.value;
                        $$.value = $4.value;
                        add_val($1.name, $$.value);
                        $1.nd = mknode(NULL, NULL, $1.name, $$.value); $$.nd = mknode($1.nd, $4.nd, "=", $$.value); 
                        sprintf(icg[ic_idx++], "%s = %s\n", $1.name, $4.name);
                    }
                }
                
                
            }
           | IDENTIFIER { } assign_op expression { 
                if(check_declaration($1.name)){
                    if(strcmp(get_type($1.name), $4.type)) {
                        sprintf(errors[sem_errors], "Line %d: Type mismatch in assignment!\n", countn+1);
                        sem_errors++;
                    } else {
                        $1.value = $4.value;
                        $$.value = $1.value;  
                        add_val($1.name, $$.value);
                        $1.nd = mknode(NULL, NULL, $1.name, $$.value); $$.nd = mknode($1.nd, $4.nd, $1.name, $$.value); 
                        sprintf(icg[ic_idx++], "%s = %s\n", $1.name, $4.name);

                    }
                }
                
            }

           ;

assign_op : add_op_eq {$$.nd = $1.nd;}
          | mul_op_eq {$$.nd = $1.nd;}			
          ;

add_op_eq : ADD_ASSIGN {$$.nd = mknode(NULL, NULL, $1.name, $$.value);}
          | SUB_ASSIGN {$$.nd = mknode(NULL, NULL, $1.name, $$.value);}
          | OR_ASSIGN {$$.nd = mknode(NULL, NULL, $1.name, $$.value);}
          | XOR_ASSIGN {$$.nd = mknode(NULL, NULL, $1.name, $$.value);}
          ;

mul_op_eq : MUL_ASSIGN {$$.nd = mknode(NULL, NULL, $1.name, $$.value);}
          | DIV_ASSIGN {$$.nd = mknode(NULL, NULL, $1.name, $$.value);}
          | MOD_ASSIGN {$$.nd = mknode(NULL, NULL, $1.name, $$.value);}
          | LEFT_SHIFT_ASSIGN {$$.nd = mknode(NULL, NULL, $1.name, $$.value);}
          | RIGHT_SHIFT_ASSIGN {$$.nd = mknode(NULL, NULL, $1.name, $$.value);}
          | AND_ASSIGN {$$.nd = mknode(NULL, NULL, $1.name, $$.value);}
          | CLEAR_ASSIGN {$$.nd = mknode(NULL, NULL, $1.name, $$.value);}
          ;



return_stmt : RETURN { add('K'); } return_ { $1.nd = mknode(NULL, NULL, "return", $$.value); $$.nd = mknode($1.nd, $3.nd, "RETURN", $$.value); }
            ;
return_ : thing { strcpy(type_temp, get_actual_type($1.name)); if(!strcmp(type_temp, "Variable") || !strcmp(type_temp, "Constant")){$$.nd = $1.nd; } else {sprintf(errors[sem_errors], "Line %d: Invalid return\n", countn+1);sem_errors++;}}
        | { $$.nd = NULL ;}

block_stmt : LBRACE statement RBRACE { $$.nd = $2.nd; }
           ; 


boolean_exp: term relop boolean_exp { 
        // if(strcmp($1.type, $3.type)){sprintf(errors[sem_errors], "Line %d: Type mismatch in Boolean!\n", countn+1);sem_errors++;} 
        // else {
            $$.nd = mknode($1.nd, $3.nd, $2.name);
            // } 
        if(is_for) {
            sprintf($$.if_body, "L%d", label++);
            sprintf(icg[ic_idx++], "\nLABEL %s:\n", $$.if_body);
            sprintf(icg[ic_idx++], "\nif NOT (%s %s %s) GOTO L%d\n", $1.name, $2.name, $3.name, label);
            sprintf($$.else_body, "L%d", label++);
        } else {
            sprintf(icg[ic_idx++], "\nif (%s %s %s) GOTO L%d else GOTO L%d\n", $1.name, $2.name, $3.name, label, label+1);
            sprintf($$.if_body, "L%d", label++);
            sprintf($$.else_body, "L%d", label++);
            sprintf($$.after_else_body, "L%d", label++);
        }
    }    

    | term {$$.nd = mknode(NULL, NULL, $1.name);}
         ;      

relop: LOGICAL_OR {$$.nd = mknode(NULL, NULL, $1.name, $$.value);}
| LOGICAL_AND {$$.nd = mknode(NULL, NULL, $1.name, $$.value);}
| EQUAL_EQUAL {$$.nd = mknode(NULL, NULL, $1.name, $$.value);}
| NOT_EQUAL {$$.nd = mknode(NULL, NULL, $1.name, $$.value);}
| LESS_THAN_OR_EQUAL {$$.nd = mknode(NULL, NULL, $1.name, $$.value);}
| GREATER_THAN_OR_EQUAL {$$.nd = mknode(NULL, NULL, $1.name, $$.value);}
| LESS_THAN {$$.nd = mknode(NULL, NULL, $1.name, $$.value);}
| GREATER_THAN {$$.nd = mknode(NULL, NULL, $1.name, $$.value);}
    ;

if_stmt : IF { add('K'); is_for = 0; } boolean_exp { sprintf(icg[ic_idx++], "\nLABEL %s:\n", $3.if_body); } block_stmt { sprintf(icg[ic_idx++], "GOTO %s\n\n", $3.after_else_body); sprintf(icg[ic_idx++], "LABEL %s:\n", $3.else_body); } if_stmt1 { sprintf(icg[ic_idx++], "\nLABEL %s:\n", $3.after_else_body); cond_if = mknode($3.nd, $5.nd, "IF-STUFF", $$.value); $$.nd = mknode(cond_if, $7.nd, "IF-PART", $$.value); }
        ;
    
if_stmt1 :  { $$.nd = NULL; }
        |   ELSE { add('K'); } if_stmt  { $1.nd = mknode(NULL, NULL, $1.name, $$.value); $$.nd = mknode($1.nd, $3.nd, "IF-ELSE-IF", $$.value); }
        |   ELSE { add('K'); } block_stmt  { $1.nd = mknode(NULL, NULL, $1.name, $$.value); $$.nd = mknode($1.nd, $3.nd, "IF-ELSE", $$.value); }
        ;

for_stmt : FOR { add('K');  is_for = 1; } for_clause block_stmt  { 
        $$.nd = mknode($3.nd, $4.nd, "FOR", $$.value); 
        sprintf(icg[ic_idx++], "JUMP to %s\n", $3.if_body);
        sprintf(icg[ic_idx++], "\nLABEL %s:\n", $3.else_body);
    }
        ;

for_clause : assignment SEMICOLON boolean_exp SEMICOLON simple_stmt  {
        struct node* ass_bool = mknode($1.nd, $3.nd, "ass-bool", $$.value);  
        $$.nd = mknode(ass_bool, $5.nd, "FOR-CLAUSE", $$.value);
        strcpy($$.if_body, $3.if_body);
        strcpy($$.else_body, $3.else_body);
        // sprintf(icg[ic_idx++], "%s", buff); 
    }
        ;

println_stmt : PRINTLN { add('K'); } LPAREN print_param { $1.nd = mknode(NULL, NULL, "println", $$.value); $$.nd = mknode($1.nd, $4.nd, "PRINTLN", $$.value); }

print_param : STRING RPAREN { $1.nd = mknode(NULL, NULL, "println", $$.value); $$.nd = mknode(NULL, NULL, $1.name, $$.value); }
            | expression RPAREN   { $1.nd = mknode(NULL, NULL, "println", $$.value); $$.nd = mknode(NULL, NULL, $1.name, $$.value); }
            ;

type : INT_TYPE { s = yytext; strcpy(type_n,s); $$.nd = mknode(NULL, NULL, $1.name, $$.value); }  
     | STRING_TYPE { s = yytext; strcpy(type_n,s); $$.nd = mknode(NULL, NULL, $1.name, $$.value); }  
     | BOOL_TYPE { s = yytext; strcpy(type_n,s); $$.nd = mknode(NULL, NULL, $1.name, $$.value); }
     | FLOAT_TYPE { s = yytext; strcpy(type_n,s); $$.nd = mknode(NULL, NULL, $1.name, $$.value); }

literal : INTEGER {add('C'); $$.nd = mknode(NULL, NULL, $1.name, $$.value);}                        
        | STRING {add('C'); $$.nd = mknode(NULL, NULL, $1.name, $$.value);}                      
        | FLOAT {add('C'); $$.nd = mknode(NULL, NULL, $1.name, $$.value);}                        
        | BOOLEAN {add('C'); $$.nd = mknode(NULL, NULL, $1.name, $$.value);}                   
        ;

number : INTEGER { strcpy($$.name, $1.name); add('C'); $$.value = atoi($1.name); $$.nd = mknode(NULL, NULL, $1.name, $$.value); sprintf($$.type, "int"); }    
         | FLOAT { strcpy($$.name, $1.name); add('C'); $$.value = atof($1.name); $$.nd = mknode(NULL, NULL, $1.name, $$.value); sprintf($$.type, "float");} 
         | BOOLEAN  { strcpy($$.name, $1.name); add('C'); $$.nd = mknode(NULL, NULL, $1.name, $$.value); sprintf($$.type, "bool");} 
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
    
	printf("\t\t\t\t\t\t\t   PHASE 4: INTERMEDIATE CODE GENERATION \n\n");
	for(int i=0; i<ic_idx; i++){
		printf("%s", icg[i]);
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

int add_val(char *type_n, int val) { 
    int i; 
    for(i=count-1; i>=0; i--) {
        if(strcmp(symbol_table[i].id_name, type_n)==0) {  
            symbol_table[i].value = val;
            break;  
        }
    } 
    return 0;
}

int get_val(char *type_n) { 
    int i; 
    for(i=count-1; i>=0; i--) {
        if(strcmp(symbol_table[i].id_name, type_n)==0) {  
            return symbol_table[i].value;
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
        printf("%s %d",ptr->token, ptr->val);
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

struct node* mknode(struct node *left, struct node *right, char *token, int val) {	
	struct node *newnode = (struct node *)malloc(sizeof(struct node));
	char *newstr = (char *)malloc(strlen(token)+1);
	strcpy(newstr, token);
	newnode->left = left;
	newnode->right = right;
	newnode->token = newstr;
    newnode->val = val;
	return(newnode);
}
