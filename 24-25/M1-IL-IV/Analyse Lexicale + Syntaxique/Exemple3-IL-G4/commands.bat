flex lexical.l
bison -d -v syntax.y
gcc lex.yy.c syntax.tab.c -lfl -ly -o analys
analys.exe < ILMasterGrp4TpExemple.txt