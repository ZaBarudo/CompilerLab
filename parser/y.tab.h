/* A Bison parser, made by GNU Bison 3.8.2.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2021 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <https://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* DO NOT RELY ON FEATURES THAT ARE NOT DOCUMENTED in the manual,
   especially those whose name start with YY_ or yy_.  They are
   private implementation details that can be changed or removed.  */

#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token kinds.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    YYEMPTY = -2,
    YYEOF = 0,                     /* "end of file"  */
    YYerror = 256,                 /* error  */
    YYUNDEF = 257,                 /* "invalid token"  */
    PLUS = 258,                    /* PLUS  */
    MINUS = 259,                   /* MINUS  */
    TIMES = 260,                   /* TIMES  */
    DIVIDE = 261,                  /* DIVIDE  */
    ASSIGN = 262,                  /* ASSIGN  */
    MODULO = 263,                  /* MODULO  */
    BITWISE_AND = 264,             /* BITWISE_AND  */
    BITWISE_OR = 265,              /* BITWISE_OR  */
    BITWISE_XOR = 266,             /* BITWISE_XOR  */
    BIT_CLEAR = 267,               /* BIT_CLEAR  */
    LEFT_SHIFT = 268,              /* LEFT_SHIFT  */
    RIGHT_SHIFT = 269,             /* RIGHT_SHIFT  */
    ADD_ASSIGN = 270,              /* ADD_ASSIGN  */
    SUB_ASSIGN = 271,              /* SUB_ASSIGN  */
    MUL_ASSIGN = 272,              /* MUL_ASSIGN  */
    DIV_ASSIGN = 273,              /* DIV_ASSIGN  */
    MOD_ASSIGN = 274,              /* MOD_ASSIGN  */
    AND_ASSIGN = 275,              /* AND_ASSIGN  */
    OR_ASSIGN = 276,               /* OR_ASSIGN  */
    XOR_ASSIGN = 277,              /* XOR_ASSIGN  */
    LEFT_SHIFT_ASSIGN = 278,       /* LEFT_SHIFT_ASSIGN  */
    RIGHT_SHIFT_ASSIGN = 279,      /* RIGHT_SHIFT_ASSIGN  */
    INCREMENT = 280,               /* INCREMENT  */
    DECREMENT = 281,               /* DECREMENT  */
    RECEIVE = 282,                 /* RECEIVE  */
    CLEAR_ASSIGN = 283,            /* CLEAR_ASSIGN  */
    SHORT_VAR = 284,               /* SHORT_VAR  */
    VARIADIC_PARAM = 285,          /* VARIADIC_PARAM  */
    SELECTOR = 286,                /* SELECTOR  */
    EQUAL_EQUAL = 287,             /* EQUAL_EQUAL  */
    NOT_EQUAL = 288,               /* NOT_EQUAL  */
    LESS_THAN = 289,               /* LESS_THAN  */
    LESS_THAN_OR_EQUAL = 290,      /* LESS_THAN_OR_EQUAL  */
    GREATER_THAN = 291,            /* GREATER_THAN  */
    GREATER_THAN_OR_EQUAL = 292,   /* GREATER_THAN_OR_EQUAL  */
    LOGICAL_AND = 293,             /* LOGICAL_AND  */
    LOGICAL_OR = 294,              /* LOGICAL_OR  */
    LOGICAL_NOT = 295,             /* LOGICAL_NOT  */
    IF = 296,                      /* IF  */
    ELSE = 297,                    /* ELSE  */
    WHILE = 298,                   /* WHILE  */
    FOR = 299,                     /* FOR  */
    SWITCH = 300,                  /* SWITCH  */
    CASE = 301,                    /* CASE  */
    DEFAULT = 302,                 /* DEFAULT  */
    BREAK = 303,                   /* BREAK  */
    CONTINUE = 304,                /* CONTINUE  */
    RETURN = 305,                  /* RETURN  */
    VAR = 306,                     /* VAR  */
    INT_TYPE = 307,                /* INT_TYPE  */
    BOOL_TYPE = 308,               /* BOOL_TYPE  */
    STRING_TYPE = 309,             /* STRING_TYPE  */
    IMPORT = 310,                  /* IMPORT  */
    FUNCTION = 311,                /* FUNCTION  */
    APPEND = 312,                  /* APPEND  */
    LEN = 313,                     /* LEN  */
    PRINT = 314,                   /* PRINT  */
    PRINTLN = 315,                 /* PRINTLN  */
    PACKAGE = 316,                 /* PACKAGE  */
    CHAN = 317,                    /* CHAN  */
    CONST = 318,                   /* CONST  */
    DEFER = 319,                   /* DEFER  */
    FALLTHROUGH = 320,             /* FALLTHROUGH  */
    GO = 321,                      /* GO  */
    GOTO = 322,                    /* GOTO  */
    INTERFACE = 323,               /* INTERFACE  */
    MAP = 324,                     /* MAP  */
    RANGE = 325,                   /* RANGE  */
    SELECT = 326,                  /* SELECT  */
    STRUCT = 327,                  /* STRUCT  */
    TYPE = 328,                    /* TYPE  */
    LPAREN = 329,                  /* LPAREN  */
    RPAREN = 330,                  /* RPAREN  */
    LBRACE = 331,                  /* LBRACE  */
    RBRACE = 332,                  /* RBRACE  */
    LSQPAREN = 333,                /* LSQPAREN  */
    RSQPAREN = 334,                /* RSQPAREN  */
    SEMICOLON = 335,               /* SEMICOLON  */
    COMMA = 336,                   /* COMMA  */
    COLON = 337,                   /* COLON  */
    BOOLEAN = 338,                 /* BOOLEAN  */
    IDENTIFIER = 339,              /* IDENTIFIER  */
    INTEGER = 340,                 /* INTEGER  */
    STRING = 341,                  /* STRING  */
    FLOAT = 342,                   /* FLOAT  */
    COMMENT = 343,                 /* COMMENT  */
    MULTI_LINE_COMMENT = 344       /* MULTI_LINE_COMMENT  */
  };
  typedef enum yytokentype yytoken_kind_t;
