# Compiler for GoLang

This Repo is our implementaion of a Compiler for GoLang using **Lex** and **Yacc**.

1. Run the following commands to build your lexical analyzer:
    ```
    lex lex.l && gcc lex.yy.c -ll -o compiler
    ```
2. Run the following commands to build your compiler (updated for parser):
    ```
    lex lex.l && yacc -v -d lex.y && gcc y.tab.c lex.yy.c -ll -o parser
    ```
3. To Run your compiler, use:
    ```
    ./parser < input_file
    ```

