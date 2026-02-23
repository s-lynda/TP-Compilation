%{
 int nb_ligne=1;
 int col=1;
 void yyerror(char *msg);
%}
%start S
%union 
{
int entier;
char* str;
}
%token mc_inbegin mc_inend mc_program mc_pdec err
%token <str> mc_integer <str> mc_real <str> idf  
%token <entier> cst
%%
S: Header mc_pdec DECLARATION INSTRUCTION
{ printf ("programme syntaxiquement correcte . \n"); YYACCEPT;}
;

Header: mc_program idf
;

DECLARATION: type listeparams ';' DECLARATION 
            | type listeparams ';'
;

listeparams: listeparams ',' idf 
   | idf
   ;

type: mc_integer 
      | mc_real 
;

INSTRUCTION: mc_inbegin  ListeInstr mc_inend 
;
ListeInstr: ListeInstr Instruction
          | Instruction
;

Instruction : instaff
            | instdiv
            | instadd
;

instaff: idf '=' idf ';'
       | idf '=' cst ';' 	   
;

instdiv: idf '=' idf '/' idf ';'
       | idf '=' idf '/' cst ';'
       ;
instadd: idf '=' idf '+' idf ';'
      | idf '=' idf '+' cst ';'  
      ;     
%%
void yyerror(char *msg) {
    printf("Erreur syntaxique %s, a la ligne %d\n", msg, nb_ligne);
}
main ()
{
yyparse();
afficher();
}
yywrap(){
}
