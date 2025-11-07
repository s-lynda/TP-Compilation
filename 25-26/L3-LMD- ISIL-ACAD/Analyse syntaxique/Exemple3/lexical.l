%{
    /* Analyseur lexicale + syntaxique pour : 
                        main()
                        {
                            %% Partie declaration 
                            int x=2;
                            float y=2.5;
                            float z,l,k;

                            %% Partie instructions
                            x=x+1; 
                            z=z-2;
                        }
    */
#include "syn.tab.h"
int nb_ligne=1;
int col=1;
%}
/* Partie de définitions des expressions régulières */
lettre [a-zA-Z]
chiffre [0-9]
IDF {lettre}({lettre}|{chiffre})*
cst {chiffre}+
reel {chiffre}+\.{chiffre}+
commentaire %%[^\n]*
/* Partie des règles de traduction */
%%
"main" {col+=yyleng; printf("%s reconnu\n",yytext);return mc_main;}
"int" {col+=yyleng; printf("%s reconnu\n",yytext);return mc_int;}
"float" {col+=yyleng; printf("%s reconnu\n",yytext);return mc_flt;}

{IDF} {col+=yyleng; printf("%s reconnu\n",yytext);return idf;}
{cst} {col+=yyleng;printf("%s reconnu\n",yytext);return cst;}
{reel} {col+=yyleng;printf("%s reconnu\n",yytext);return real;}
[-+,;=(){}] {col+=yyleng; printf("%s reconnu\n",yytext);return yytext[0];}
{commentaire} {printf("%s\n",yytext);}
[ \t] {col+=yyleng;}
\n {nb_ligne++;col=1;}
. {printf("Erreur lexicale sur l'entite %s a la ligne %d a la colonne %d\n",yytext,nb_ligne,col); col+=yyleng;return err;}
%%

