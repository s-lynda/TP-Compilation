%{
      /* ---- Partie déclrations en C ----*/
    #include<stdio.h>
    int nb_ligne=1;
    int nb_colonne=1;
%}
/* ---- Partie définitions des ERs ----*/
IDF [a-zA-Z]([a-zA-Z0-9_])*
cmntr "//".*
CST [0-9]+
chaine \'[^\']*\'
/* ---- Partie règles de traduction ----*/
%%
"Script" {printf("script\n"); nb_colonne+=yyleng;}
"Vars" {printf("vard\n"); nb_colonne+=yyleng;}
"Int" {printf("int\n"); nb_colonne+=yyleng;}
"Real" {printf("real\n");nb_colonne+=yyleng;}
"Code" {printf("code\n");nb_colonne+=yyleng;}
"Begin" {printf("begin\n");nb_colonne+=yyleng;}
"Finish" {printf("finish\n");nb_colonne+=yyleng;}
{IDF} {if(yyleng<14){printf("IDF valide\n");nb_colonne+=yyleng;}else{printf("Erreur lexicale: idf %s trop long a la ligne %d\n",yytext,nb_ligne);}}
{cmntr} {printf("ceci est un commentaire\n");}
{CST} {printf("constante\n");nb_colonne+=yyleng;}
{chaine} {printf("chaine\n");nb_colonne+=yyleng;}
"," {printf("vg\n");nb_colonne+=yyleng;}
":" {printf("deux points\n"); nb_colonne+=yyleng;}
";" {printf("pvg\n");nb_colonne+=yyleng;}
"{" {printf("acc_ouv\n");nb_colonne+=yyleng;}
"}" {printf("acc_fer\n");nb_colonne+=yyleng;}
"(" {printf("par_ouv\n");nb_colonne+=yyleng;}
")" {printf("par_fer\n");nb_colonne+=yyleng;}
":=" {printf("aff\n");nb_colonne+=yyleng;}
"/" {printf("div\n");nb_colonne+=yyleng;}
"*" {printf("mult\n");nb_colonne+=yyleng;}
"+" {printf("plus\n");nb_colonne+=yyleng;}
[ \t] {nb_colonne+=yyleng;}
\n {nb_ligne++;nb_colonne=1;}
. {printf("Erreur lexicale sur l'entite %s a la ligne %d a la colonne %d\n",yytext,nb_ligne,nb_colonne);nb_colonne+=yyleng;}

%%
int main()
{
    yylex();
    return 0;
}
