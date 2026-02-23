flex lexical.l
bison -d -v syntax.y
gcc lex.yy.c syntax.tab.c -lfl -ly -o anal.exe
anal.exe < test_tp_IL_G3.txt