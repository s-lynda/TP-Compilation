%{
 #include "syntax.tab.h"   
  int nb_ligne=1;
%}

IDF [a-zA-Z][a-zA-Z0-9]*
chaine \"[^\"]*\"

%%
"int" {return mc_int;}
"printf" {return mc_printf;}
"scanf" {return mc_scanf;}
"main" {return mc_main;}
"(" {return po;}
")" {return pf;}
"{" {return acco;}
"}" {return accf;}
"," {return vrg;}
";" {return pvg;}
"=" {return aff;}
"*" {return mul;}
"&" {return adr;}
{IDF} {return idf;}
{chaine} {return chaine;}

[ \t] {}
\n {nb_ligne++;}
. {printf(" Erreur Lexicale a la ligne %d",nb_ligne);}

%%

