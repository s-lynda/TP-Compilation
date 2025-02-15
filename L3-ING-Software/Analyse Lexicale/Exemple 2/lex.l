/* Analyseur lexicale pour: x = x+1-2.4 ; */
%{
        int nb_ligne=1;
        int col=1;
%}
/* Partie : Expressions régulières */
lettre [a-zA-Z]
chiffre [0-9]
IDF {lettre}({lettre}|{chiffre})*
cst {chiffre}+
/* Expression régulière pour un nombre réel */
reel {chiffre}+"."+{chiffre}+
%%
{IDF}  {printf ("%s  ",yytext); col+=col;}
{reel} { printf ("%s  ",yytext); col+=col;}
{cst}  {printf ("%s ", yytext); col+=col;}
"+" {printf ("add "); col+=col;}
"-" {printf ("sous ");col+=col;}
= {printf ("aff ");col+=col;}
; {printf ("pvg\n");col+=col;}
[ \t] {col+=col;}
\n   {nb_ligne++; col=1;}
.  printf("\n-erreur lexicale sur l'entite %s a la ligne %d a la colonne %d.\n", yytext,nb_ligne,col);
%%
int main() 
{
  yylex();
  return 0;
}
