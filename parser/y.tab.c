/* A Bison parser, made by GNU Bison 3.8.2.  */

/* Bison implementation for Yacc-like parsers in C

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

/* C LALR(1) parser skeleton written by Richard Stallman, by
   simplifying the original so-called "semantic" parser.  */

/* DO NOT RELY ON FEATURES THAT ARE NOT DOCUMENTED in the manual,
   especially those whose name start with YY_ or yy_.  They are
   private implementation details that can be changed or removed.  */

/* All symbols defined below should begin with yy or YY, to avoid
   infringing on user name space.  This should be done even for local
   variables, as they might otherwise be expanded by user macros.
   There are some unavoidable exceptions within include files to
   define necessary library symbols; they are noted "INFRINGES ON
   USER NAME SPACE" below.  */

/* Identify Bison output, and Bison version.  */
#define YYBISON 30802

/* Bison version string.  */
#define YYBISON_VERSION "3.8.2"

/* Skeleton name.  */
#define YYSKELETON_NAME "yacc.c"

/* Pure parsers.  */
#define YYPURE 0

/* Push parsers.  */
#define YYPUSH 0

/* Pull parsers.  */
#define YYPULL 1




/* First part of user prologue.  */
#line 1 "lex.y"

    #include<stdio.h>
    #include<string.h>
    #include<stdlib.h>
    #include<ctype.h>
    #define YYDEBUG 1
    int yyerror(const char *s);
    int yylex(void);
    int yywrap();
    int success = 1;

#line 83 "y.tab.c"

# ifndef YY_CAST
#  ifdef __cplusplus
#   define YY_CAST(Type, Val) static_cast<Type> (Val)
#   define YY_REINTERPRET_CAST(Type, Val) reinterpret_cast<Type> (Val)
#  else
#   define YY_CAST(Type, Val) ((Type) (Val))
#   define YY_REINTERPRET_CAST(Type, Val) ((Type) (Val))
#  endif
# endif
# ifndef YY_NULLPTR
#  if defined __cplusplus
#   if 201103L <= __cplusplus
#    define YY_NULLPTR nullptr
#   else
#    define YY_NULLPTR 0
#   endif
#  else
#   define YY_NULLPTR ((void*)0)
#  endif
# endif

/* Use api.header.include to #include this header
   instead of duplicating it here.  */
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
/* Symbol kind.  */
enum yysymbol_kind_t
{
  YYSYMBOL_YYEMPTY = -2,
  YYSYMBOL_YYEOF = 0,                      /* "end of file"  */
  YYSYMBOL_YYerror = 1,                    /* error  */
  YYSYMBOL_YYUNDEF = 2,                    /* "invalid token"  */
  YYSYMBOL_PLUS = 3,                       /* PLUS  */
  YYSYMBOL_MINUS = 4,                      /* MINUS  */
  YYSYMBOL_TIMES = 5,                      /* TIMES  */
  YYSYMBOL_DIVIDE = 6,                     /* DIVIDE  */
  YYSYMBOL_ASSIGN = 7,                     /* ASSIGN  */
  YYSYMBOL_MODULO = 8,                     /* MODULO  */
  YYSYMBOL_BITWISE_AND = 9,                /* BITWISE_AND  */
  YYSYMBOL_BITWISE_OR = 10,                /* BITWISE_OR  */
  YYSYMBOL_BITWISE_XOR = 11,               /* BITWISE_XOR  */
  YYSYMBOL_BIT_CLEAR = 12,                 /* BIT_CLEAR  */
  YYSYMBOL_LEFT_SHIFT = 13,                /* LEFT_SHIFT  */
  YYSYMBOL_RIGHT_SHIFT = 14,               /* RIGHT_SHIFT  */
  YYSYMBOL_ADD_ASSIGN = 15,                /* ADD_ASSIGN  */
  YYSYMBOL_SUB_ASSIGN = 16,                /* SUB_ASSIGN  */
  YYSYMBOL_MUL_ASSIGN = 17,                /* MUL_ASSIGN  */
  YYSYMBOL_DIV_ASSIGN = 18,                /* DIV_ASSIGN  */
  YYSYMBOL_MOD_ASSIGN = 19,                /* MOD_ASSIGN  */
  YYSYMBOL_AND_ASSIGN = 20,                /* AND_ASSIGN  */
  YYSYMBOL_OR_ASSIGN = 21,                 /* OR_ASSIGN  */
  YYSYMBOL_XOR_ASSIGN = 22,                /* XOR_ASSIGN  */
  YYSYMBOL_LEFT_SHIFT_ASSIGN = 23,         /* LEFT_SHIFT_ASSIGN  */
  YYSYMBOL_RIGHT_SHIFT_ASSIGN = 24,        /* RIGHT_SHIFT_ASSIGN  */
  YYSYMBOL_INCREMENT = 25,                 /* INCREMENT  */
  YYSYMBOL_DECREMENT = 26,                 /* DECREMENT  */
  YYSYMBOL_RECEIVE = 27,                   /* RECEIVE  */
  YYSYMBOL_CLEAR_ASSIGN = 28,              /* CLEAR_ASSIGN  */
  YYSYMBOL_SHORT_VAR = 29,                 /* SHORT_VAR  */
  YYSYMBOL_VARIADIC_PARAM = 30,            /* VARIADIC_PARAM  */
  YYSYMBOL_SELECTOR = 31,                  /* SELECTOR  */
  YYSYMBOL_EQUAL_EQUAL = 32,               /* EQUAL_EQUAL  */
  YYSYMBOL_NOT_EQUAL = 33,                 /* NOT_EQUAL  */
  YYSYMBOL_LESS_THAN = 34,                 /* LESS_THAN  */
  YYSYMBOL_LESS_THAN_OR_EQUAL = 35,        /* LESS_THAN_OR_EQUAL  */
  YYSYMBOL_GREATER_THAN = 36,              /* GREATER_THAN  */
  YYSYMBOL_GREATER_THAN_OR_EQUAL = 37,     /* GREATER_THAN_OR_EQUAL  */
  YYSYMBOL_LOGICAL_AND = 38,               /* LOGICAL_AND  */
  YYSYMBOL_LOGICAL_OR = 39,                /* LOGICAL_OR  */
  YYSYMBOL_LOGICAL_NOT = 40,               /* LOGICAL_NOT  */
  YYSYMBOL_IF = 41,                        /* IF  */
  YYSYMBOL_ELSE = 42,                      /* ELSE  */
  YYSYMBOL_WHILE = 43,                     /* WHILE  */
  YYSYMBOL_FOR = 44,                       /* FOR  */
  YYSYMBOL_SWITCH = 45,                    /* SWITCH  */
  YYSYMBOL_CASE = 46,                      /* CASE  */
  YYSYMBOL_DEFAULT = 47,                   /* DEFAULT  */
  YYSYMBOL_BREAK = 48,                     /* BREAK  */
  YYSYMBOL_CONTINUE = 49,                  /* CONTINUE  */
  YYSYMBOL_RETURN = 50,                    /* RETURN  */
  YYSYMBOL_VAR = 51,                       /* VAR  */
  YYSYMBOL_INT_TYPE = 52,                  /* INT_TYPE  */
  YYSYMBOL_BOOL_TYPE = 53,                 /* BOOL_TYPE  */
  YYSYMBOL_STRING_TYPE = 54,               /* STRING_TYPE  */
  YYSYMBOL_IMPORT = 55,                    /* IMPORT  */
  YYSYMBOL_FUNCTION = 56,                  /* FUNCTION  */
  YYSYMBOL_APPEND = 57,                    /* APPEND  */
  YYSYMBOL_LEN = 58,                       /* LEN  */
  YYSYMBOL_PRINT = 59,                     /* PRINT  */
  YYSYMBOL_PRINTLN = 60,                   /* PRINTLN  */
  YYSYMBOL_PACKAGE = 61,                   /* PACKAGE  */
  YYSYMBOL_CHAN = 62,                      /* CHAN  */
  YYSYMBOL_CONST = 63,                     /* CONST  */
  YYSYMBOL_DEFER = 64,                     /* DEFER  */
  YYSYMBOL_FALLTHROUGH = 65,               /* FALLTHROUGH  */
  YYSYMBOL_GO = 66,                        /* GO  */
  YYSYMBOL_GOTO = 67,                      /* GOTO  */
  YYSYMBOL_INTERFACE = 68,                 /* INTERFACE  */
  YYSYMBOL_MAP = 69,                       /* MAP  */
  YYSYMBOL_RANGE = 70,                     /* RANGE  */
  YYSYMBOL_SELECT = 71,                    /* SELECT  */
  YYSYMBOL_STRUCT = 72,                    /* STRUCT  */
  YYSYMBOL_TYPE = 73,                      /* TYPE  */
  YYSYMBOL_LPAREN = 74,                    /* LPAREN  */
  YYSYMBOL_RPAREN = 75,                    /* RPAREN  */
  YYSYMBOL_LBRACE = 76,                    /* LBRACE  */
  YYSYMBOL_RBRACE = 77,                    /* RBRACE  */
  YYSYMBOL_LSQPAREN = 78,                  /* LSQPAREN  */
  YYSYMBOL_RSQPAREN = 79,                  /* RSQPAREN  */
  YYSYMBOL_SEMICOLON = 80,                 /* SEMICOLON  */
  YYSYMBOL_COMMA = 81,                     /* COMMA  */
  YYSYMBOL_COLON = 82,                     /* COLON  */
  YYSYMBOL_BOOLEAN = 83,                   /* BOOLEAN  */
  YYSYMBOL_IDENTIFIER = 84,                /* IDENTIFIER  */
  YYSYMBOL_INTEGER = 85,                   /* INTEGER  */
  YYSYMBOL_STRING = 86,                    /* STRING  */
  YYSYMBOL_FLOAT = 87,                     /* FLOAT  */
  YYSYMBOL_COMMENT = 88,                   /* COMMENT  */
  YYSYMBOL_MULTI_LINE_COMMENT = 89,        /* MULTI_LINE_COMMENT  */
  YYSYMBOL_90_ = 90,                       /* '.'  */
  YYSYMBOL_91_ = 91,                       /* '['  */
  YYSYMBOL_92_ = 92,                       /* ']'  */
  YYSYMBOL_93_ = 93,                       /* ':'  */
  YYSYMBOL_YYACCEPT = 94,                  /* $accept  */
  YYSYMBOL_program = 95,                   /* program  */
  YYSYMBOL_PackageClause = 96,             /* PackageClause  */
  YYSYMBOL_PackageName = 97,               /* PackageName  */
  YYSYMBOL_ImportDecls = 98,               /* ImportDecls  */
  YYSYMBOL_ImportDecl = 99,                /* ImportDecl  */
  YYSYMBOL_ImportSpecs = 100,              /* ImportSpecs  */
  YYSYMBOL_ImportSpec = 101,               /* ImportSpec  */
  YYSYMBOL_ImportPath = 102,               /* ImportPath  */
  YYSYMBOL_var_declarations = 103,         /* var_declarations  */
  YYSYMBOL_declaration_list = 104,         /* declaration_list  */
  YYSYMBOL_declaration = 105,              /* declaration  */
  YYSYMBOL_identifier_list = 106,          /* identifier_list  */
  YYSYMBOL_type_declarations = 107,        /* type_declarations  */
  YYSYMBOL_type_declaration = 108,         /* type_declaration  */
  YYSYMBOL_function_declaration = 109,     /* function_declaration  */
  YYSYMBOL_signature = 110,                /* signature  */
  YYSYMBOL_parameters = 111,               /* parameters  */
  YYSYMBOL_parameter_unit = 112,           /* parameter_unit  */
  YYSYMBOL_bracket = 113,                  /* bracket  */
  YYSYMBOL_bracket_list = 114,             /* bracket_list  */
  YYSYMBOL_expression_list = 115,          /* expression_list  */
  YYSYMBOL_expression = 116,               /* expression  */
  YYSYMBOL_primary_expression = 117,       /* primary_expression  */
  YYSYMBOL_literal = 118,                  /* literal  */
  YYSYMBOL_binary_op = 119,                /* binary_op  */
  YYSYMBOL_builtin = 120,                  /* builtin  */
  YYSYMBOL_statement = 121,                /* statement  */
  YYSYMBOL_declaration_stmt = 122,         /* declaration_stmt  */
  YYSYMBOL_simple_stmt = 123,              /* simple_stmt  */
  YYSYMBOL_inc_dec_stmt = 124,             /* inc_dec_stmt  */
  YYSYMBOL_assignment = 125,               /* assignment  */
  YYSYMBOL_assign_op = 126,                /* assign_op  */
  YYSYMBOL_add_op_eq = 127,                /* add_op_eq  */
  YYSYMBOL_mul_op_eq = 128,                /* mul_op_eq  */
  YYSYMBOL_short_variable_declaration = 129, /* short_variable_declaration  */
  YYSYMBOL_return_stmt = 130,              /* return_stmt  */
  YYSYMBOL_break_stmt = 131,               /* break_stmt  */
  YYSYMBOL_continue_stmt = 132,            /* continue_stmt  */
  YYSYMBOL_block_stmt = 133,               /* block_stmt  */
  YYSYMBOL_if_stmt = 134,                  /* if_stmt  */
  YYSYMBOL_switch_stmt = 135,              /* switch_stmt  */
  YYSYMBOL_expression_switch_stmt = 136,   /* expression_switch_stmt  */
  YYSYMBOL_switch_on = 137,                /* switch_on  */
  YYSYMBOL_expression_case_clause = 138,   /* expression_case_clause  */
  YYSYMBOL_expression_case_clause_list = 139, /* expression_case_clause_list  */
  YYSYMBOL_for_stmt = 140,                 /* for_stmt  */
  YYSYMBOL_for_clause = 141,               /* for_clause  */
  YYSYMBOL_print_stmt = 142,               /* print_stmt  */
  YYSYMBOL_println_stmt = 143              /* println_stmt  */
};
typedef enum yysymbol_kind_t yysymbol_kind_t;




