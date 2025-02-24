%{
int nb_ligne=1;
int col=1;
int yyerror(char*s);
%}
%token mc_p mc_int mc_if mc_else mc_do mc_print crf cro
          egal idf chaine entier
%start S
%%
S: entete corps
    {
        printf("\nSyntaxe correcte\n");
    }
;
entete: mc_p idf
;
corps: cro Declaration Instruction crf
;
Declaration: dec Declaration
|
;
dec: mc_int list_idf
;

list_idf:  list_idf ',' idf
| idf
;

Instruction: instruction Instruction
| instruction
;

instruction: affectation 
| condition
|write
;

affectation: idf '=' idf
| idf '=' entier
| idf '=' chaine
;

condition: mc_if '(' idf egal idf ')' mc_do '(' instruction ')'
            | mc_if '(' idf egal idf ')' mc_do '(' instruction ')' mc_else '(' instruction ')'
;

write: mc_print '{' chaine '}'
     | mc_print '{' idf '}'
;



%%

main(){
    yyparse();
}
yywrap(){}

int yyerror(char *s) {
    printf("Erreur syntaxique: a la ligne %d, colonne %d\n", nb_ligne, col);
    return 0;
}