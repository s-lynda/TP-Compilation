%{
#include <stdio.h>
extern int nb_ligne;
extern int col;
%}
%start main_program
%token mc_main mc_int mc_flt idf cst real err 
%%
OP: '+' | '-';
expression: idf
            |NUMBER
;
EXPR: expression OP expression
    ;
INSTR: idf '=' EXPR ';'
;
INSTRUCTION: INSTR INSTRUCTION
            | 
            ;
NUMBER: cst |real;            
initialisation:  idf '=' NUMBER
                ;            
liste_variable: idf ',' liste_variable 
                | idf 
                | initialisation
              ;
Type: mc_flt 
    | mc_int
    ;
DEC: Type liste_variable ';'
    ;
DECLARATION: DEC DECLARATION
            |
;
main_program: mc_main '('')' '{' DECLARATION INSTRUCTION'}'{
        printf("------------  Syntaxe correcte -------------------\n");
        YYACCEPT;
        }   
    ;
%%
main ()
{
yyparse();
}
int yyerror(char *msg)
{   printf("Erreur syntaxique a la ligne %d a la colonne %d\n",nb_ligne,col-1);
    return 1;
}