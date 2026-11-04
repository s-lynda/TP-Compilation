%{

extern int nb_ligne;
%}
%token idf cst plus egal pvg
%start PR
%%
PR:idf egal idf plus cst pvg PR{printf("Syntaxe correcte\n"); YYACCEPT;}
   |idf egal idf plus cst pvg
   ;
%%
int main()
{
    yyparse();
    return 0;
}
int yyerror ( char* msg )
{
printf ("Erreur Syntaxique rencontrée à la ligne %d: \n ",nb_ligne);
return 1;
}