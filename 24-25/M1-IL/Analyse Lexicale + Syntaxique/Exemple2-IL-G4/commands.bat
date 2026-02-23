flex lexical.l
bison -d -v syntax.y
gcc lex.yy.c syntax.tab.c -lfl -ly -o analyseur
analyseur.exe < test_tp_iL_g4.txt