/* ---------  Analyseur lexicale pour: x=5; y=5.5; -----------*/
%{
        int nb_ligne=1;
%}
/* Partie : Expressions régulières */
lettre [a-zA-Z]
chiffre [0-9]
IDF {lettre}({lettre}|{chiffre})*
cst {chiffre}+
/* Expression régulière pour un nombre réel */
reel {chiffre}+"."+{chiffre}+
%%
{IDF}  {printf ("%s  ",yytext);}
{reel} { printf ("%s  ",yytext);}
{cst}  {printf ("%s  ", yytext);}
= printf ("aff ");
; printf ("pvg ");
[ \t] 
\n   {nb_ligne++; }
.  printf("erreur lexicale à la ligne %d \n", nb_ligne) ;
%%
int main() 
{
   yylex();
  return 0;
}

