%{
 int nb_ligne=1;
 int col=1;
 void yyerror(char *msg);
 char SauvType[20];
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
{ printf ("Programme syntaxiquement correcte . \n"); YYACCEPT;}
;

Header: mc_program idf
;

DECLARATION: type listeparams ';' DECLARATION 
            | type listeparams ';'
;

listeparams: listeparams ',' idf { /* Vérification de la double declaration */
                                    if(rechercheType($3)==0) {insererType($3,SauvType);}
                                    else printf("Erreur Semantique: double declation de %s, a la ligne %d\n", $3, nb_ligne); 
                                 }
   | idf  {      /* Vérification de la double declaration */
                  if (rechercheType($1)==0) insererType($1,SauvType);
                                 else printf("Erreur Semantique: double declation de %s, a la ligne %d\n", $1, nb_ligne);
                                 }
   ;

type: mc_integer {strcpy(SauvType,$1);}
      | mc_real {strcpy(SauvType,$1);}
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

instaff: idf '=' idf ';' {     /* Vérification de la declaration */
                              if (rechercheType($1)==0) printf("Erreur semantique: %s non declare a la ligne %d\n",$1,nb_ligne);
                              if (rechercheType($3)==0) printf("Erreur semantique: %s non declare a la ligne %d\n",$3,nb_ligne);
}
       | idf '=' cst ';' 	 { /* Vérification de la declaration */
                              if (rechercheType($1)==0) printf("Erreur semantique: %s non declare a la ligne %d\n",$1,nb_ligne);
                              }  
;

instdiv: idf '=' idf '/' idf ';' {
                                          /* Vérification de la declaration */
                    if(rechercheType($1)==0) printf("Erreur semantique: %s non declare a la ligne %d\n",$1,nb_ligne);
                    if(rechercheType($3)==0) printf("Erreur semantique: %s non declare a la ligne %d\n",$3,nb_ligne);
                    }
       | idf '=' idf '/' cst ';' {
                           /* Vérification de la declaration */
                          if ($5==0) printf("Erreur semantique: Division par zero a la ligne %d\n",nb_ligne);
                          if(rechercheType($1)==0) printf("Erreur semantique: %s non declare a la ligne %d\n",$1,nb_ligne);
                          if(rechercheType($3)==0) printf("Erreur semantique: %s non declare a la ligne %d\n",$3,nb_ligne);
                          } 	
       
       ;
instadd: idf '=' idf '+' idf ';' {
                    if(rechercheType($1)==0) printf("Erreur semantique: %s non declare a la ligne %d\n",$1,nb_ligne);
                    if(rechercheType($3)==0) printf("Erreur semantique: %s non declare a la ligne %d\n",$3,nb_ligne);
                    if(rechercheType($5)==0) printf("Erreur semantique: %s non declare a la ligne %d\n",$5,nb_ligne);
                    }
      | idf '=' idf '+' cst ';'  {
                    if(rechercheType($1)==0) printf("Erreur semantique: %s non declare a la ligne %d\n",$1,nb_ligne);
                    if(rechercheType($3)==0) printf("Erreur semantique: %s non declare a la ligne %d\n",$3,nb_ligne);
                    }  
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
