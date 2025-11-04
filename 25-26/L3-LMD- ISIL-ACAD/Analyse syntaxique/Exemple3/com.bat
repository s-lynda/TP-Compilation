flex lexical.l
bison -d syn.y
gcc lex.yy.c syn.tab.c -o ACADAB -lfl -ly
ACADAB.exe<test.txt