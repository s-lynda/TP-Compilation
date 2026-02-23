%{
    /* Partie Declaration en c*/
    int nb_ligne=1;
%}
/*Partie Def des ER */
IDF     [a-zA-Z_][a-zA-Z0-9_]*
chaine \'[^\']*\' 
Nbr [0-9]+
/*commentaire sur 1 ligne*/
commentaire "//*"(.)*"*//"
/* Partie Regles de traduction*/
%%
Program    { printf("Mot cle : %s\n", yytext); }
DEC       { printf("Mot cle : %s\n", yytext); }
"int"      { printf("Mot cle : %s\n", yytext); }
"float"   { printf("Mot cle : %s\n", yytext); }
FinDEC { printf("Mot cle : %s\n", yytext); }
DebutProg { printf("Mot cle : %s\n", yytext); }
If       { printf("Mot cle : %s\n", yytext); }
Do      { printf("Mot cle : %s\n", yytext); }
Else      { printf("Mot cle : %s\n", yytext); }
FinProg { printf("Mot cle : %s\n", yytext); }
equal    { printf("Symbole : %s\n", yytext); }
{IDF}    { printf("IDF : %s\n", yytext); }
{chaine} { printf("Chaine : %s\n", yytext); }
{Nbr}    { printf("Nombre : %s\n", yytext); }
{commentaire} { printf("Commentaire : %s\n", yytext); }
[#|,(){}]    { printf("Symbole : %s\n", yytext); }
[ \t]     ;
\n {nb_ligne++;}
. { printf("Erreur lexicale sur l'entite %s a la ligne %d.\n", yytext, nb_ligne); }
%%
int main()
{
    yylex();
    return 0;
}