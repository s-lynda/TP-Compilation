%{   
  extern int nb_ligne;
  extern int col;
%}

%token mc_dec integer mc_do mc_while mc_if endp idf nbr endIf instr
%start PROGRAM

%%
OP:'+'|'-'|'*';
INSTRUCTION: inst ';' INSTRUCTION
            | 
            ;

inst: inst_aff
    | inst_cond
    | inst_do
    ;
inst_aff: idf '=' expr
        ;

expr: term OP expr 
    | term
    ;
term: idf | nbr;    
inst_cond: mc_if '(' cond ')' '{'INSTRUCTION '}' endIf
        ; 
cond: idf '>' idf
    | idf '=''=' idf
    | idf '>' nbr
    | idf '=''=' nbr
    ;   
inst_do: mc_do '{' INSTRUCTION '}' mc_while '(' cond ')'
        ;            
PROGRAM: mc_dec ':' DECLARATION instr ':' INSTRUCTION endp '.' {printf("\nAnalyse syntaxique terminee avec succes\n");}
DECLARATION: DEC DECLARATION 
            |
            ;
DEC: Type liste_idf ';'
Type: integer;
liste_idf: idf ',' liste_idf
          | idf
          ;
%%
main()
{
    yyparse();
}
yyerror(char *s)
{
    printf("Erreur syntaxique ligne %d, col %d: %s\n", nb_ligne, col, s);
}