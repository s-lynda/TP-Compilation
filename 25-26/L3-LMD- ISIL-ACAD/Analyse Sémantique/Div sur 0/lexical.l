%{
    
    #include "syn.tab.h"
    int nb_ligne=1; 
    extern YYSTYPE yylval;
%}
lettre [a-zA-Z]
chiffre [0-9]
IDF {lettre}({lettre}|{chiffre})*
cst {chiffre}+
%%
{IDF} {yylval.str=strdup(yytext); printf("%s reconnu\n",yytext); return IDF;}
{cst} {yylval.entier=atoi(yytext); printf("%s reconnu\n",yytext); return CST;}
"/" {printf("%s reconnu\n",yytext);return DIV;}
"=" {printf("%s reconnu\n",yytext); return aff;}
";" {printf("%s reconnu\n",yytext); return pvg;}
[ \t] {}
\n { nb_ligne++;} 
. {printf("Erreur lexicale sur l\'entite %s, a la ligne %d\n",yytext,nb_ligne); return err;}
%%