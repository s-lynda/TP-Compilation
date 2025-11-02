%{
#include <stdio.h>
extern int nb_ligne;
extern int col;
%}
%start S
%token cst pvg aff  err idf
%%
S: idf aff cst pvg {
        printf("syntaxe correcte");
        YYACCEPT;
        }
        ;
%%
main ()
{
yyparse();
}
yywrap()
{}
int yyerror(char *msg)
{ printf(" Erreur syntaxique");
    return 1;
}