
/* 
y=y*3;

*/
%{
     #include "syn.tab.h"
     int nb_ligne=1;
%}
IDF [a-zA-Z][a-zA-Z0-9]*
chiffre [0-9]+

%%
{IDF} {printf("idf\n");return idf;}
{chiffre} {printf("cst\n"); return cst;}
"=" {printf("egal\n");return egal;}
"*" {printf("mul\n"); return mul;}
";" {printf("pvg\n"); return pvg;}
[ \t]
\n {nb_ligne++;}
. {printf("erreur lexicale a la ligne %d",nb_ligne);}
%%
