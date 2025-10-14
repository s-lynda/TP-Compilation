%{
  /*---- 
  => Flex lit le fichier d’entrée (test.txt) au lieu de lire le texte directement au clavier.  
  => La variable yyin sert à rediriger l’entrée du scanner vers un fichier.
  ----*/
#include<stdio.h>
int nb_ligne=1;  
%}
lettre [a-zA-Z]
chiffre [0-9]
IDF {lettre}({lettre}|{chiffre})*
cst {chiffre}+
%%
{IDF}   printf(" IDF reconnu %s \n",yytext);
{cst}   printf(" CST reconnu\n");
"="    printf(" = reconnu\n");
";"    printf(" ; reconnu\n");
[ \t]
\n nb_ligne++;
. printf("Erreur lexicale a la ligne %d \n",nb_ligne) ;
%%
int main( )
{
 yyin = fopen( "test.txt", "r" );
 if (yyin==NULL) printf("ERROR \n");
   else yylex();
}
