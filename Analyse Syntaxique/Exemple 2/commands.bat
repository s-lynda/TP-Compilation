flex lexical.l
bison -d syntax.y
gcc lex.yy.c syntax.tab.c -lfl -ly -o compiler
compiler.exe<test.txt