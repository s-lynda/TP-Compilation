%{
 /* Dec en c*/
 #include <stdio.h>
 int nb_ligne=1;
 int nb_col=1;
%}
lettre [a-zA-Z]
chiffre [0-9]
IDF {lettre}({lettre}|{chiffre}|_)*
commentaire %%(.)*
CST {chiffre}+
REEL {chiffre}+\.{chiffre}+
%%
"Module" {printf("Mot cle : Module\n"); nb_col+=yyleng;} 
"Declare" {printf("Mot cle : Declare\n");  nb_col+=yyleng;}
"integer" {printf("Mot cle : integer\n"); nb_col+=yyleng;}
"real" {printf("Mot cle : real\n");  nb_col+=yyleng;}
"Run" {printf("Mot cle : Run\n");  nb_col+=yyleng;}
"StartBlock" {printf("Mot cle : StartBlock\n");  nb_col+=yyleng;}
"StopBlock" {printf("Mot cle : StopBlock\n");  nb_col+=yyleng;}

{IDF} {if(yyleng<20) {printf("Identificateur : %s\n",yytext); nb_col+=yyleng;} else 
        printf("Erreur : Identificateur %s trop long a la ligne %d\n",yytext,nb_ligne);
        }
{CST} {printf("Constante : %s\n",yytext); nb_col+=yyleng;}
{REEL} {printf("Reel : %s\n",yytext); nb_col+=yyleng;}
";" {printf("Symbole : ;\n"); nb_col+=yyleng;}
"," {printf("Symbole : ,\n");nb_col+=yyleng;}
"{" {printf("Symbole : {\n"); nb_col+=yyleng;}
"}" {printf("Symbole : }\n"); nb_col+=yyleng;}
"(" {printf("Symbole : (\n"); nb_col+=yyleng;}
")" {printf("Symbole : )\n"); nb_col+=yyleng;}
":" {printf("Symbole : :\n"); nb_col+=yyleng;}
"=" {printf("Symbole : =\n"); nb_col+=yyleng;}
"*" {printf("Symbole : *\n"); nb_col+=yyleng;}
"+" {printf("Symbole : +\n"); nb_col+=yyleng;}
"-" {printf("Symbole : -\n"); nb_col+=yyleng;}
"/" {printf("Symbole : /\n"); nb_col+=yyleng;}
\n {nb_ligne++; nb_col=1;}
{commentaire} {printf("%s\n",yytext);}
[ \t]  {nb_col+=yyleng;};
. {printf("Erreur lexicale : %s a la ligne %da la colonne %d\n",yytext,nb_ligne,nb_col);nb_col+=yyleng;}
%%
main()
{
    yylex();
}
