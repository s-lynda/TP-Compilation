%{
#include <stdio.h>
int nb_ligne=1;
int col=1;
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