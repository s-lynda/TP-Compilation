bison -d parser.y
flex lexer.l
gcc lex.yy.c parser.tab.c -o analyser -lfl -ly
analyser.exe<source.txt
