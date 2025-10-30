%{
    /* ---- Partie déclrations en C ----*/
    #include<stdio.h>
    int nb_ligne=1;
    int nb_colonne=1;
%}
/* ---- Partie définitions des ERs ----*/
IDF [a-zA-Z]([a-zA-Z0-9_])*
cmntr "##".*
CST [0-9]+
reel [0-9]+"."[0-9]+
chaine \'[^\']*\'
/* ---- Partie règles de traduction ----*/
%%
"Program" {printf("Program\n"); nb_colonne+=yyleng;}
"Define" {printf("Define\n"); nb_colonne+=yyleng;}
"Integer" {printf("Integer\n"); nb_colonne+=yyleng;}
"Float" {printf("Float\n");nb_colonne+=yyleng;}
"Execute" {printf("Execute\n");nb_colonne+=yyleng;}
"Start" {printf("start\n");nb_colonne+=yyleng;}
"End" {printf("end\n");nb_colonne+=yyleng;}
{IDF} {if(yyleng<12){printf("IDF valide\n");nb_colonne+=yyleng;}else{printf("Erreur lexicale: idf %s trop long a la ligne %d\n",yytext,nb_ligne);}}
{cmntr} {printf("ceci est un commentaire\n");}
{CST} {printf("constante\n");nb_colonne+=yyleng;}
{chaine} {printf("chaine\n");nb_colonne+=yyleng;}
{reel} {printf("reel\n");nb_colonne+=yyleng;}
"," {printf("vg\n");nb_colonne+=yyleng;}
":" {printf("deux points\n"); nb_colonne+=yyleng;}
";" {printf("pvg\n");nb_colonne+=yyleng;}
"{" {printf("acc_ouv\n");nb_colonne+=yyleng;}
"}" {printf("acc_fer\n");nb_colonne+=yyleng;}
"(" {printf("par_ouv\n");nb_colonne+=yyleng;}
")" {printf("par_fer\n");nb_colonne+=yyleng;}
":=" {printf("aff\n");nb_colonne+=yyleng;}
"*" {printf("mult\n");nb_colonne+=yyleng;}
"+" {printf("plus\n");nb_colonne+=yyleng;}
"-" {printf("moins\n");nb_colonne+=yyleng;}
[ \t] {nb_colonne+=yyleng;}
\n {nb_ligne++;nb_colonne=1;}
. {printf("Erreur lexicale sur l'entite %s a la ligne %d a la colonne %d\n",yytext,nb_ligne,nb_colonne);nb_colonne+=yyleng;}
%%
int main()
{
    yylex();
    return 0;
}

