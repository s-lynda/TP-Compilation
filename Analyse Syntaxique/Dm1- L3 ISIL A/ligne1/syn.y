%{
    #include <stdio.h>
     int nb_ligne=1;
    int col=1;
    void yyerror(char *msg);
%}

%token mc_import mc_lang mc_math pvg err
%start S
%%
S: mc_import NOM_BIB pvg {printf("Programme syntaxiquement correcte -> ligne %d\n",nb_ligne);YYACCEPT;}
    ;

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