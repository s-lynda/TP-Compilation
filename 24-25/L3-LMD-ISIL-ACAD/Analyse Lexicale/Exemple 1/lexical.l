/* ------ Analyseur lexicale pour : x=5;  -------------*/
%{
    #include<stdio.h>
    // Partie : Déclarations en C
        int nb_ligne=1;
        int col=0;
%}
/* -- Partie : Expressions régulières -- */
lettre [a-zA-Z]
chiffre [0-9]
IDF {lettre}({lettre}|{chiffre})*
cst {chiffre}+
Comment1 "//".*
Comment2 "/*"([^*]|\*+[^*/])*\*+"/"
Comment3 "//"[^\n]*
/* -- Partie : Règles de production -- */
%%
{IDF} printf ("IDF ");
{cst} printf("cst ");
"="   printf ("aff ");
";" printf("pvg \n");
\\ printf("\n antislach reconnu\n");
\\\\ printf("\n double antislach reconnu\n");
"\"" printf("\n guillemet reconnu\n");
{Comment1} {printf("commentaire 1 reconnu\n");nb_ligne++;}
{Comment2} {printf("commentaire 2 reconnu\n");}
[ \t] 
\n {nb_ligne++;}
. {printf("erreur lexicale a la ligne %d \n",nb_ligne) ;}
%%
int main () 
{
    yylex () ;
    return 0;
}
