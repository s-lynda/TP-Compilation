%{
#include <stdio.h>
extern char *yytext;   
int nb_ligne=1;
void yyerror( char *s) ;
%}
%start S

%token mc_declare mc_arrayOfNum mc_num mc_bool mc_main mc_while mc_print mc_scan mc_add mc_removeWhere
%token idf chaine acco accf neq geq leq implique entier

%%
S: Declaration Main {
        printf("Syntaxe correcte\n");
    }
    ;
Declaration: mc_declare acco Dec accf
;
Dec: DECD Dec
| DECD
;
DECD: Type list_idf 
;
Type: mc_arrayOfNum
| mc_num
| mc_bool
;
list_idf:  list_idf ',' idf
| idf
;

Main: mc_main  '('')' acco Instruction accf
;
Instruction: instruction Instruction
| instruction
;
instruction: boucle 
| print
| scan
|appel
;

boucle: mc_while '(' idf ')' acco Instruction accf
;

print: mc_print '(' chaine ')'
    | mc_print '(' chaine'+' idf ')'
;

scan: mc_scan '(' idf ')'
;
appel: idf '.' mc_add '(' idf ')'
| idf '.' mc_removeWhere '(' idf implique cdt ')'
;
cdt: valeur '%' valeur neq valeur
;
valeur: idf
| entier
;

%%
main()
{
    yyparse();
}
yywrap(){}

void yyerror( char *s) 
{
    printf("Erreur Syntaxique a la ligne %d\n",nb_ligne);
   
}

