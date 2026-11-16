flex lex.l
bison -d syn.y
gcc lex.yy.c syn.tab.c -o compiler
compiler.exe<test.txt