#ifdef short
# undef short
#endif

/* On compilers that do not define __PTRDIFF_MAX__ etc., make sure
   <limits.h> and (if available) <stdint.h> are included
   so that the code can choose integer types of a good width.  */

#ifndef __PTRDIFF_MAX__
# include <limits.h> /* INFRINGES ON USER NAME SPACE */
# if defined __STDC_VERSION__ && 199901 <= __STDC_VERSION__
#  include <stdint.h> /* INFRINGES ON USER NAME SPACE */
#  define YY_STDINT_H
# endif
#endif

/* Narrow types that promote to a signed type and that can represent a
   signed or unsigned integer of at least N bits.  In tables they can
   save space and decrease cache pressure.  Promoting to a signed type
   helps avoid bugs in integer arithmetic.  */

#ifdef __INT_LEAST8_MAX__
typedef __INT_LEAST8_TYPE__ yytype_int8;
#elif defined YY_STDINT_H
typedef int_least8_t yytype_int8;
#else
typedef signed char yytype_int8;
#endif

#ifdef __INT_LEAST16_MAX__
typedef __INT_LEAST16_TYPE__ yytype_int16;
#elif defined YY_STDINT_H
typedef int_least16_t yytype_int16;
#else
typedef short yytype_int16;
#endif

/* Work around bug in HP-UX 11.23, which defines these macros
   incorrectly for preprocessor constants.  This workaround can likely
   be removed in 2023, as HPE has promised support for HP-UX 11.23
   (aka HP-UX 11i v2) only through the end of 2022; see Table 2 of
   <https://h20195.www2.hpe.com/V2/getpdf.aspx/4AA4-7673ENW.pdf>.  */
#ifdef __hpux
# undef UINT_LEAST8_MAX
# undef UINT_LEAST16_MAX
# define UINT_LEAST8_MAX 255
# define UINT_LEAST16_MAX 65535
#endif

#if defined __UINT_LEAST8_MAX__ && __UINT_LEAST8_MAX__ <= __INT_MAX__
typedef __UINT_LEAST8_TYPE__ yytype_uint8;
#elif (!defined __UINT_LEAST8_MAX__ && defined YY_STDINT_H \
       && UINT_LEAST8_MAX <= INT_MAX)
typedef uint_least8_t yytype_uint8;
#elif !defined __UINT_LEAST8_MAX__ && UCHAR_MAX <= INT_MAX
typedef unsigned char yytype_uint8;
#else
typedef short yytype_uint8;
#endif

#if defined __UINT_LEAST16_MAX__ && __UINT_LEAST16_MAX__ <= __INT_MAX__
typedef __UINT_LEAST16_TYPE__ yytype_uint16;
#elif (!defined __UINT_LEAST16_MAX__ && defined YY_STDINT_H \
       && UINT_LEAST16_MAX <= INT_MAX)
typedef uint_least16_t yytype_uint16;
#elif !defined __UINT_LEAST16_MAX__ && USHRT_MAX <= INT_MAX
typedef unsigned short yytype_uint16;
#else
typedef int yytype_uint16;
#endif

#ifndef YYPTRDIFF_T
# if defined __PTRDIFF_TYPE__ && defined __PTRDIFF_MAX__
#  define YYPTRDIFF_T __PTRDIFF_TYPE__
#  define YYPTRDIFF_MAXIMUM __PTRDIFF_MAX__
# elif defined PTRDIFF_MAX
#  ifndef ptrdiff_t
#   include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  endif
#  define YYPTRDIFF_T ptrdiff_t
#  define YYPTRDIFF_MAXIMUM PTRDIFF_MAX
# else
#  define YYPTRDIFF_T long
#  define YYPTRDIFF_MAXIMUM LONG_MAX
# endif
#endif

#ifndef YYSIZE_T
# ifdef __SIZE_TYPE__
#  define YYSIZE_T __SIZE_TYPE__
# elif defined size_t
#  define YYSIZE_T size_t
# elif defined __STDC_VERSION__ && 199901 <= __STDC_VERSION__
#  include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  define YYSIZE_T size_t
# else
#  define YYSIZE_T unsigned
# endif
#endif

#define YYSIZE_MAXIMUM                                  \
  YY_CAST (YYPTRDIFF_T,                                 \
           (YYPTRDIFF_MAXIMUM < YY_CAST (YYSIZE_T, -1)  \
            ? YYPTRDIFF_MAXIMUM                         \
            : YY_CAST (YYSIZE_T, -1)))

#define YYSIZEOF(X) YY_CAST (YYPTRDIFF_T, sizeof (X))


/* Stored state numbers (used for stacks). */
typedef yytype_int16 yy_state_t;

/* State numbers in computations.  */
typedef int yy_state_fast_t;

#ifndef YY_
# if defined YYENABLE_NLS && YYENABLE_NLS
#  if ENABLE_NLS
#   include <libintl.h> /* INFRINGES ON USER NAME SPACE */
#   define YY_(Msgid) dgettext ("bison-runtime", Msgid)
#  endif
# endif
# ifndef YY_
#  define YY_(Msgid) Msgid
# endif
#endif


#ifndef YY_ATTRIBUTE_PURE
# if defined __GNUC__ && 2 < __GNUC__ + (96 <= __GNUC_MINOR__)
#  define YY_ATTRIBUTE_PURE __attribute__ ((__pure__))
# else
#  define YY_ATTRIBUTE_PURE
# endif
#endif

#ifndef YY_ATTRIBUTE_UNUSED
# if defined __GNUC__ && 2 < __GNUC__ + (7 <= __GNUC_MINOR__)
#  define YY_ATTRIBUTE_UNUSED __attribute__ ((__unused__))
# else
#  define YY_ATTRIBUTE_UNUSED
# endif
#endif

/* Suppress unused-variable warnings by "using" E.  */
#if ! defined lint || defined __GNUC__
# define YY_USE(E) ((void) (E))
#else
# define YY_USE(E) /* empty */
#endif

/* Suppress an incorrect diagnostic about yylval being uninitialized.  */
#if defined __GNUC__ && ! defined __ICC && 406 <= __GNUC__ * 100 + __GNUC_MINOR__
# if __GNUC__ * 100 + __GNUC_MINOR__ < 407
#  define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN                           \
    _Pragma ("GCC diagnostic push")                                     \
    _Pragma ("GCC diagnostic ignored \"-Wuninitialized\"")
# else
#  define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN                           \
    _Pragma ("GCC diagnostic push")                                     \
    _Pragma ("GCC diagnostic ignored \"-Wuninitialized\"")              \
    _Pragma ("GCC diagnostic ignored \"-Wmaybe-uninitialized\"")
# endif
# define YY_IGNORE_MAYBE_UNINITIALIZED_END      \
    _Pragma ("GCC diagnostic pop")
#else
# define YY_INITIAL_VALUE(Value) Value
#endif
#ifndef YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
# define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
# define YY_IGNORE_MAYBE_UNINITIALIZED_END
#endif
#ifndef YY_INITIAL_VALUE
# define YY_INITIAL_VALUE(Value) /* Nothing. */
#endif

