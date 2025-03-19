%{
int Fin_if=0,deb_else=0; // Variables utiliser pour sauvegarder le numero d'un quadruplet 
int qc=0; // Compteur de quadruplet
char tmp [20]; 
int nb_ligne=1;
%}
%start inst_if
%union {
int num;
char* str;
}
%token <str>idf <num>cst mc_if mc_else
%% 
inst_if: B mc_else inst_aff{  //R3
                              sprintf(tmp,"%d",qc);  
                              updateQuad(Fin_if,1,tmp); // je dois mettre a jour le branchement de la fin du if
                              printf("Programme syntaxiquement correct..\n");
                           }
;
                                                                    		
B: A inst_aff  {  //R2
                  Fin_if=qc; 
                  quadr("BR","","vide", "vide"); // c'est un branchement vers la fin, au debut le 2 eme champs est vide
				      sprintf(tmp,"%d",qc); 
                  updateQuad(deb_else,1,tmp); // je dois mettre a jour le branchement de l'else
                                             // 1: c'est dans la position 1 c a d le 2 eme champs du quadruplet
				   }
;    


A:mc_if '(' cond ')'{  //R1
                        deb_else=qc; 
                        // on laisse le deuxième champs vide, on le remplira après
                       quadr("BZ","","temp_cond", "vide"); 
                    }
;



inst_aff: idf '=' cst ';' {  
                             sprintf(tmp,"%d",$3);  
                             quadr("=",tmp,"vide",$1);  
                           } 
;
cond: 'v';
%%
main()
{
yyparse();
afficher_qdr();
}
yywrap()
{}

