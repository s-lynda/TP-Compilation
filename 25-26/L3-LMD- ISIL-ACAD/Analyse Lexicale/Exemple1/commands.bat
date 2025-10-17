flex lex.l
gcc lex.yy.c -o Scanner -lfl
Scanner.exe < test.txt
