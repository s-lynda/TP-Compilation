%{
#include "syn.tab.h"
#include "TS.h"
extern YYSTYPE yylval;
int nb_ligne=1;
%}
/* --- Partie des expressions régulières --- */
lettre [a-zA-Z]
chiffre [0-9]
idf {lettre}({lettre}|{chiffre})*
/*Constante entière non signée */
cst [1-9][0-9]*|0 
%%
Program {return mc_program;}
PDec {return mc_pdec;}
"integer" {yylval.str=strdup(yytext);return mc_integer;}
"Reel"    {yylval.str=strdup(yytext);return mc_real;}
InBEGIN {return mc_inbegin;}
InEnD   {return mc_inend;}
[,;=/+] {return yytext[0];} 
{cst} {yylval.entier=atoi(yytext); return cst;}
{idf}  {yylval.str=strdup(yytext); inserer(yytext,"idf"); return idf;}
[ \t] 
\n {nb_ligne++;}
. {printf ("erreur lexical sur l'entite %s a la ligne %d",yytext,nb_ligne); return err;}
%%

