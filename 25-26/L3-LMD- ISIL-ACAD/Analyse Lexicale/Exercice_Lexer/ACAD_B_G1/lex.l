%{
      /* ---- Partie déclrations en C ----*/

    #include<stdio.h>
    int nb_ligne=1;
    int nb_colonne=1;
%}
/* ---- Partie définitions des ERs ----*/
IDF [a-zA-Z]([a-zA-Z0-9_])*
CST [0-9]+
cmntr "%%".*
reel [0-9]+"."[0-9]+
chaine \"[^\"]*\"
  /* ---- Partie règles de traduction ----*/
%%
"Main" {printf("key Main\n");nb_colonne+=yyleng;}
"Section Variables" {printf("KEY var\n");nb_colonne+=yyleng;}
"Integer" {printf("key int\n");nb_colonne+=yyleng;}
"Float" {printf("float\n");nb_colonne+=yyleng;}
"Section Code" {printf("key code\n");nb_colonne+=yyleng;}
"Start" {printf("start\n");nb_colonne+=yyleng;}
"Stop" {printf("stop\n");nb_colonne+=yyleng;}
{IDF} {if(yyleng<10){printf("IDF valide\n");nb_colonne+=yyleng;}else{printf("erreur lexicale: IDF %s trop long  a la ligne %d\n",yytext,nb_ligne);}
}
{chaine} {printf("chaine\n"); nb_colonne+=yyleng;}
{cmntr} {printf("ceci est un cmntr\n");}
{CST} {printf("cst\n");nb_colonne+=yyleng;}
{reel} {printf("reeel\n");nb_colonne+=yyleng;}
";" {printf("pvg\n ");nb_colonne+=yyleng;}
"," {printf("vg\n");nb_colonne+=yyleng;}
":" {printf("deux pts\n");nb_colonne+=yyleng;}
"{" {printf("acc_ouv\n");nb_colonne+=yyleng;}
"}" {printf("acc_fer\n");nb_colonne+=yyleng;}
":=" {printf("aff\n");nb_colonne+=yyleng;}
"*" {printf("mult\n");nb_colonne+=yyleng;}
"+" {printf("plus\n");nb_colonne+=yyleng;}
"(" {printf("par_ouv\n");nb_colonne+=yyleng;}
")" {printf("par_fer\n");nb_colonne+=yyleng;}
"/" {printf("div\n");nb_colonne+=yyleng;}
[ \t] {nb_colonne+=yyleng;}
\n {nb_ligne++;nb_colonne=1;}
. {printf("erreur lexicale sur l'entite %s a la ligne %d a la colonne %d \n",yytext,nb_ligne,nb_colonne); nb_colonne+=yyleng;}
%%
int main()
{
    yylex();
    return 0;
}
