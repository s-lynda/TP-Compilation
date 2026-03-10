%{
 int nb_ligne = 1;
%}
IDF [a-zA-Z_][a-zA-Z0-9_]*
nbr [0-9]+
chaine '([^']*)'

%%
"if" {printf("IF \n");}
{IDF} {printf("ID: %s \n", yytext);}
{nbr} {printf("NUMBER: %s \n", yytext);}
{chaine} {printf("STRING: %s \n", yytext);}
[={}()] {printf("SYMBOLE: %s \n", yytext);}
\n {nb_ligne++;}
[ \t] ;
. {printf("Erreur lexicale : %s \n", yytext);}





%%