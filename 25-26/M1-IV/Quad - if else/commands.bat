flex lex.l
bison -d syn.y
gcc lex.yy.c syn.tab.c -lfl -ly -o Compiler.exe
Compiler.exe<Exemple.txt

