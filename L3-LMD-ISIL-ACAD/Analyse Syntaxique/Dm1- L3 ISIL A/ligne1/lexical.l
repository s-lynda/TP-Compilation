%{
    /* Analyseur lexicale pour : 
    import math;  
    import lang; 
    */
#include "syn.tab.h"
extern int nb_ligne;
extern int col;
%}
lettre [a-zA-Z]
chiffre [0-9]
idf {lettre}({lettre}|{chiffre})*
cst {chiffre}+
%%
import {col=col+yyleng; return mc_import;}
math {col=col+yyleng; return mc_math;}
lang {col=col+yyleng; return mc_lang;}
";" {col=col+yyleng; return pvg;}
[ \t] {col++;}
\n {nb_ligne++; col=1;}
. {printf("Erreur lexicale sur l'entite %s a la ligne %d et a la colonne %d \n",yytext,nb_ligne,col); 
    return err;}
%%