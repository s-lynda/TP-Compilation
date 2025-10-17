flex lexical.l
gcc lex.yy.c -o LexicalAnalyzer -lfl
LexicalAnalyzer.exe < input.txt
