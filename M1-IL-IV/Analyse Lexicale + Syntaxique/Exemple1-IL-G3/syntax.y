%{

int nb_ligne=1;
int yyerror(char *s);
%}

%token mc_int mc_printf mc_scanf mc_main po pf acco accf vrg pvg aff mul idf chaine
    adr 

%start programme

%%
programme: declaration main {printf("Syntaxe Correcte\n");};


declaration: mc_int idf pvg
;

main: mc_int mc_main po pf acco instructions accf
;

instructions: instruction instructions
           |
           ;
instruction: write 
              |read
              |affectation
              ;

write: mc_printf po chaine pf pvg
        | mc_printf po chaine vrg idf pf pvg
;     
read: mc_scanf po chaine vrg adr idf pf pvg
;    

affectation: idf aff idf  pvg
            | idf aff idf mul idf pvg
;

%%
main(){
    yyparse();
}
yywrap(){} 
int yyerror(char *s){
    printf("Erreur Syntaxique a la ligne %d\n",nb_ligne);
    return 0;
}