#endif
/* Token kinds.  */
#define YYEMPTY -2
#define YYEOF 0
#define YYerror 256
#define YYUNDEF 257
#define PLUS 258
#define MINUS 259
#define TIMES 260
#define DIVIDE 261
#define ASSIGN 262
#define MODULO 263
#define BITWISE_AND 264
#define BITWISE_OR 265
#define BITWISE_XOR 266
#define BIT_CLEAR 267
#define LEFT_SHIFT 268
#define RIGHT_SHIFT 269
#define ADD_ASSIGN 270
#define SUB_ASSIGN 271
#define MUL_ASSIGN 272
#define DIV_ASSIGN 273
#define MOD_ASSIGN 274
#define AND_ASSIGN 275
#define OR_ASSIGN 276
#define XOR_ASSIGN 277
#define LEFT_SHIFT_ASSIGN 278
#define RIGHT_SHIFT_ASSIGN 279
#define INCREMENT 280
#define DECREMENT 281
#define RECEIVE 282
#define CLEAR_ASSIGN 283
#define SHORT_VAR 284
#define VARIADIC_PARAM 285
#define SELECTOR 286
#define EQUAL_EQUAL 287
#define NOT_EQUAL 288
#define LESS_THAN 289
#define LESS_THAN_OR_EQUAL 290
#define GREATER_THAN 291
#define GREATER_THAN_OR_EQUAL 292
#define LOGICAL_AND 293
#define LOGICAL_OR 294
#define LOGICAL_NOT 295
#define IF 296
#define ELSE 297
#define WHILE 298
#define FOR 299
#define SWITCH 300
#define CASE 301
#define DEFAULT 302
#define BREAK 303
#define CONTINUE 304
#define RETURN 305
#define VAR 306
#define INT_TYPE 307
#define BOOL_TYPE 308
#define STRING_TYPE 309
#define IMPORT 310
#define FUNCTION 311
#define APPEND 312
#define LEN 313
#define PRINT 314
#define PRINTLN 315
#define PACKAGE 316
#define CHAN 317
#define CONST 318
#define DEFER 319
#define FALLTHROUGH 320
#define GO 321
#define GOTO 322
#define INTERFACE 323
#define MAP 324
#define RANGE 325
#define SELECT 326
#define STRUCT 327
#define TYPE 328
#define LPAREN 329
#define RPAREN 330
#define LBRACE 331
#define RBRACE 332
#define LSQPAREN 333
#define RSQPAREN 334
#define SEMICOLON 335
#define COMMA 336
#define COLON 337
#define BOOLEAN 338
#define IDENTIFIER 339
#define INTEGER 340
#define STRING 341
#define FLOAT 342
#define COMMENT 343
#define MULTI_LINE_COMMENT 344

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;


int yyparse (void);


#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
