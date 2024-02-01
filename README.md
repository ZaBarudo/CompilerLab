# Compiler for GoLang

This Repo is our implementaion of a Compiler for GoLang using **Lex** and **Yacc**.

1. Run the following commandss to build your compiler:
    ```
    lex lex.l && gcc lex.yy.c -o compiler -ll
    ```
2. To Run your compiler, use:
    ```
    ./compiler < input_file
    ```

