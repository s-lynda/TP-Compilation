/* ---- Analyseur lexiale pour : x=5; avec les fonctions de Flex */
%{
#include<stdio.h>
int nb_ligne=1;    
%}

lettre [a-zA-Z]
chiffre [0-9]
IDF {lettre}({lettre}|{chiffre})*
cst {chiffre}+
%%
{IDF}  		printf(" IDF reconnu %s \n",yytext);
{cst} 		printf(" CST reconnu\n");
"="  		printf(" = reconnu\n");
";"  		printf(" ; reconnu\n");
[ \t]
\n nb_ligne++;
. printf("erreur lexicale a la ligne %d \n",nb_ligne) ;
%%
int  main( )
{
  yyin = fopen( "test.txt", "r" );
  if (yyin==NULL) printf("ERROR  \n");
     else yylex();
}

