/* ------ Analyseur lexicale pour : int x=3; 

-------------*/
%{
    #include<stdio.h>
    // Partie : Déclarations en C
    int nb_ligne=1;
%}

/* -- Partie : Expressions régulières -- */
lettre [a-zA-Z]
chiffre [0-9]
IDF {lettre}({lettre}|{chiffre})*
cst {chiffre}+

/* -- Partie : Règles de traduction -- */
%%
"int" printf("KEYWORD\n");
{IDF} printf ("IDENTIFIER: %s\n",yytext);
{cst} printf("NUMBER\n");
"="   printf ("ASSIGN_OP\n");
";" printf("SEMI_COLON\n");
[ \t] 
\n {nb_ligne++;}
. {printf("Erreur lexicale a la ligne %d sur l entite %s \n",nb_ligne,yytext) ;}
%%
int main () 
{
    /* lancement de l'analyse lexicale */
    yylex () ;
    return 0;
}
