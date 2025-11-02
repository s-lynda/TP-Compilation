%{
    /* Analyseur syntaxique pour: 
    import math; 
    import lang;
    
    DEC
    */
#include "syn1.tab.h"
int nb_ligne=1;
int col=1;
%}
lettre [a-zA-Z]
chiffre [0-9]
idf {lettre}({lettre}|{chiffre})*
cst {chiffre}+
%%
import {printf("ligne %d: %s reconnue \n",nb_ligne,yytext); col=col+yyleng; return mc_import;}
lang {printf("ligne %d: %s reconnue\n",nb_ligne,yytext); col=col+yyleng; return mc_lang;}
math {printf("ligne %d: %s reconnue \n",nb_ligne,yytext); col=col+yyleng; return mc_math;}
DEC  {printf("ligne %d: %s reconnue \n",nb_ligne,yytext); col=col+yyleng; return mc_dec;}
";" {printf("ligne %d: %s reconnue\n",nb_ligne,yytext); col=col+yyleng; return pvg;}
[ \t] {col++;}
\n {nb_ligne++; col=1;}
. {printf("Erreur lexicale sur l'entite %s a la ligne %d et a la colonne %d \n",yytext,nb_ligne,col); col+= yyleng; 
    return err;}
%%