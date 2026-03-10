%{

%}
IDF [a-zA-Z_][a-zA-Z0-9_]*
NUM [0-9]+
chaine \"([^"])*\"
comment "//".*

%%
"print" { printf("KEYWORD: %s\n", yytext); }
"do" { printf("KEYWORD: %s\n", yytext); }
"while" { printf("KEYWORD: %s\n", yytext); }
{IDF} { printf("IDF: %s\n", yytext); }
{NUM} { printf("NUM: %s\n", yytext); }
{chaine} { printf("STRING: %s\n", yytext); }
{comment} {}
[+;=(),] { printf("SYMBOLE: %s\n", yytext); }

[ \t]+ {}

%%