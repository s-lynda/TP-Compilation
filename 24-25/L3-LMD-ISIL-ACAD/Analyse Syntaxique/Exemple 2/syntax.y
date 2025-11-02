%{
    /* Analyseur syntaxique pour traiter plusieurs instructions de la forme idf = cst ; sur plusieurs lignes */
#include <stdio.h>
extern int nb_ligne;
extern int col;
%}
%start S
%token cst pvg aff err idf
%%
S: LIST_AFF {printf("syntaxe correcte\n");YYACCEPT;}
    ;
        
LIST_AFF: idf aff cst pvg LIST_AFF
        |
        ;        
%%
main ()
{
yyparse();
}
yywrap()
{}
int yyerror(char *msg)
{ printf(" Erreur syntaxique a la ligne %d, a la colonne %d\n",nb_ligne,col);
    return 1;
}