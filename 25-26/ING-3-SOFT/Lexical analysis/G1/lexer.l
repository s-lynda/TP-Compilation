%{
 int nb_ligne=1;
%}

nbr [0-9]+
IDF [a-zA-Z_][a-zA-Z0-9_]*
chaine '([^']*)'
%%
"for" {printf("FOR \n");}
"in" {printf("IN \n");}
"range" {printf("RANGE \n");}
print {printf("PRINT \n");}
{nbr} {printf("NUMBER: %s \n", yytext);}
{IDF} {printf("ID: %s \n", yytext);}
{chaine} {printf("STRING: %s \n", yytext);}
[+=:()] {printf("SYMBOLE: %s \n", yytext);}
\n {nb_ligne++;}
[ \t] ; 
. {printf("Erreur lexicale : (%s) \n", yytext);}
%%
main(){
    yylex();
}
