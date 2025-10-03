flex lex.l
gcc lex.yy.c -o L3Ing -lfl
L3Ing.exe < testIng.txt