flex lex.l
bison -d Syn.y
gcc lex.yy.c Syn.tab.c -o SOFT -lfl -ly
SOFT.exe<test.txt