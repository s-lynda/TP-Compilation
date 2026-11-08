%{
 extern int nb_ligne;
%}
%start PR
%token idf cst mul pvg egal
%%
PR: idf egal idf mul cst pvg PR 
   | 
   ;

%%
int main()
{
    int resultat = yyparse();

    if (resultat == 0)
        printf("\nSyntaxe correcte\n");

    return 0;
}
int yyerror ( char* msg )
{
printf ("Erreur Syntaxique rencontrée à la ligne %d: \n ",nb_ligne);
return 1;
}