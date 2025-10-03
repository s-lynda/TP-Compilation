%{  
 #include "syntax.tab.h"   
 extern int nb_ligne;
%}
IDF [a-zA-Z][a-zA-Z0-9]*
entier [0-9]+
chaine \'[^']*\'
%%
"Declare" {return mc_declare;}
"arrayOfNum" {return mc_arrayOfNum;}
"num" {return mc_num;}
"bool" {return mc_bool;}
"main" {return mc_main;}
"while" {return mc_while;}
"print" {return mc_print;}
"scan" {return mc_scan;}
"add" {return mc_add;}
"removeWhere" {return mc_removeWhere;}
"{" {return acco;}
"}" {return accf;}
">=" { return geq; }
"<=" { return leq; }
"!=" { return neq; }
"=>" {return implique;}
[()><=;+.,%] { return yytext[0]; }
{IDF} { return idf;}
{chaine} {return chaine;}
{entier} {return entier;}
[ \t] {}
\n {nb_ligne++;}
. {printf("Erreur lexique: %s a la ligne %d\n",yytext,nb_ligne);}
%%