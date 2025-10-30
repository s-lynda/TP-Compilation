%{
  /* ---- Partie déclrations en C ----*/
  #include<stdio.h>
  int nb_ligne=1;
  int nb_colonne=1;
%}
/* ---- Partie définitions des ERs ----*/
IDF [a-zA-Z]([a-zA-Z0-9_])*
CST [0-9]+
chaine \"[^\"]*\"
cmnt "##".*
/* ---- Partie règles de traduction ----*/
%%
"MainProgram" {printf("MainProgram\n");nb_colonne+=yyleng;}
"Declaration" {printf("Dec\n");nb_colonne+=yyleng;}
"Entier" {printf("entier\n");nb_colonne+=yyleng;}
"Reel" {printf("reel\n");nb_colonne+=yyleng;}
"Body" {printf("Body\n");nb_colonne+=yyleng;}
"begin" {printf("begin\n");nb_colonne+=yyleng;}
"end" {printf("end\n");nb_colonne+=yyleng;}
{IDF} {if(yyleng<12) {printf("IDF valide\n"); nb_colonne+=yyleng;}
  else {printf("erreur lexicale: IDF %s est trop long a la ligne %d \n",yytext,nb_ligne);
}
}
{CST} {printf("cst\n");nb_colonne+=yyleng;}
{chaine} {printf("chaine\n"); nb_colonne+=yyleng;}
";" {printf("pvg\n");nb_colonne+=yyleng;}
"," {printf("vg\n");nb_colonne+=yyleng;}
":=" {printf("aff\n");nb_colonne+=yyleng;}
":" {printf("deux points\n");nb_colonne+=yyleng;}
"{" {printf("accod_ouv\n");nb_colonne+=yyleng;}
"}" {printf("accolade_fer\n");nb_colonne+=yyleng;}
"+" {printf("plus\n");nb_colonne+=yyleng;}
"*" {printf("mult\n");nb_colonne+=yyleng;}
"-"  {printf("moins\n");nb_colonne+=yyleng;}
"/" {printf("div\n");nb_colonne+=yyleng;}
"(" {printf("paren_ouv\n");nb_colonne+=yyleng;}
")" {printf("paren_fer\n");nb_colonne+=yyleng;}
{cmnt} {printf("ceci est un commentaire\n");}
[ \t]        { nb_colonne+=yyleng; }      
\n {nb_ligne++; nb_colonne=1;}
. {printf("Erreur lexicale sur l'entite %s a la ligne %d a la colonne %d\n",yytext,nb_ligne,nb_colonne); nb_colonne+=yyleng;}
%%
int main()
{

    yylex();
    return 0;
}