#if defined __cplusplus && defined __GNUC__ && ! defined __ICC && 6 <= __GNUC__
# define YY_IGNORE_USELESS_CAST_BEGIN                          \
    _Pragma ("GCC diagnostic push")                            \
    _Pragma ("GCC diagnostic ignored \"-Wuseless-cast\"")
# define YY_IGNORE_USELESS_CAST_END            \
    _Pragma ("GCC diagnostic pop")
#endif
#ifndef YY_IGNORE_USELESS_CAST_BEGIN
# define YY_IGNORE_USELESS_CAST_BEGIN
# define YY_IGNORE_USELESS_CAST_END
#endif


#define YY_ASSERT(E) ((void) (0 && (E)))

#if 1

/* The parser invokes alloca or malloc; define the necessary symbols.  */

# ifdef YYSTACK_USE_ALLOCA
#  if YYSTACK_USE_ALLOCA
#   ifdef __GNUC__
#    define YYSTACK_ALLOC __builtin_alloca
#   elif defined __BUILTIN_VA_ARG_INCR
#    include <alloca.h> /* INFRINGES ON USER NAME SPACE */
#   elif defined _AIX
#    define YYSTACK_ALLOC __alloca
#   elif defined _MSC_VER
#    include <malloc.h> /* INFRINGES ON USER NAME SPACE */
#    define alloca _alloca
#   else
#    define YYSTACK_ALLOC alloca
#    if ! defined _ALLOCA_H && ! defined EXIT_SUCCESS
#     include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
      /* Use EXIT_SUCCESS as a witness for stdlib.h.  */
#     ifndef EXIT_SUCCESS
#      define EXIT_SUCCESS 0
#     endif
#    endif
#   endif
#  endif
# endif

# ifdef YYSTACK_ALLOC
   /* Pacify GCC's 'empty if-body' warning.  */
#  define YYSTACK_FREE(Ptr) do { /* empty */; } while (0)
#  ifndef YYSTACK_ALLOC_MAXIMUM
    /* The OS might guarantee only one guard page at the bottom of the stack,
       and a page size can be as small as 4096 bytes.  So we cannot safely
       invoke alloca (N) if N exceeds 4096.  Use a slightly smaller number
       to allow for a few compiler-allocated temporary stack slots.  */
#   define YYSTACK_ALLOC_MAXIMUM 4032 /* reasonable circa 2006 */
#  endif
# else
#  define YYSTACK_ALLOC YYMALLOC
#  define YYSTACK_FREE YYFREE
#  ifndef YYSTACK_ALLOC_MAXIMUM
#   define YYSTACK_ALLOC_MAXIMUM YYSIZE_MAXIMUM
#  endif
#  if (defined __cplusplus && ! defined EXIT_SUCCESS \
       && ! ((defined YYMALLOC || defined malloc) \
             && (defined YYFREE || defined free)))
#   include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#   ifndef EXIT_SUCCESS
#    define EXIT_SUCCESS 0
#   endif
#  endif
#  ifndef YYMALLOC
#   define YYMALLOC malloc
#   if ! defined malloc && ! defined EXIT_SUCCESS
void *malloc (YYSIZE_T); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
#  ifndef YYFREE
#   define YYFREE free
#   if ! defined free && ! defined EXIT_SUCCESS
void free (void *); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
# endif
#endif /* 1 */

#if (! defined yyoverflow \
     && (! defined __cplusplus \
         || (defined YYSTYPE_IS_TRIVIAL && YYSTYPE_IS_TRIVIAL)))

/* A type that is properly aligned for any stack member.  */
union yyalloc
{
  yy_state_t yyss_alloc;
  YYSTYPE yyvs_alloc;
};

/* The size of the maximum gap between one aligned stack and the next.  */
# define YYSTACK_GAP_MAXIMUM (YYSIZEOF (union yyalloc) - 1)

/* The size of an array large to enough to hold all stacks, each with
   N elements.  */
# define YYSTACK_BYTES(N) \
     ((N) * (YYSIZEOF (yy_state_t) + YYSIZEOF (YYSTYPE)) \
      + YYSTACK_GAP_MAXIMUM)

# define YYCOPY_NEEDED 1

/* Relocate STACK from its old location to the new one.  The
   local variables YYSIZE and YYSTACKSIZE give the old and new number of
   elements in the stack, and YYPTR gives the new location of the
   stack.  Advance YYPTR to a properly aligned location for the next
   stack.  */
# define YYSTACK_RELOCATE(Stack_alloc, Stack)                           \
    do                                                                  \
      {                                                                 \
        YYPTRDIFF_T yynewbytes;                                         \
        YYCOPY (&yyptr->Stack_alloc, Stack, yysize);                    \
        Stack = &yyptr->Stack_alloc;                                    \
        yynewbytes = yystacksize * YYSIZEOF (*Stack) + YYSTACK_GAP_MAXIMUM; \
        yyptr += yynewbytes / YYSIZEOF (*yyptr);                        \
      }                                                                 \
    while (0)

#endif

#if defined YYCOPY_NEEDED && YYCOPY_NEEDED
/* Copy COUNT objects from SRC to DST.  The source and destination do
   not overlap.  */
# ifndef YYCOPY
#  if defined __GNUC__ && 1 < __GNUC__
#   define YYCOPY(Dst, Src, Count) \
      __builtin_memcpy (Dst, Src, YY_CAST (YYSIZE_T, (Count)) * sizeof (*(Src)))
#  else
#   define YYCOPY(Dst, Src, Count)              \
      do                                        \
        {                                       \
          YYPTRDIFF_T yyi;                      \
          for (yyi = 0; yyi < (Count); yyi++)   \
            (Dst)[yyi] = (Src)[yyi];            \
        }                                       \
      while (0)
#  endif
# endif
#endif /* !YYCOPY_NEEDED */

/* YYFINAL -- State number of the termination state.  */
#define YYFINAL  6
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   756

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  94
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  50
/* YYNRULES -- Number of rules.  */
#define YYNRULES  151
/* YYNSTATES -- Number of states.  */
#define YYNSTATES  263

/* YYMAXUTOK -- Last valid token kind.  */
#define YYMAXUTOK   344


/* YYTRANSLATE(TOKEN-NUM) -- Symbol number corresponding to TOKEN-NUM
   as returned by yylex, with out-of-bounds checking.  */
#define YYTRANSLATE(YYX)                                \
  (0 <= (YYX) && (YYX) <= YYMAXUTOK                     \
   ? YY_CAST (yysymbol_kind_t, yytranslate[YYX])        \
   : YYSYMBOL_YYUNDEF)

/* YYTRANSLATE[TOKEN-NUM] -- Symbol number corresponding to TOKEN-NUM
   as returned by yylex.  */
static const yytype_int8 yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,    90,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,    93,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,    91,     2,    92,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     1,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
      25,    26,    27,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    51,    52,    53,    54,
      55,    56,    57,    58,    59,    60,    61,    62,    63,    64,
      65,    66,    67,    68,    69,    70,    71,    72,    73,    74,
      75,    76,    77,    78,    79,    80,    81,    82,    83,    84,
      85,    86,    87,    88,    89
};

#if YYDEBUG
/* YYRLINE[YYN] -- Source line where rule number YYN was defined.  */
static const yytype_int16 yyrline[] =
{
       0,    24,    24,    27,    30,    33,    34,    37,    38,    41,
      42,    46,    47,    48,    51,    55,    59,    60,    63,    66,
      67,    68,    69,    70,    76,    77,    80,    84,    85,    86,
      87,    88,    95,    98,    99,   109,   110,   113,   114,   115,
     118,   119,   122,   123,   128,   129,   132,   133,   134,   137,
     138,   139,   140,   141,   142,   143,   146,   147,   148,   149,
     152,   153,   154,   155,   156,   157,   158,   159,   160,   161,
     162,   163,   164,   165,   166,   167,   168,   169,   170,   173,
     174,   177,   178,   179,   180,   181,   182,   183,   184,   185,
     186,   187,   188,   189,   192,   193,   196,   198,   199,   200,
     206,   207,   212,   213,   216,   217,   220,   221,   222,   223,
     226,   227,   228,   229,   230,   231,   232,   235,   238,   239,
     242,   245,   248,   249,   256,   257,   258,   259,   260,   261,
     264,   267,   270,   271,   272,   273,   276,   277,   278,   279,
     280,   285,   286,   289,   290,   291,   294,   295,   298,   299,
     301,   302
};
#endif

/** Accessing symbol of state STATE.  */
#define YY_ACCESSING_SYMBOL(State) YY_CAST (yysymbol_kind_t, yystos[State])

#if 1
/* The user-facing name of the symbol whose (internal) number is
   YYSYMBOL.  No bounds checking.  */
static const char *yysymbol_name (yysymbol_kind_t yysymbol) YY_ATTRIBUTE_UNUSED;

/* YYTNAME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals.  */
static const char *const yytname[] =
{
  "\"end of file\"", "error", "\"invalid token\"", "PLUS", "MINUS",
  "TIMES", "DIVIDE", "ASSIGN", "MODULO", "BITWISE_AND", "BITWISE_OR",
  "BITWISE_XOR", "BIT_CLEAR", "LEFT_SHIFT", "RIGHT_SHIFT", "ADD_ASSIGN",
  "SUB_ASSIGN", "MUL_ASSIGN", "DIV_ASSIGN", "MOD_ASSIGN", "AND_ASSIGN",
  "OR_ASSIGN", "XOR_ASSIGN", "LEFT_SHIFT_ASSIGN", "RIGHT_SHIFT_ASSIGN",
  "INCREMENT", "DECREMENT", "RECEIVE", "CLEAR_ASSIGN", "SHORT_VAR",
  "VARIADIC_PARAM", "SELECTOR", "EQUAL_EQUAL", "NOT_EQUAL", "LESS_THAN",
  "LESS_THAN_OR_EQUAL", "GREATER_THAN", "GREATER_THAN_OR_EQUAL",
  "LOGICAL_AND", "LOGICAL_OR", "LOGICAL_NOT", "IF", "ELSE", "WHILE", "FOR",
  "SWITCH", "CASE", "DEFAULT", "BREAK", "CONTINUE", "RETURN", "VAR",
  "INT_TYPE", "BOOL_TYPE", "STRING_TYPE", "IMPORT", "FUNCTION", "APPEND",
  "LEN", "PRINT", "PRINTLN", "PACKAGE", "CHAN", "CONST", "DEFER",
  "FALLTHROUGH", "GO", "GOTO", "INTERFACE", "MAP", "RANGE", "SELECT",
  "STRUCT", "TYPE", "LPAREN", "RPAREN", "LBRACE", "RBRACE", "LSQPAREN",
  "RSQPAREN", "SEMICOLON", "COMMA", "COLON", "BOOLEAN", "IDENTIFIER",
  "INTEGER", "STRING", "FLOAT", "COMMENT", "MULTI_LINE_COMMENT", "'.'",
  "'['", "']'", "':'", "$accept", "program", "PackageClause",
  "PackageName", "ImportDecls", "ImportDecl", "ImportSpecs", "ImportSpec",
  "ImportPath", "var_declarations", "declaration_list", "declaration",
  "identifier_list", "type_declarations", "type_declaration",
  "function_declaration", "signature", "parameters", "parameter_unit",
  "bracket", "bracket_list", "expression_list", "expression",
  "primary_expression", "literal", "binary_op", "builtin", "statement",
  "declaration_stmt", "simple_stmt", "inc_dec_stmt", "assignment",
  "assign_op", "add_op_eq", "mul_op_eq", "short_variable_declaration",
  "return_stmt", "break_stmt", "continue_stmt", "block_stmt", "if_stmt",
  "switch_stmt", "expression_switch_stmt", "switch_on",
  "expression_case_clause", "expression_case_clause_list", "for_stmt",
  "for_clause", "print_stmt", "println_stmt", YY_NULLPTR
};

