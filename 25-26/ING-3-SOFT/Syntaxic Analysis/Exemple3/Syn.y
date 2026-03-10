%{
#include <stdio.h>
extern int nb_ligne;
extern int col;
%}
%start P
%token mc_main mc_int mc_flt idf cst err
%%
Type: mc_flt | mc_int;
DECLARATION: Type idf ';'DECLARATION
           | Type idf '='cst ';' DECLARATION
           |
           ;
P: mc_main '('')' '{' DECLARATION '}'{
        printf("------------  Syntaxe correcte -------------------\n");
        YYACCEPT;
        
        }   
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