/* ------ Analyseur lexicale pour : x=5;  -------------*/
%{
    // Partie : Déclarations en C
        int nb_ligne=1;
%}
/* -- Partie : Expressions régulières -- */
lettre [a-zA-Z]
chiffre [0-9]
IDF {lettre}({lettre}|{chiffre})*
cst {chiffre}+
%%
{IDF} printf ("IDF ");
{cst} printf("cst ");
"="   printf ("aff ");
";" printf("pvg \n");
[ \t] 
\n {nb_ligne++; }
. printf("erreur lexicale a la ligne %d \n",nb_ligne) ;
%%

int main () 
{
    yylex () ;
    return 0;
}