static const char *
yysymbol_name (yysymbol_kind_t yysymbol)
{
  return yytname[yysymbol];
}
#endif

#define YYPACT_NINF (-191)

#define yypact_value_is_default(Yyn) \
  ((Yyn) == YYPACT_NINF)

#define YYTABLE_NINF (-136)

#define yytable_value_is_error(Yyn) \
  0

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
static const yytype_int16 yypact[] =
{
     -48,   -66,    45,  -191,  -191,  -191,  -191,    31,   -14,   -32,
    -191,  -191,  -191,    -7,    15,   -33,  -191,     5,     5,  -191,
    -191,     1,    19,  -191,  -191,  -191,  -191,    20,   -10,    25,
      21,   611,  -191,    33,    35,  -191,   -77,    29,    37,  -191,
      33,   125,   -18,   125,  -191,  -191,   125,    38,    49,    50,
      51,    52,    43,   125,  -191,  -191,  -191,  -191,  -191,  -191,
     659,  -191,  -191,    12,   436,   -28,  -191,  -191,  -191,    26,
     659,   659,  -191,  -191,  -191,   659,   659,   659,   659,   659,
     659,  -191,   659,   659,   659,  -191,    66,    58,  -191,  -191,
    -191,  -191,   251,   125,   251,    63,  -191,    19,   325,   125,
      75,   717,   -45,  -191,   145,   125,   125,    71,    91,   -13,
    -191,   548,  -191,   125,   125,   125,   125,   125,   125,   125,
     125,   125,   125,   125,   125,   125,  -191,  -191,  -191,  -191,
    -191,  -191,  -191,  -191,  -191,  -191,  -191,  -191,  -191,   125,
     125,   125,   125,   125,   125,   125,   125,   125,   125,  -191,
    -191,   224,    69,   125,  -191,  -191,  -191,  -191,  -191,  -191,
    -191,  -191,  -191,  -191,  -191,  -191,  -191,  -191,   117,   536,
    -191,   125,  -191,   717,  -191,   153,   154,   125,   486,   592,
    -191,    92,   498,  -191,    94,    95,    86,  -191,   -70,  -191,
    -191,  -191,   717,   717,   717,   717,   717,   717,   717,   717,
     717,   717,   717,   717,   717,   717,   717,   717,   717,   717,
     717,  -191,   717,  -191,    97,  -191,   214,   -38,   131,   399,
    -191,   -42,   125,   125,  -191,   125,  -191,  -191,  -191,    38,
     104,   105,  -191,  -191,  -191,  -191,  -191,   -38,   125,   125,
      93,  -191,  -191,  -191,  -191,   605,   107,    38,  -191,    38,
    -191,  -191,  -191,    96,   659,  -191,  -191,  -191,   108,   659,
    -191,  -191,  -191
};

/* YYDEFACT[STATE-NUM] -- Default reduction number in state STATE-NUM.
   Performed when YYTABLE does not specify something else to do.  Zero
   means the default is an error.  */
