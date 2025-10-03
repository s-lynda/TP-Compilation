%{
    #include <stdio.h>
     int nb_ligne=1;
    int col=1;
    void yyerror(char *msg);
%}

%token mc_import mc_lang mc_math pvg err mc_dec
%start S
%%
 S: LISTE_BIB mc_dec {printf("Programme syntaxiquement correcte -\n");YYACCEPT;};	  

LISTE_BIB: BIB LISTE_BIB
          |
          ;
BIB: mc_import NOM_BIB pvg;

NOM_BIB: mc_lang | mc_math
;	  
%%
int main()
{
    yyparse();
    return 0;
}
yywrap(){}
void yyerror(char *msg)
{
    printf("Erreur syntaxique  %s,  a la ligne %d\n",msg,nb_ligne);
}