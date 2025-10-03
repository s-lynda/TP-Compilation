%{
#include "syn.tab.h" // faire la liaison entre flex et bison 
#include "quad.h" 
extern YYSTYPE yylval;
extern int nb_ligne;
%}
lettre_maj [A-Z]
lettre [a-zA-Z]
idf {lettre_maj}{lettre}*
cst [0-9]+
%%
if  {return mc_if;}
else { return mc_else;}
{idf} {yylval.str=strdup(yytext);return idf;}
{cst} {yylval.num=atoi(yytext);return cst;}
[=;()v] {return yytext[0];}
[ \t]  {}
\n {nb_ligne++;}
. {printf ("Erreur lexicale a la ligne %d sur l entite %s \n",nb_ligne,yytext);}
%%