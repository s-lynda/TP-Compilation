%{
#include <stdio.h>
int nb_ligne=1;
int col=1;
%}
%start S
%token mc_int mc_float idf err
%%
S: Declaration {printf("Declaration correcte");
}
Declaration: dec Declaration 
            | dec 
            ;
dec: TYPE ListeIDF ';';
TYPE: mc_int 
    | mc_float 
    ;
ListeIDF:  idf ',' ListeIDF 
        |idf
        ;

%%
main ()
{
yyparse();
}
yywrap()
{}
int yyerror(char *msg)
{ printf(" Erreur syntaxique a la ligne %d a la colonne %d",nb_ligne,col);
    return 1;
}