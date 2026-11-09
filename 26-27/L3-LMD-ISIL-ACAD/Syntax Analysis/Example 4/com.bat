bison -d parser.y
flex lexer.l
gcc lex.yy.c parser.tab.c -lfl -ly -o Analyser
Analyser.exe < source.txt