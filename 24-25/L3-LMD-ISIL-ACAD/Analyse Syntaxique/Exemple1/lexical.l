%{
#include "syntax.tab.h"
 int nb_ligne=1;
 int col=1;
%}
lettre [a-zA-Z]
chiffre [0-9]
IDF {lettre}({lettre}|{chiffre})*
cst {chiffre}+
%%
{IDF} {col=col+yyleng; printf("%s reconnu\n",yytext);return idf;}
{cst} {col=col+yyleng; printf("%s reconnu\n",yytext);return cst;}
= {col=col+yyleng; printf("%s reconnu",yytext);return aff;}
; {col=col+yyleng; printf("%s reconnu\n,",yytext);return pvg;}
[ \t] {col+=yyleng;}
\n {nb_ligne++; }
. {printf("erreur lexicale sur l\'entite %s à la ligne %d , a la colonne %d\n",yytext,nb_ligne,col); col=col+yyleng; return err;}
%%

