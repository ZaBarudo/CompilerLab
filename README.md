# Compiler for GoLang

This Repo is our implementaion of a Compiler for GoLang using **Lex** and **Yacc**.

1. Run the following commandss to build your compiler (updated for parser):
    ```
    lex lex.l && yacc -v -d lex.y && gcc y.tab.c lex.yy.c -ll -o compiler
    ```
2. To Run your compiler, use:
    ```
    ./compiler < input_file
    ```

