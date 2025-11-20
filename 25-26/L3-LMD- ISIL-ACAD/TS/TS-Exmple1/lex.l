%{
#include "syn.tab.h"
#include "TS.h"
extern YYSTYPE yylval;
 int nb_ligne=1;
    int col=1;
%}
/* --- Partie des expressions régulières --- */
lettre [a-zA-Z]
chiffre [0-9]
idf {lettre}({lettre}|{chiffre})*
/*Constante entière non signée */
cst [1-9][0-9]*|0 
%%
Program {col+=yyleng; return mc_program;}
PDec {col+=yyleng; return mc_pdec;}
integer {col+=yyleng; return mc_integer;}
Reel    {col+=yyleng; return mc_real;}
InBEGIN {col+=yyleng;return mc_inbegin;}
InEnD   {col+=yyleng;return mc_inend;}
[,;=/+] {col+=yyleng; return yytext[0];} 
{cst} {yylval.entier=atoi(yytext);col+=yyleng; return cst;}
{idf}  {yylval.str=strdup(yytext);col+=yyleng; inserer(yytext,"idf"); return idf;}
[ \t] {col+=yyleng;}
\n {nb_ligne++;col=1;}
. {printf ("erreur lexical sur l'entite %s a la ligne %d a la colonne %d",yytext,nb_ligne,col); col+=yyleng;return err;}
%%