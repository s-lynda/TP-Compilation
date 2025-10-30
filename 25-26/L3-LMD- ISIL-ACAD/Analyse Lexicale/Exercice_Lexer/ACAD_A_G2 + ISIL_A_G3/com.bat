flex lexical.l
gcc lex.yy.c -o ACADA -lfl
ACADA.exe < test.txt