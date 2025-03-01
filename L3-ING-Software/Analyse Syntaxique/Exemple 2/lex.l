/* Le langage: int x; float y,z,a; int y,u;*/
%{
#include "syn.tab.h"
extern int nb_ligne;
extern int col;
%}
lettre [a-zA-Z]
chiffre [0-9]
IDF {lettre}({lettre}|{chiffre})*
comment "//".*
%%
"int" {col=col+yyleng; printf("%s reconnu\n",yytext);return mc_int;}
"float" {col=col+yyleng; printf("%s reconnu\n",yytext);return mc_float;}
{IDF} {col=col+yyleng; printf("%s reconnu\n",yytext);return idf;}
[,;] {col=col+yyleng; printf("%s reconnu\n,",yytext);return yytext[0];}
{comment} {printf("commentaire sur une seule ligne reconnu \n");}
[ \t]
\n {nb_ligne++; col=1;}
. {printf("erreur lexicale sur l\'entite %s à la ligne %d , a la colonne %d\n",yytext,nb_ligne,col); return err;}
%%

