%{
    extern int nb_ligne;
    extern int col;
%}
%token mc_main mc_float mc_int idf cst

%start PR
%%
PI: Instr ';' PI | Instr';'
;

Instr: idf '=' expression;
expression: terme Op terme
;

Op: '+' |'*' | '/'
;
terme: idf | cst;

BODY: PD PI;
PD: MC_type liste_idf ';' PD|MC_type liste_idf ';';
MC_type: mc_float | mc_int;
liste_idf: idf | idf ',' liste_idf;

PR: mc_main '('')''{'BODY'}'';' {//printf("\nSyntaxe correcte");
//YYACCEPT;
}


%%
int main()
{
    int resultat = yyparse();

    if (resultat == 0)
        printf("\nSyntaxe correcte\n");

    return 0;
}
int yyerror(char *msg)
{   printf(" Erreur syntaxique a la ligne %d a la colonne %d\n",nb_ligne,col-1);
    return 1;
}