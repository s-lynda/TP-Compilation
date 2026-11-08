flex lex.l
bison -d syn.y 
gcc lex.yy.c syn.tab.c -lfl -ly -o test
test.exe < source.txt