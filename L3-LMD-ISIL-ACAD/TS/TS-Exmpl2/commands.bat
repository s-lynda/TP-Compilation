flex lexical.l
bison -d syn.y
gcc lex.yy.c syn.tab.c -lfl -ly -o compiler.exe
compiler.exe<test.txt