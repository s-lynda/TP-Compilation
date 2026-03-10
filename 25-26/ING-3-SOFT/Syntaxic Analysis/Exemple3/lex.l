%{
    /*
    main()
    {
    int a;
    float b=2;
    }
    
    */
#include "Syn.tab.h"
int nb_ligne=1;
int col=1;
%}
/* Partie de définitions des expressions régulières */
lettre [a-zA-Z]
chiffre [0-9]
IDF {lettre}({lettre}|{chiffre})*
cst {chiffre}+
/* Partie des règles de traduction */
%%
"main" {col+=yyleng; printf("%s reconnu\n",yytext);return mc_main;}
"int" {col+=yyleng; printf("%s reconnu\n",yytext);return mc_int;}
"float" {col+=yyleng; printf("%s reconnu\n",yytext);return mc_flt;}

{IDF} {col+=yyleng; printf("%s reconnu\n",yytext);return idf;}
{cst} {col+=yyleng;printf("%s reconnu\n",yytext);return cst;}
[;=(){}] {col+=yyleng; printf("%s reconnu\n",yytext);return yytext[0];}
[ \t] {col+=yyleng;}
\n {nb_ligne++;col=1;}
. {printf("Erreur lexicale sur l'entite %s a la ligne %d a la colonne %d\n",yytext,nb_ligne,col); col+=yyleng;}
%%

