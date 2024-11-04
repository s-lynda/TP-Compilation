%{
#include <stdio.h>

%}
%start S
%token cst pvg aff idf
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