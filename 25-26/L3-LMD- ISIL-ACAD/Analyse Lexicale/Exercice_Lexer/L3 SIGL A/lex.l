%{
 // Partie dec en C
    #include <stdio.h>
    int nb_ligne=1;
    int nb_colonne=1;

%}
commentaire "%%".*
IDF [a-zA-Z][a-zA-Z0-9_]*
VALEUR [0-9]+(\.[0-9]+)?
CHAINE \"[^\"]*\"
%%
"VAR_SECTION" {printf("VAR_SECTION\n");nb_colonne+=yyleng;}
"Integer" {printf("Integer\n");nb_colonne+=yyleng;}
"Reel" {printf("Reel\n");nb_colonne+=yyleng;}
"CODE_SECTION" { printf("CODE_SECTION\n");nb_colonne+=yyleng;}
"EndProgram" {printf("EndProgram\n");nb_colonne+=yyleng;}
"{" {printf("OPEN_BRACE\n");nb_colonne+=yyleng;}
"}" {printf("CLOSE_BRACE\n");nb_colonne+=yyleng;}
"<-" {printf("ASSIGN\n");nb_colonne+=yyleng;}
";" {printf("SEMICOLON\n");nb_colonne+=yyleng;}
"," {printf("COMMA\n");nb_colonne+=yyleng;}
"*" {printf("MULTIPLY\n");nb_colonne+=yyleng;}
"+" {printf("PLUS\n");nb_colonne+=yyleng;}
"/" {printf("DIVIDE\n");nb_colonne+=yyleng;}
"-" {printf("MINUS\n");nb_colonne+=yyleng;}
"(" {printf("OPEN_PAREN\n");nb_colonne+=yyleng;}
")" {printf("CLOSE_PAREN\n");nb_colonne+=yyleng;}
{commentaire} {printf("COMMENT\n");}
{IDF} {printf("IDF(%s)\n", yytext);nb_colonne+=yyleng;}
{VALEUR} {printf("VALEUR(%s)\n", yytext);nb_colonne+=yyleng;}
{CHAINE} {printf("CHAINE(%s)\n", yytext);nb_colonne+=yyleng;}
[ \t] {nb_colonne+=yyleng;} 
\n {nb_ligne++; nb_colonne=1;}
. {printf("CARACTERE_INCONNU(%s) ligne %d colonne %d\n", yytext, nb_ligne, nb_colonne);nb_colonne+=yyleng; }
%%
main()
{
    yylex();
}
