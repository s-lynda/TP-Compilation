%{
#include <stdio.h>
extern int nb_ligne;
extern int col;
%}
%start S
%token cst pvg aff  err idf
%%
S: idf aff cst pvg {
    /*--Il va lire qu'une seule instruction de ce type et il arrete l'analyse syntaxique --*/
        printf("syntaxe correcte\n");
        YYACCEPT;
        }
        ;
%%
main ()
{
yyparse();
}

int yyerror(char *msg)
{   printf(" Erreur syntaxique a la ligne %d a la colonne %d\n",nb_ligne,col);
    return 1;
}