%{
  int nb_ligne=1;
%}
%start INSTR_LIST
%union{
    int entier;
    char* str;
}
%token DIV aff pvg err
%token <str> IDF
%token <entier> CST
%%
INSTR_LIST: INSTR INSTR_LIST
          | INSTR
          ;

INSTR: IDF aff IDF DIV CST pvg {
        if ($5 == 0) {
            printf("Erreur semantique a la ligne %d : division par %d \n", nb_ligne,$5);
        } else {
            printf("La division est %s = %s / %d\n", $1, $3, $5);
        }
      }
    | IDF aff CST DIV CST pvg {
        if ($5 == 0) {
            printf("Erreur semantique a la ligne %d: division par %d \n",nb_ligne, $5);
        } else {
            printf("La division est %s = %d / %d\n", $1, $3, $5);
        }
      }
    ;
%%
int yyerror() {
    printf("Erreur syntaxique à la ligne %d\n", nb_ligne);
    return 0;
}
main() {
    yyparse();
}
yywrap() {}