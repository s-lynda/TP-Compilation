flex lex.l
bison -d -v parser.y
gcc lex.yy.c parser.tab.c -o parser -lfl -ly
parser.exe<source.txt