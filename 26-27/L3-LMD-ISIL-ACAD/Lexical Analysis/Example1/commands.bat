flex lexer.l
gcc lex.yy.c -o ISILACAD -lfl
ISILACAD.exe < test.txt