static const yytype_uint8 yydefact[] =
{
       0,     0,     0,     6,     4,     3,     1,     0,    10,     0,
       5,     2,    10,     7,     0,     0,    14,     0,     0,     9,
      13,     0,     0,     8,    11,    12,    34,    24,     0,     0,
      35,     0,    32,     0,     0,    37,     0,    42,     0,    33,
       0,     0,    96,    96,   120,   121,   118,     0,     0,     0,
       0,     0,     0,     0,   123,    59,    49,    56,    57,    58,
      93,    94,    95,     0,    44,    46,    50,    47,    48,     0,
      93,    93,    97,    98,    99,    93,    93,    93,    93,    93,
      93,   130,    93,    93,    93,    25,     0,     0,    41,    43,
      39,    36,    44,     0,    44,     0,   143,     0,    44,   134,
       0,   119,    24,    15,    18,     0,     0,     0,     0,     0,
      26,     0,    92,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   106,   107,   110,   111,
     112,   115,   108,   109,   113,   114,   100,   101,   116,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   104,
     105,     0,     0,     0,   122,    81,    82,    83,    84,    85,
      86,    87,    88,    89,    90,    91,    38,    40,   124,     0,
     144,    96,   145,   133,   141,    21,    23,     0,     0,     0,
     149,     0,    44,   151,     0,     0,     0,    27,     0,    51,
     102,   117,    68,    69,    72,    73,    74,    77,    70,    71,
      78,    76,    75,    62,    63,    66,    64,    67,    65,    61,
      60,    45,   103,    53,     0,    54,     0,     0,   125,    44,
     146,     0,     0,     0,    19,     0,    80,   148,   150,    16,
       0,     0,    30,    52,    55,   129,   128,     0,    96,     0,
     140,   131,   142,    20,    22,     0,     0,    16,    28,    16,
     127,   126,   147,     0,    93,    79,    29,    17,     0,    93,
     138,    31,   136
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
    -191,  -191,  -191,   186,  -191,  -191,   176,  -191,    76,  -191,
    -167,   143,    10,  -191,  -191,  -191,  -191,   151,  -191,  -191,
     -36,   -59,    -9,  -191,  -191,  -191,  -191,   -54,  -191,   -31,
    -191,  -191,  -191,  -191,  -191,  -191,  -191,  -191,  -191,   -22,
    -190,  -191,  -191,  -191,  -191,  -191,  -191,  -191,  -191,  -191
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_uint8 yydefgoto[] =
{
       0,     2,     3,    18,     7,    10,    13,    19,    20,    61,
     246,   247,   104,    62,   110,    11,    22,    29,    30,    37,
      38,    63,    64,    65,    66,    67,    68,    69,    70,    71,
      72,    73,   148,   149,   150,    74,    75,    76,    77,    78,
      79,    80,    81,   100,   242,   221,    82,    97,    83,    84
};

/* YYTABLE[YYPACT[STATE-NUM]] -- What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule whose
   number is the opposite.  If YYTABLE_NINF, syntax error.  */
static const yytype_int16 yytable[] =
{
      32,    89,   231,    41,   239,   240,   112,   175,    87,   176,
      93,    95,    99,     1,   232,    88,   155,   156,     4,   113,
      96,   157,   158,   159,   160,   161,   162,   236,   163,   164,
     165,    28,    92,    94,    98,   241,    33,   101,    31,    48,
      49,   114,    23,    85,   111,     6,   151,   251,   181,   184,
      28,     4,    14,    16,   190,   191,    53,    17,    31,   185,
      12,   186,   152,   153,    34,    55,    56,    57,    58,    59,
     168,   187,   170,   188,    35,   172,    26,     4,    36,    16,
     257,    36,   258,    17,   169,    27,     8,     9,   211,    21,
     173,    16,   214,    24,    25,    31,   178,   179,   182,   182,
      39,    33,    40,   154,   182,   182,   192,   193,   194,   195,
     196,   197,   198,   199,   200,   201,   202,    27,   224,    86,
      36,    90,   102,   105,   106,   107,   108,   109,    48,    49,
     203,   204,   205,   206,   207,   208,   209,   210,   182,   212,
     220,   166,   182,   171,   216,    53,   180,   218,    48,    49,
     167,   174,   177,   215,    55,    56,    57,    58,    59,   217,
     222,   223,   219,   243,   244,    53,   183,   227,   182,   228,
     230,   229,   233,   237,    55,    56,    57,    58,    59,   248,
     253,   249,    48,    49,   256,   261,   254,     5,    15,   259,
     103,    91,     0,     0,     0,   235,     0,     0,     0,    53,
     260,     0,     0,     0,     0,   262,     0,   252,    55,    56,
      57,    58,    59,   182,   182,   250,   245,   115,   116,   117,
     118,     0,   119,   120,   121,   122,   123,   124,   125,     0,
     182,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   139,   140,   141,   142,
     143,   144,   145,   146,   115,   116,   117,   118,     0,   119,
     120,   121,   122,   123,   124,   125,   126,   127,   128,   129,
     130,   131,   132,   133,   134,   135,   136,   137,     0,   138,
       0,    48,    49,   139,   140,   141,   142,   143,   144,   145,
     146,     0,     0,     0,     0,     0,     0,     0,    53,   213,
       0,     0,     0,     0,     0,     0,   234,    55,    56,    57,
      58,    59,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    31,   115,   116,
     117,   118,   147,   119,   120,   121,   122,   123,   124,   125,
     126,   127,   128,   129,   130,   131,   132,   133,   134,   135,
     136,   137,     0,   138,     0,     0,     0,   139,   140,   141,
     142,   143,   144,   145,   146,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,  -135,   115,   116,   117,   118,   147,   119,   120,   121,
     122,   123,   124,   125,   126,   127,   128,   129,   130,   131,
     132,   133,   134,   135,   136,   137,     0,   138,     0,     0,
       0,   139,   140,   141,   142,   143,   144,   145,   146,   115,
     116,   117,   118,     0,   119,   120,   121,   122,   123,   124,
     125,   126,   127,   128,   129,   130,   131,   132,   133,   134,
     135,   136,   137,     0,   138,     0,     0,     0,   139,   140,
     141,   142,   143,   144,   145,   146,     0,     0,     0,   238,
     147,     0,     0,     0,     0,     0,     0,     0,     0,   115,
     116,   117,   118,     0,   119,   120,   121,   122,   123,   124,
     125,   115,   116,   117,   118,     0,   119,   120,   121,   122,
     123,   124,   125,     0,     0,     0,     0,   147,   139,   140,
     141,   142,   143,   144,   145,   146,     0,     0,     0,     0,
     139,   140,   141,   142,   143,   144,   145,   146,     0,   115,
     116,   117,   118,     0,   119,   120,   121,   122,   123,   124,
     125,   115,   116,   117,   118,     0,   119,   120,   121,   122,
     123,   124,   125,     0,     0,     0,     0,   225,   139,   140,
     141,   142,   143,   144,   145,   146,     0,     0,     0,   147,
     139,   140,   141,   142,   143,   144,   145,   146,     0,     0,
       0,     0,     0,     0,     0,   115,   116,   117,   118,     0,
     119,   120,   121,   122,   123,   124,   125,     0,   115,   116,
     117,   118,    31,   119,   120,   121,   122,   123,   124,   125,
       0,     0,     0,   189,   139,   140,   141,   142,   143,   144,
     145,   146,     0,     0,     0,     0,     0,   139,   140,   141,
     142,   143,   144,   145,   146,     0,     0,     0,     0,     0,
       0,     0,    41,     0,     0,    42,    43,     0,     0,    44,
      45,    46,    47,     0,     0,     0,     0,   226,    48,    49,
      50,    51,     0,     0,     0,     0,     0,     0,     0,     0,
     255,     0,     0,     0,    52,    53,     0,    31,    54,     0,
       0,     0,     0,     0,    55,    56,    57,    58,    59,    60,
      41,     0,     0,    42,    43,     0,     0,    44,    45,    46,
      47,     0,     0,     0,     0,     0,    48,    49,    50,    51,
     115,   116,   117,   118,     0,   119,   120,   121,   122,   123,
     124,   125,    52,    53,     0,    31,     0,     0,     0,     0,
       0,     0,    55,    56,    57,    58,    59,    60,     0,   139,
     140,   141,   142,   143,   144,   145,   146
};

static const yytype_int16 yycheck[] =
{
      22,    37,    72,    41,    46,    47,    60,    52,    85,    54,
      41,    42,    43,    61,    84,    92,    70,    71,    84,     7,
      42,    75,    76,    77,    78,    79,    80,   217,    82,    83,
      84,    21,    41,    42,    43,    77,    81,    46,    76,    57,
      58,    29,    75,    33,    53,     0,    74,   237,   107,   108,
      40,    84,    84,    86,   113,   114,    74,    90,    76,    72,
      74,    74,    90,    91,    74,    83,    84,    85,    86,    87,
      92,    84,    94,   109,    84,    97,    75,    84,    91,    86,
     247,    91,   249,    90,    93,    84,    55,    56,   147,    74,
      99,    86,   151,    17,    18,    76,   105,   106,   107,   108,
      75,    81,    81,    77,   113,   114,   115,   116,   117,   118,
     119,   120,   121,   122,   123,   124,   125,    84,   177,    84,
      91,    84,    84,    74,    74,    74,    74,    84,    57,    58,
     139,   140,   141,   142,   143,   144,   145,   146,   147,   148,
     171,    75,   151,    80,   153,    74,    75,   169,    57,    58,
      92,    76,     7,    84,    83,    84,    85,    86,    87,    42,
       7,     7,   171,   222,   223,    74,    75,    75,   177,    75,
      84,    76,    75,    42,    83,    84,    85,    86,    87,    75,
     239,    76,    57,    58,    77,    77,    93,     1,    12,    93,
      47,    40,    -1,    -1,    -1,   217,    -1,    -1,    -1,    74,
     254,    -1,    -1,    -1,    -1,   259,    -1,   238,    83,    84,
      85,    86,    87,   222,   223,   237,   225,     3,     4,     5,
       6,    -1,     8,     9,    10,    11,    12,    13,    14,    -1,
     239,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    32,    33,    34,    35,
      36,    37,    38,    39,     3,     4,     5,     6,    -1,     8,
       9,    10,    11,    12,    13,    14,    15,    16,    17,    18,
      19,    20,    21,    22,    23,    24,    25,    26,    -1,    28,
      -1,    57,    58,    32,    33,    34,    35,    36,    37,    38,
      39,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,    75,
      -1,    -1,    -1,    -1,    -1,    -1,    92,    83,    84,    85,
      86,    87,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    76,     3,     4,
       5,     6,    81,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
      25,    26,    -1,    28,    -1,    -1,    -1,    32,    33,    34,
      35,    36,    37,    38,    39,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    76,     3,     4,     5,     6,    81,     8,     9,    10,
      11,    12,    13,    14,    15,    16,    17,    18,    19,    20,
      21,    22,    23,    24,    25,    26,    -1,    28,    -1,    -1,
      -1,    32,    33,    34,    35,    36,    37,    38,    39,     3,
       4,     5,     6,    -1,     8,     9,    10,    11,    12,    13,
      14,    15,    16,    17,    18,    19,    20,    21,    22,    23,
      24,    25,    26,    -1,    28,    -1,    -1,    -1,    32,    33,
      34,    35,    36,    37,    38,    39,    -1,    -1,    -1,    80,
      81,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,     3,
       4,     5,     6,    -1,     8,     9,    10,    11,    12,    13,
      14,     3,     4,     5,     6,    -1,     8,     9,    10,    11,
      12,    13,    14,    -1,    -1,    -1,    -1,    81,    32,    33,
      34,    35,    36,    37,    38,    39,    -1,    -1,    -1,    -1,
      32,    33,    34,    35,    36,    37,    38,    39,    -1,     3,
       4,     5,     6,    -1,     8,     9,    10,    11,    12,    13,
      14,     3,     4,     5,     6,    -1,     8,     9,    10,    11,
      12,    13,    14,    -1,    -1,    -1,    -1,    81,    32,    33,
      34,    35,    36,    37,    38,    39,    -1,    -1,    -1,    81,
      32,    33,    34,    35,    36,    37,    38,    39,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,     3,     4,     5,     6,    -1,
       8,     9,    10,    11,    12,    13,    14,    -1,     3,     4,
       5,     6,    76,     8,     9,    10,    11,    12,    13,    14,
      -1,    -1,    -1,    75,    32,    33,    34,    35,    36,    37,
      38,    39,    -1,    -1,    -1,    -1,    -1,    32,    33,    34,
      35,    36,    37,    38,    39,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    41,    -1,    -1,    44,    45,    -1,    -1,    48,
      49,    50,    51,    -1,    -1,    -1,    -1,    75,    57,    58,
      59,    60,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      75,    -1,    -1,    -1,    73,    74,    -1,    76,    77,    -1,
      -1,    -1,    -1,    -1,    83,    84,    85,    86,    87,    88,
      41,    -1,    -1,    44,    45,    -1,    -1,    48,    49,    50,
      51,    -1,    -1,    -1,    -1,    -1,    57,    58,    59,    60,
       3,     4,     5,     6,    -1,     8,     9,    10,    11,    12,
      13,    14,    73,    74,    -1,    76,    -1,    -1,    -1,    -1,
      -1,    -1,    83,    84,    85,    86,    87,    88,    -1,    32,
      33,    34,    35,    36,    37,    38,    39
};

/* YYSTOS[STATE-NUM] -- The symbol kind of the accessing symbol of
   state STATE-NUM.  */
static const yytype_uint8 yystos[] =
{
       0,    61,    95,    96,    84,    97,     0,    98,    55,    56,
      99,   109,    74,   100,    84,   100,    86,    90,    97,   101,
     102,    74,   110,    75,   102,   102,    75,    84,   106,   111,
     112,    76,   133,    81,    74,    84,    91,   113,   114,    75,
      81,    41,    44,    45,    48,    49,    50,    51,    57,    58,
      59,    60,    73,    74,    77,    83,    84,    85,    86,    87,
      88,   103,   107,   115,   116,   117,   118,   119,   120,   121,
     122,   123,   124,   125,   129,   130,   131,   132,   133,   134,
     135,   136,   140,   142,   143,   106,    84,    85,    92,   114,
      84,   111,   116,   123,   116,   123,   133,   141,   116,   123,
     137,   116,    84,   105,   106,    74,    74,    74,    74,    84,
     108,   116,   121,     7,    29,     3,     4,     5,     6,     8,
       9,    10,    11,    12,    13,    14,    15,    16,    17,    18,
      19,    20,    21,    22,    23,    24,    25,    26,    28,    32,
      33,    34,    35,    36,    37,    38,    39,    81,   126,   127,
     128,    74,    90,    91,    77,   121,   121,   121,   121,   121,
     121,   121,   121,   121,   121,   121,    75,    92,   133,   116,
     133,    80,   133,   116,    76,    52,    54,     7,   116,   116,
      75,   115,   116,    75,   115,    72,    74,    84,   114,    75,
     115,   115,   116,   116,   116,   116,   116,   116,   116,   116,
     116,   116,   116,   116,   116,   116,   116,   116,   116,   116,
     116,   115,   116,    75,   115,    84,   116,    42,   133,   116,
     123,   139,     7,     7,   115,    81,    75,    75,    75,    76,
      84,    72,    84,    75,    92,   133,   134,    42,    80,    46,
      47,    77,   138,   115,   115,   116,   104,   105,    75,    76,
     133,   134,   123,   115,    93,    75,    77,   104,   104,    93,
     121,    77,   121
};

/* YYR1[RULE-NUM] -- Symbol kind of the left-hand side of rule RULE-NUM.  */
static const yytype_uint8 yyr1[] =
{
       0,    94,    95,    96,    97,    98,    98,    99,    99,   100,
     100,   101,   101,   101,   102,   103,   104,   104,   105,   105,
     105,   105,   105,   105,   106,   106,   107,   108,   108,   108,
     108,   108,   109,   110,   110,   111,   111,   112,   112,   112,
     113,   113,   114,   114,   115,   115,   116,   116,   116,   117,
     117,   117,   117,   117,   117,   117,   118,   118,   118,   118,
     119,   119,   119,   119,   119,   119,   119,   119,   119,   119,
     119,   119,   119,   119,   119,   119,   119,   119,   119,   120,
     120,   121,   121,   121,   121,   121,   121,   121,   121,   121,
     121,   121,   121,   121,   122,   122,   123,   123,   123,   123,
     124,   124,   125,   125,   126,   126,   127,   127,   127,   127,
     128,   128,   128,   128,   128,   128,   128,   129,   130,   130,
     131,   132,   133,   133,   134,   134,   134,   134,   134,   134,
     135,   136,   137,   137,   137,   137,   138,   138,   138,   138,
     138,   139,   139,   140,   140,   140,   141,   141,   142,   142,
     143,   143
};

/* YYR2[RULE-NUM] -- Number of symbols on the right-hand side of rule RULE-NUM.  */
static const yytype_int8 yyr2[] =
{
       0,     2,     3,     2,     1,     2,     0,     2,     4,     2,
       0,     2,     2,     1,     1,     2,     0,     2,     1,     3,
       4,     2,     4,     2,     1,     3,     2,     2,     4,     5,
       3,     6,     4,     3,     2,     1,     3,     2,     4,     3,
       3,     2,     1,     2,     1,     3,     1,     1,     1,     1,
       1,     3,     4,     3,     3,     4,     1,     1,     1,     1,
       3,     3,     3,     3,     3,     3,     3,     3,     3,     3,
       3,     3,     3,     3,     3,     3,     3,     3,     3,     6,
       4,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     0,     1,     1,     0,     1,     1,     1,
       2,     2,     3,     3,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     3,     1,     2,
       1,     1,     3,     2,     3,     4,     6,     6,     5,     5,
       1,     5,     0,     2,     1,     1,     4,     3,     3,     2,
       1,     0,     2,     2,     3,     3,     3,     5,     4,     3,
       4,     3
};


enum { YYENOMEM = -2 };

#define yyerrok         (yyerrstatus = 0)
#define yyclearin       (yychar = YYEMPTY)

#define YYACCEPT        goto yyacceptlab
#define YYABORT         goto yyabortlab
#define YYERROR         goto yyerrorlab
#define YYNOMEM         goto yyexhaustedlab


#define YYRECOVERING()  (!!yyerrstatus)

#define YYBACKUP(Token, Value)                                    \
  do                                                              \
    if (yychar == YYEMPTY)                                        \
      {                                                           \
        yychar = (Token);                                         \
        yylval = (Value);                                         \
        YYPOPSTACK (yylen);                                       \
        yystate = *yyssp;                                         \
        goto yybackup;                                            \
      }                                                           \
    else                                                          \
      {                                                           \
        yyerror (YY_("syntax error: cannot back up")); \
        YYERROR;                                                  \
      }                                                           \
  while (0)

/* Backward compatibility with an undocumented macro.
   Use YYerror or YYUNDEF. */
#define YYERRCODE YYUNDEF


/* Enable debugging if requested.  */
#if YYDEBUG

# ifndef YYFPRINTF
#  include <stdio.h> /* INFRINGES ON USER NAME SPACE */
#  define YYFPRINTF fprintf
# endif

# define YYDPRINTF(Args)                        \
do {                                            \
  if (yydebug)                                  \
    YYFPRINTF Args;                             \
} while (0)




# define YY_SYMBOL_PRINT(Title, Kind, Value, Location)                    \
do {                                                                      \
  if (yydebug)                                                            \
    {                                                                     \
      YYFPRINTF (stderr, "%s ", Title);                                   \
      yy_symbol_print (stderr,                                            \
                  Kind, Value); \
      YYFPRINTF (stderr, "\n");                                           \
    }                                                                     \
} while (0)


/*-----------------------------------.
| Print this symbol's value on YYO.  |
`-----------------------------------*/

static void
yy_symbol_value_print (FILE *yyo,
                       yysymbol_kind_t yykind, YYSTYPE const * const yyvaluep)
{
  FILE *yyoutput = yyo;
  YY_USE (yyoutput);
  if (!yyvaluep)
    return;
  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  YY_USE (yykind);
  YY_IGNORE_MAYBE_UNINITIALIZED_END
}


/*---------------------------.
| Print this symbol on YYO.  |
`---------------------------*/

static void
yy_symbol_print (FILE *yyo,
                 yysymbol_kind_t yykind, YYSTYPE const * const yyvaluep)
{
  YYFPRINTF (yyo, "%s %s (",
             yykind < YYNTOKENS ? "token" : "nterm", yysymbol_name (yykind));

  yy_symbol_value_print (yyo, yykind, yyvaluep);
  YYFPRINTF (yyo, ")");
}

/*------------------------------------------------------------------.
| yy_stack_print -- Print the state stack from its BOTTOM up to its |
| TOP (included).                                                   |
`------------------------------------------------------------------*/

static void
yy_stack_print (yy_state_t *yybottom, yy_state_t *yytop)
{
  YYFPRINTF (stderr, "Stack now");
  for (; yybottom <= yytop; yybottom++)
    {
      int yybot = *yybottom;
      YYFPRINTF (stderr, " %d", yybot);
    }
  YYFPRINTF (stderr, "\n");
}

# define YY_STACK_PRINT(Bottom, Top)                            \
do {                                                            \
  if (yydebug)                                                  \
    yy_stack_print ((Bottom), (Top));                           \
} while (0)


/*------------------------------------------------.
| Report that the YYRULE is going to be reduced.  |
`------------------------------------------------*/

static void
yy_reduce_print (yy_state_t *yyssp, YYSTYPE *yyvsp,
                 int yyrule)
{
  int yylno = yyrline[yyrule];
  int yynrhs = yyr2[yyrule];
  int yyi;
  YYFPRINTF (stderr, "Reducing stack by rule %d (line %d):\n",
             yyrule - 1, yylno);
  /* The symbols being reduced.  */
  for (yyi = 0; yyi < yynrhs; yyi++)
    {
      YYFPRINTF (stderr, "   $%d = ", yyi + 1);
      yy_symbol_print (stderr,
                       YY_ACCESSING_SYMBOL (+yyssp[yyi + 1 - yynrhs]),
                       &yyvsp[(yyi + 1) - (yynrhs)]);
      YYFPRINTF (stderr, "\n");
    }
}

# define YY_REDUCE_PRINT(Rule)          \
do {                                    \
  if (yydebug)                          \
    yy_reduce_print (yyssp, yyvsp, Rule); \
} while (0)

/* Nonzero means print parse trace.  It is left uninitialized so that
   multiple parsers can coexist.  */
int yydebug;
#else /* !YYDEBUG */
# define YYDPRINTF(Args) ((void) 0)
# define YY_SYMBOL_PRINT(Title, Kind, Value, Location)
# define YY_STACK_PRINT(Bottom, Top)
# define YY_REDUCE_PRINT(Rule)
#endif /* !YYDEBUG */


/* YYINITDEPTH -- initial size of the parser's stacks.  */
#ifndef YYINITDEPTH
# define YYINITDEPTH 200
#endif

/* YYMAXDEPTH -- maximum size the stacks can grow to (effective only
   if the built-in stack extension method is used).

   Do not make this value too large; the results are undefined if
   YYSTACK_ALLOC_MAXIMUM < YYSTACK_BYTES (YYMAXDEPTH)
   evaluated with infinite-precision integer arithmetic.  */

#ifndef YYMAXDEPTH
# define YYMAXDEPTH 10000
#endif


/* Context of a parse error.  */
typedef struct
{
  yy_state_t *yyssp;
  yysymbol_kind_t yytoken;
} yypcontext_t;

/* Put in YYARG at most YYARGN of the expected tokens given the
   current YYCTX, and return the number of tokens stored in YYARG.  If
   YYARG is null, return the number of expected tokens (guaranteed to
   be less than YYNTOKENS).  Return YYENOMEM on memory exhaustion.
   Return 0 if there are more than YYARGN expected tokens, yet fill
   YYARG up to YYARGN. */
static int
yypcontext_expected_tokens (const yypcontext_t *yyctx,
                            yysymbol_kind_t yyarg[], int yyargn)
{
  /* Actual size of YYARG. */
  int yycount = 0;
  int yyn = yypact[+*yyctx->yyssp];
  if (!yypact_value_is_default (yyn))
    {
      /* Start YYX at -YYN if negative to avoid negative indexes in
         YYCHECK.  In other words, skip the first -YYN actions for
         this state because they are default actions.  */
      int yyxbegin = yyn < 0 ? -yyn : 0;
      /* Stay within bounds of both yycheck and yytname.  */
      int yychecklim = YYLAST - yyn + 1;
      int yyxend = yychecklim < YYNTOKENS ? yychecklim : YYNTOKENS;
      int yyx;
      for (yyx = yyxbegin; yyx < yyxend; ++yyx)
        if (yycheck[yyx + yyn] == yyx && yyx != YYSYMBOL_YYerror
            && !yytable_value_is_error (yytable[yyx + yyn]))
          {
            if (!yyarg)
              ++yycount;
            else if (yycount == yyargn)
              return 0;
            else
              yyarg[yycount++] = YY_CAST (yysymbol_kind_t, yyx);
          }
    }
  if (yyarg && yycount == 0 && 0 < yyargn)
    yyarg[0] = YYSYMBOL_YYEMPTY;
  return yycount;
}




#ifndef yystrlen
# if defined __GLIBC__ && defined _STRING_H
#  define yystrlen(S) (YY_CAST (YYPTRDIFF_T, strlen (S)))
# else
/* Return the length of YYSTR.  */
static YYPTRDIFF_T
yystrlen (const char *yystr)
{
  YYPTRDIFF_T yylen;
  for (yylen = 0; yystr[yylen]; yylen++)
    continue;
  return yylen;
}
# endif
#endif

#ifndef yystpcpy
# if defined __GLIBC__ && defined _STRING_H && defined _GNU_SOURCE
#  define yystpcpy stpcpy
# else
/* Copy YYSRC to YYDEST, returning the address of the terminating '\0' in
   YYDEST.  */
static char *
yystpcpy (char *yydest, const char *yysrc)
{
  char *yyd = yydest;
  const char *yys = yysrc;

  while ((*yyd++ = *yys++) != '\0')
    continue;

  return yyd - 1;
}
# endif
#endif

#ifndef yytnamerr
/* Copy to YYRES the contents of YYSTR after stripping away unnecessary
   quotes and backslashes, so that it's suitable for yyerror.  The
   heuristic is that double-quoting is unnecessary unless the string
   contains an apostrophe, a comma, or backslash (other than
   backslash-backslash).  YYSTR is taken from yytname.  If YYRES is
   null, do not copy; instead, return the length of what the result
   would have been.  */
static YYPTRDIFF_T
yytnamerr (char *yyres, const char *yystr)
{
  if (*yystr == '"')
    {
      YYPTRDIFF_T yyn = 0;
      char const *yyp = yystr;
      for (;;)
        switch (*++yyp)
          {
          case '\'':
          case ',':
            goto do_not_strip_quotes;

          case '\\':
            if (*++yyp != '\\')
              goto do_not_strip_quotes;
            else
              goto append;

          append:
          default:
            if (yyres)
              yyres[yyn] = *yyp;
            yyn++;
            break;

          case '"':
            if (yyres)
              yyres[yyn] = '\0';
            return yyn;
          }
    do_not_strip_quotes: ;
    }

  if (yyres)
    return yystpcpy (yyres, yystr) - yyres;
  else
    return yystrlen (yystr);
}
#endif


static int
yy_syntax_error_arguments (const yypcontext_t *yyctx,
                           yysymbol_kind_t yyarg[], int yyargn)
{
  /* Actual size of YYARG. */
  int yycount = 0;
  /* There are many possibilities here to consider:
     - If this state is a consistent state with a default action, then
       the only way this function was invoked is if the default action
       is an error action.  In that case, don't check for expected
       tokens because there are none.
     - The only way there can be no lookahead present (in yychar) is if
       this state is a consistent state with a default action.  Thus,
       detecting the absence of a lookahead is sufficient to determine
       that there is no unexpected or expected token to report.  In that
       case, just report a simple "syntax error".
     - Don't assume there isn't a lookahead just because this state is a
       consistent state with a default action.  There might have been a
       previous inconsistent state, consistent state with a non-default
       action, or user semantic action that manipulated yychar.
     - Of course, the expected token list depends on states to have
       correct lookahead information, and it depends on the parser not
       to perform extra reductions after fetching a lookahead from the
       scanner and before detecting a syntax error.  Thus, state merging
       (from LALR or IELR) and default reductions corrupt the expected
       token list.  However, the list is correct for canonical LR with
       one exception: it will still contain any token that will not be
       accepted due to an error action in a later state.
  */
  if (yyctx->yytoken != YYSYMBOL_YYEMPTY)
    {
      int yyn;
      if (yyarg)
        yyarg[yycount] = yyctx->yytoken;
      ++yycount;
      yyn = yypcontext_expected_tokens (yyctx,
                                        yyarg ? yyarg + 1 : yyarg, yyargn - 1);
      if (yyn == YYENOMEM)
        return YYENOMEM;
      else
        yycount += yyn;
    }
  return yycount;
}

/* Copy into *YYMSG, which is of size *YYMSG_ALLOC, an error message
   about the unexpected token YYTOKEN for the state stack whose top is
   YYSSP.

   Return 0 if *YYMSG was successfully written.  Return -1 if *YYMSG is
   not large enough to hold the message.  In that case, also set
   *YYMSG_ALLOC to the required number of bytes.  Return YYENOMEM if the
   required number of bytes is too large to store.  */
static int
yysyntax_error (YYPTRDIFF_T *yymsg_alloc, char **yymsg,
                const yypcontext_t *yyctx)
{
  enum { YYARGS_MAX = 5 };
  /* Internationalized format string. */
  const char *yyformat = YY_NULLPTR;
  /* Arguments of yyformat: reported tokens (one for the "unexpected",
     one per "expected"). */
  yysymbol_kind_t yyarg[YYARGS_MAX];
  /* Cumulated lengths of YYARG.  */
  YYPTRDIFF_T yysize = 0;

  /* Actual size of YYARG. */
  int yycount = yy_syntax_error_arguments (yyctx, yyarg, YYARGS_MAX);
  if (yycount == YYENOMEM)
    return YYENOMEM;

  switch (yycount)
    {
#define YYCASE_(N, S)                       \
      case N:                               \
        yyformat = S;                       \
        break
    default: /* Avoid compiler warnings. */
      YYCASE_(0, YY_("syntax error"));
      YYCASE_(1, YY_("syntax error, unexpected %s"));
      YYCASE_(2, YY_("syntax error, unexpected %s, expecting %s"));
      YYCASE_(3, YY_("syntax error, unexpected %s, expecting %s or %s"));
      YYCASE_(4, YY_("syntax error, unexpected %s, expecting %s or %s or %s"));
      YYCASE_(5, YY_("syntax error, unexpected %s, expecting %s or %s or %s or %s"));
#undef YYCASE_
    }

  /* Compute error message size.  Don't count the "%s"s, but reserve
     room for the terminator.  */
  yysize = yystrlen (yyformat) - 2 * yycount + 1;
  {
    int yyi;
    for (yyi = 0; yyi < yycount; ++yyi)
      {
        YYPTRDIFF_T yysize1
          = yysize + yytnamerr (YY_NULLPTR, yytname[yyarg[yyi]]);
        if (yysize <= yysize1 && yysize1 <= YYSTACK_ALLOC_MAXIMUM)
          yysize = yysize1;
        else
          return YYENOMEM;
      }
  }

  if (*yymsg_alloc < yysize)
    {
      *yymsg_alloc = 2 * yysize;
      if (! (yysize <= *yymsg_alloc
             && *yymsg_alloc <= YYSTACK_ALLOC_MAXIMUM))
        *yymsg_alloc = YYSTACK_ALLOC_MAXIMUM;
      return -1;
    }

  /* Avoid sprintf, as that infringes on the user's name space.
     Don't have undefined behavior even if the translation
     produced a string with the wrong number of "%s"s.  */
  {
    char *yyp = *yymsg;
    int yyi = 0;
    while ((*yyp = *yyformat) != '\0')
      if (*yyp == '%' && yyformat[1] == 's' && yyi < yycount)
        {
          yyp += yytnamerr (yyp, yytname[yyarg[yyi++]]);
          yyformat += 2;
        }
      else
        {
          ++yyp;
          ++yyformat;
        }
  }
  return 0;
}


/*-----------------------------------------------.
| Release the memory associated to this symbol.  |
`-----------------------------------------------*/

static void
yydestruct (const char *yymsg,
            yysymbol_kind_t yykind, YYSTYPE *yyvaluep)
{
  YY_USE (yyvaluep);
  if (!yymsg)
    yymsg = "Deleting";
  YY_SYMBOL_PRINT (yymsg, yykind, yyvaluep, yylocationp);

  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  YY_USE (yykind);
  YY_IGNORE_MAYBE_UNINITIALIZED_END
}


/* Lookahead token kind.  */
int yychar;

/* The semantic value of the lookahead symbol.  */
YYSTYPE yylval;
/* Number of syntax errors so far.  */
int yynerrs;




/*----------.
| yyparse.  |
`----------*/

int
yyparse (void)
{
    yy_state_fast_t yystate = 0;
    /* Number of tokens to shift before error messages enabled.  */
    int yyerrstatus = 0;

    /* Refer to the stacks through separate pointers, to allow yyoverflow
       to reallocate them elsewhere.  */

    /* Their size.  */
    YYPTRDIFF_T yystacksize = YYINITDEPTH;

    /* The state stack: array, bottom, top.  */
    yy_state_t yyssa[YYINITDEPTH];
    yy_state_t *yyss = yyssa;
    yy_state_t *yyssp = yyss;

    /* The semantic value stack: array, bottom, top.  */
    YYSTYPE yyvsa[YYINITDEPTH];
    YYSTYPE *yyvs = yyvsa;
    YYSTYPE *yyvsp = yyvs;

  int yyn;
  /* The return value of yyparse.  */
  int yyresult;
  /* Lookahead symbol kind.  */
  yysymbol_kind_t yytoken = YYSYMBOL_YYEMPTY;
  /* The variables used to return semantic value and location from the
     action routines.  */
  YYSTYPE yyval;

  /* Buffer for error messages, and its allocated size.  */
  char yymsgbuf[128];
  char *yymsg = yymsgbuf;
  YYPTRDIFF_T yymsg_alloc = sizeof yymsgbuf;

#define YYPOPSTACK(N)   (yyvsp -= (N), yyssp -= (N))

  /* The number of symbols on the RHS of the reduced rule.
     Keep to zero when no symbol should be popped.  */
  int yylen = 0;

  YYDPRINTF ((stderr, "Starting parse\n"));

  yychar = YYEMPTY; /* Cause a token to be read.  */

  goto yysetstate;


/*------------------------------------------------------------.
| yynewstate -- push a new state, which is found in yystate.  |
`------------------------------------------------------------*/
yynewstate:
  /* In all cases, when you get here, the value and location stacks
     have just been pushed.  So pushing a state here evens the stacks.  */
  yyssp++;


/*--------------------------------------------------------------------.
| yysetstate -- set current state (the top of the stack) to yystate.  |
`--------------------------------------------------------------------*/
yysetstate:
  YYDPRINTF ((stderr, "Entering state %d\n", yystate));
  YY_ASSERT (0 <= yystate && yystate < YYNSTATES);
  YY_IGNORE_USELESS_CAST_BEGIN
  *yyssp = YY_CAST (yy_state_t, yystate);
  YY_IGNORE_USELESS_CAST_END
  YY_STACK_PRINT (yyss, yyssp);

  if (yyss + yystacksize - 1 <= yyssp)
#if !defined yyoverflow && !defined YYSTACK_RELOCATE
    YYNOMEM;
#else
    {
      /* Get the current used size of the three stacks, in elements.  */
      YYPTRDIFF_T yysize = yyssp - yyss + 1;

# if defined yyoverflow
      {
        /* Give user a chance to reallocate the stack.  Use copies of
           these so that the &'s don't force the real ones into
           memory.  */
        yy_state_t *yyss1 = yyss;
        YYSTYPE *yyvs1 = yyvs;

        /* Each stack pointer address is followed by the size of the
           data in use in that stack, in bytes.  This used to be a
           conditional around just the two extra args, but that might
           be undefined if yyoverflow is a macro.  */
        yyoverflow (YY_("memory exhausted"),
                    &yyss1, yysize * YYSIZEOF (*yyssp),
                    &yyvs1, yysize * YYSIZEOF (*yyvsp),
                    &yystacksize);
        yyss = yyss1;
        yyvs = yyvs1;
      }
# else /* defined YYSTACK_RELOCATE */
      /* Extend the stack our own way.  */
      if (YYMAXDEPTH <= yystacksize)
        YYNOMEM;
      yystacksize *= 2;
      if (YYMAXDEPTH < yystacksize)
        yystacksize = YYMAXDEPTH;

      {
        yy_state_t *yyss1 = yyss;
        union yyalloc *yyptr =
          YY_CAST (union yyalloc *,
                   YYSTACK_ALLOC (YY_CAST (YYSIZE_T, YYSTACK_BYTES (yystacksize))));
        if (! yyptr)
          YYNOMEM;
        YYSTACK_RELOCATE (yyss_alloc, yyss);
        YYSTACK_RELOCATE (yyvs_alloc, yyvs);
#  undef YYSTACK_RELOCATE
        if (yyss1 != yyssa)
          YYSTACK_FREE (yyss1);
      }
# endif

      yyssp = yyss + yysize - 1;
      yyvsp = yyvs + yysize - 1;

      YY_IGNORE_USELESS_CAST_BEGIN
      YYDPRINTF ((stderr, "Stack size increased to %ld\n",
                  YY_CAST (long, yystacksize)));
      YY_IGNORE_USELESS_CAST_END

      if (yyss + yystacksize - 1 <= yyssp)
        YYABORT;
    }
#endif /* !defined yyoverflow && !defined YYSTACK_RELOCATE */


  if (yystate == YYFINAL)
    YYACCEPT;

  goto yybackup;


/*-----------.
| yybackup.  |
`-----------*/
yybackup:
  /* Do appropriate processing given the current state.  Read a
     lookahead token if we need one and don't already have one.  */

  /* First try to decide what to do without reference to lookahead token.  */
  yyn = yypact[yystate];
  if (yypact_value_is_default (yyn))
    goto yydefault;

  /* Not known => get a lookahead token if don't already have one.  */

  /* YYCHAR is either empty, or end-of-input, or a valid lookahead.  */
  if (yychar == YYEMPTY)
    {
      YYDPRINTF ((stderr, "Reading a token\n"));
      yychar = yylex ();
    }

  if (yychar <= YYEOF)
    {
      yychar = YYEOF;
      yytoken = YYSYMBOL_YYEOF;
      YYDPRINTF ((stderr, "Now at end of input.\n"));
    }
  else if (yychar == YYerror)
    {
      /* The scanner already issued an error message, process directly
         to error recovery.  But do not keep the error token as
         lookahead, it is too special and may lead us to an endless
         loop in error recovery. */
      yychar = YYUNDEF;
      yytoken = YYSYMBOL_YYerror;
      goto yyerrlab1;
    }
  else
    {
      yytoken = YYTRANSLATE (yychar);
      YY_SYMBOL_PRINT ("Next token is", yytoken, &yylval, &yylloc);
    }

  /* If the proper action on seeing token YYTOKEN is to reduce or to
     detect an error, take that action.  */
  yyn += yytoken;
  if (yyn < 0 || YYLAST < yyn || yycheck[yyn] != yytoken)
    goto yydefault;
  yyn = yytable[yyn];
  if (yyn <= 0)
    {
      if (yytable_value_is_error (yyn))
        goto yyerrlab;
      yyn = -yyn;
      goto yyreduce;
    }

  /* Count tokens shifted since error; after three, turn off error
     status.  */
  if (yyerrstatus)
    yyerrstatus--;

  /* Shift the lookahead token.  */
  YY_SYMBOL_PRINT ("Shifting", yytoken, &yylval, &yylloc);
  yystate = yyn;
  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  *++yyvsp = yylval;
  YY_IGNORE_MAYBE_UNINITIALIZED_END

  /* Discard the shifted token.  */
  yychar = YYEMPTY;
  goto yynewstate;


/*-----------------------------------------------------------.
| yydefault -- do the default action for the current state.  |
`-----------------------------------------------------------*/
yydefault:
  yyn = yydefact[yystate];
  if (yyn == 0)
    goto yyerrlab;
  goto yyreduce;


/*-----------------------------.
| yyreduce -- do a reduction.  |
`-----------------------------*/
yyreduce:
  /* yyn is the number of a rule to reduce with.  */
  yylen = yyr2[yyn];

  /* If YYLEN is nonzero, implement the default value of the action:
     '$$ = $1'.

     Otherwise, the following line sets YYVAL to garbage.
     This behavior is undocumented and Bison
     users should not rely upon it.  Assigning to YYVAL
     unconditionally makes the parser a bit smaller, and it avoids a
     GCC warning that YYVAL may be used uninitialized.  */
  yyval = yyvsp[1-yylen];


  YY_REDUCE_PRINT (yyn);
  switch (yyn)
    {

#line 2002 "y.tab.c"

      default: break;
    }
  /* User semantic actions sometimes alter yychar, and that requires
     that yytoken be updated with the new translation.  We take the
     approach of translating immediately before every use of yytoken.
     One alternative is translating here after every semantic action,
     but that translation would be missed if the semantic action invokes
     YYABORT, YYACCEPT, or YYERROR immediately after altering yychar or
     if it invokes YYBACKUP.  In the case of YYABORT or YYACCEPT, an
     incorrect destructor might then be invoked immediately.  In the
     case of YYERROR or YYBACKUP, subsequent parser actions might lead
     to an incorrect destructor call or verbose syntax error message
     before the lookahead is translated.  */
  YY_SYMBOL_PRINT ("-> $$ =", YY_CAST (yysymbol_kind_t, yyr1[yyn]), &yyval, &yyloc);

  YYPOPSTACK (yylen);
  yylen = 0;

  *++yyvsp = yyval;

  /* Now 'shift' the result of the reduction.  Determine what state
     that goes to, based on the state we popped back to and the rule
     number reduced by.  */
  {
    const int yylhs = yyr1[yyn] - YYNTOKENS;
    const int yyi = yypgoto[yylhs] + *yyssp;
    yystate = (0 <= yyi && yyi <= YYLAST && yycheck[yyi] == *yyssp
               ? yytable[yyi]
               : yydefgoto[yylhs]);
  }

  goto yynewstate;


/*--------------------------------------.
| yyerrlab -- here on detecting error.  |
`--------------------------------------*/
yyerrlab:
  /* Make sure we have latest lookahead translation.  See comments at
     user semantic actions for why this is necessary.  */
  yytoken = yychar == YYEMPTY ? YYSYMBOL_YYEMPTY : YYTRANSLATE (yychar);
  /* If not already recovering from an error, report this error.  */
  if (!yyerrstatus)
    {
      ++yynerrs;
      {
        yypcontext_t yyctx
          = {yyssp, yytoken};
        char const *yymsgp = YY_("syntax error");
        int yysyntax_error_status;
        yysyntax_error_status = yysyntax_error (&yymsg_alloc, &yymsg, &yyctx);
        if (yysyntax_error_status == 0)
          yymsgp = yymsg;
        else if (yysyntax_error_status == -1)
          {
            if (yymsg != yymsgbuf)
              YYSTACK_FREE (yymsg);
            yymsg = YY_CAST (char *,
                             YYSTACK_ALLOC (YY_CAST (YYSIZE_T, yymsg_alloc)));
            if (yymsg)
              {
                yysyntax_error_status
                  = yysyntax_error (&yymsg_alloc, &yymsg, &yyctx);
                yymsgp = yymsg;
              }
            else
              {
                yymsg = yymsgbuf;
                yymsg_alloc = sizeof yymsgbuf;
                yysyntax_error_status = YYENOMEM;
              }
          }
        yyerror (yymsgp);
        if (yysyntax_error_status == YYENOMEM)
          YYNOMEM;
      }
    }

  if (yyerrstatus == 3)
    {
      /* If just tried and failed to reuse lookahead token after an
         error, discard it.  */

      if (yychar <= YYEOF)
        {
          /* Return failure if at end of input.  */
          if (yychar == YYEOF)
            YYABORT;
        }
      else
        {
          yydestruct ("Error: discarding",
                      yytoken, &yylval);
          yychar = YYEMPTY;
        }
    }

  /* Else will try to reuse lookahead token after shifting the error
     token.  */
  goto yyerrlab1;


/*---------------------------------------------------.
| yyerrorlab -- error raised explicitly by YYERROR.  |
`---------------------------------------------------*/
yyerrorlab:
  /* Pacify compilers when the user code never invokes YYERROR and the
     label yyerrorlab therefore never appears in user code.  */
  if (0)
    YYERROR;
  ++yynerrs;

  /* Do not reclaim the symbols of the rule whose action triggered
     this YYERROR.  */
  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);
  yystate = *yyssp;
  goto yyerrlab1;


/*-------------------------------------------------------------.
| yyerrlab1 -- common code for both syntax error and YYERROR.  |
`-------------------------------------------------------------*/
yyerrlab1:
  yyerrstatus = 3;      /* Each real token shifted decrements this.  */

  /* Pop stack until we find a state that shifts the error token.  */
  for (;;)
    {
      yyn = yypact[yystate];
      if (!yypact_value_is_default (yyn))
        {
          yyn += YYSYMBOL_YYerror;
          if (0 <= yyn && yyn <= YYLAST && yycheck[yyn] == YYSYMBOL_YYerror)
            {
              yyn = yytable[yyn];
              if (0 < yyn)
                break;
            }
        }

      /* Pop the current state because it cannot handle the error token.  */
      if (yyssp == yyss)
        YYABORT;


      yydestruct ("Error: popping",
                  YY_ACCESSING_SYMBOL (yystate), yyvsp);
      YYPOPSTACK (1);
      yystate = *yyssp;
      YY_STACK_PRINT (yyss, yyssp);
    }

  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  *++yyvsp = yylval;
  YY_IGNORE_MAYBE_UNINITIALIZED_END


  /* Shift the error token.  */
  YY_SYMBOL_PRINT ("Shifting", YY_ACCESSING_SYMBOL (yyn), yyvsp, yylsp);

  yystate = yyn;
  goto yynewstate;


/*-------------------------------------.
| yyacceptlab -- YYACCEPT comes here.  |
`-------------------------------------*/
yyacceptlab:
  yyresult = 0;
  goto yyreturnlab;


/*-----------------------------------.
| yyabortlab -- YYABORT comes here.  |
`-----------------------------------*/
yyabortlab:
  yyresult = 1;
  goto yyreturnlab;


/*-----------------------------------------------------------.
| yyexhaustedlab -- YYNOMEM (memory exhaustion) comes here.  |
`-----------------------------------------------------------*/
yyexhaustedlab:
  yyerror (YY_("memory exhausted"));
  yyresult = 2;
  goto yyreturnlab;


/*----------------------------------------------------------.
| yyreturnlab -- parsing is finished, clean up and return.  |
`----------------------------------------------------------*/
yyreturnlab:
  if (yychar != YYEMPTY)
    {
      /* Make sure we have latest lookahead translation.  See comments at
         user semantic actions for why this is necessary.  */
      yytoken = YYTRANSLATE (yychar);
      yydestruct ("Cleanup: discarding lookahead",
                  yytoken, &yylval);
    }
  /* Do not reclaim the symbols of the rule whose action triggered
     this YYABORT or YYACCEPT.  */
  YYPOPSTACK (yylen);
  YY_STACK_PRINT (yyss, yyssp);
  while (yyssp != yyss)
    {
      yydestruct ("Cleanup: popping",
                  YY_ACCESSING_SYMBOL (+*yyssp), yyvsp);
      YYPOPSTACK (1);
    }
#ifndef yyoverflow
  if (yyss != yyssa)
    YYSTACK_FREE (yyss);
#endif
  if (yymsg != yymsgbuf)
    YYSTACK_FREE (yymsg);
  return yyresult;
}

#line 307 "lex.y"


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
