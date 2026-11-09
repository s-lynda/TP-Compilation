%{
    #include "parser.tab.h"
    int nb_ligne = 1;
    int col = 1;
%}
IDF [a-zA-Z][a-zA-Z0-9]*
Cst [0-9]+
comment "%%"[^\n]*
%%
"main" {col+=yyleng; return mc_main;}
"float" {col+=yyleng; return mc_float;}
"integer" {col+=yyleng; return mc_int;}
{IDF} {col+=yyleng; return idf;}
{Cst} {col+=yyleng; return cst;}
{comment} 
[(){},;*+=/] {col+=yyleng; return yytext[0];}
[ \t] {col+=yyleng;}
\n {nb_ligne++; col=1;}
. {printf("Erreur lexicale sur l'entite %s, a la ligne %d, a la colonne %d",yytext,nb_ligne,col);}
%%