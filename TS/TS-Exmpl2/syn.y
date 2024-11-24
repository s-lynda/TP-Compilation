%{
    int nb_ligne=1, Col=1;
%}

%union {
         int     entier;
         char*   str;
         float reel;
}

%token mc_import mc_stdio mc_array mc_pgm mc_entier  mc_var mc_const divis
       diaz acco accf dpt eg aff crov crfm fin sep
%token <str> idf <entier> cst
%start S
%%
S: LIST_BIB mc_pgm idf acco Program accf { printf(" Le programme est syntaxiquement correcte.\n"); YYACCEPT; }
;

Program: LISTE_DEC LISTE_INSTR
;
	
LISTE_DEC: DEC  LISTE_DEC 
        |
;

DEC: DEC_VAR 
    |DEC_CONST
;
DEC_VAR: mc_var TYPE dpt LIST_IDF fin 
        | mc_var TYPE dpt DEC_TAB fin 
;        
DEC_TAB: idf crov cst crfm 
;		
DEC_CONST: mc_const TYPE dpt LIST_IDF_CST fin
;

LIST_IDF_CST : idf eg cst sep  LIST_IDF_CST
              | idf eg cst
;

LIST_IDF: idf sep LIST_IDF 
        | idf
;	
TYPE: mc_entier
;	  
LISTE_INSTR: INST_AFF LISTE_INSTR
            |                                           
;		                                  

INST_AFF: idf aff EXPRESSION fin 
;

EXPRESSION: idf 
          | cst
	  | idf  divis cst {
		                          if ($3==0) printf(" Erreur  semantique a ligne %d a la colonne %d: div par 0 \n", nb_ligne,Col);                                   
								  else  printf("la div de %s par %d \n ", $1,$3);         
		  
		                     }
		      
;

LIST_BIB: BIB LIST_BIB
        | 
;		

BIB: diaz mc_import NOM_BIB 
;

NOM_BIB: mc_array
        |mc_stdio
;
%%
main ()
{
   initialization();
   yyparse(); 
   afficher();
 }
yywrap ()
 {}
int yyerror ( char*  msg )  
{
    printf ("Erreur Syntaxique a ligne %d a colonne %d \n", nb_ligne,Col);
}
 
 