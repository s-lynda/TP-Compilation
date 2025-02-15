/* Analyseur Lexicale pour le code source suivant: printf("Entrez votre nom : "); */

%{
    #include<stdio.h>
    int nb_ligne=1;

%}  
/* -- Partie : Expressions régulières -- */
chaine \"[^\"]*\"
%%
"printf" {printf("Mot cle printf\n");}
"(" printf("Parenthese ouvrante\n");
")" printf("Parenthese fermante\n");
";" printf("Point virgule\n");
\" printf("Guillemets\n"); 
{chaine} printf("Chaine de caractere\n");
[ \t] ;
\n {nb_ligne++;} 
. printf("Erreur lexicale a la ligne %d\n",nb_ligne);
%%
int main()
{
    yylex();
    return 0;
}
