flex lex.l
gcc lex.yy.c -o SIGL -lfl
SIGL.exe < test.txt
