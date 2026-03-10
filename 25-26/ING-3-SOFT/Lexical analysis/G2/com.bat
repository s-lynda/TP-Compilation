flex lexer.l
gcc lex.yy.c -lfl -o lexer
lexer < source2.txt