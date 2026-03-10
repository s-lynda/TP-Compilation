%{
#include <stdio.h>
extern int nb_ligne;
extern int col;
%}
%start S
%token cst pvg aff err idf
%%
S: idf aff cst pvg S {
    /*--Il va lire  plusieurs exemples --*/
        printf("syntaxe correcte\n");
        YYACCEPT;
        }
    |    
    ;
%%
main ()
{
yyparse();
}
int yyerror(char *msg)
{   printf("Erreur syntaxique a la ligne %d a la colonne %d\n",nb_ligne,col-1);
    return 1;
}