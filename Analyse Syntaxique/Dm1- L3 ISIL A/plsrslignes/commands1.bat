flex lex1.l
bison -d syn1.y
gcc lex.yy.c syn1.tab.c -lfl -ly -o dvr
dvr.exe<test.txt