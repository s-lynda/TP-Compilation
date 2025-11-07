flex lexical.l
bison -d -v syn.y
gcc lex.yy.c syn.tab.c -o ACADAB -lfl -ly
ACADAB.exe<test.txt