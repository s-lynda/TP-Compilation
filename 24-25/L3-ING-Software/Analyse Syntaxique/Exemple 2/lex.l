/* Le langage: int x; float y,z,a; int y,u;*/
%{
#include "syn.tab.h"
int nb_ligne=1;
int col=1;
%}
lettre [a-zA-Z]
chiffre [0-9]
IDF {lettre}({lettre}|{chiffre})*
comment "//".*
%%
"int" {col=col+yyleng; printf("%s reconnu\n",yytext);return mc_int;}
"float" {col=col+yyleng; printf("%s reconnu\n",yytext);return mc_float;}
{IDF} {col=col+yyleng; printf("%s reconnu\n",yytext);return idf;}
[,;] {col=col+yyleng; printf("%s reconnu\n",yytext); return yytext[0];}
{comment} {printf("commentaire sur une seule ligne reconnu \n");}
[ \t] {col=col+yyleng;}
\n {nb_ligne++; col=1;}
. {printf("erreur lexicale sur l\'entite %s à la ligne %d , a la colonne %d\n",yytext,nb_ligne,col); col=col+yyleng; return err;}
%%

