/** Analyseur lexicale + syntaxique pour l'instruction suivante: 
x=x+1;
*****/
%{
#include "parser.tab.h"
int nb_ligne=1;
%}
IDF [a-zA-Z][a-zA-Z0-9]*
CST [0-9]+
%%
{IDF} {printf("idf\n");return idf;}
{CST} {printf("cst\n");return cst;}
"=" {printf("egale\n");return egal;}
"+" {printf("plus\n");return plus;}
";" {printf("pvg\n");return pvg;}
[ \t]
\n {nb_ligne++;}
. {printf("erreur lexicale a la ligne %d",nb_ligne);}
%%
