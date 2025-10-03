%{  
 #include "syntax.tab.h"   
 extern int nb_ligne;
 extern int col;
%}
/* %option noyywrap : si on souhaite désactiver yywrap => On ne va pas la définir*/
lettre [a-zA-Z]
chiffre [0-9]
IDF ({lettre})({lettre}|{chiffre})*
Entier [0-9]+
comment "#"[^#\n]*
chaine \'[^\']*\'

%%
"PROGRAM" { col += yyleng;  return mc_p;}
"int" {col += yyleng;  return mc_int;}
"IF" {col += yyleng; return mc_if;}
"ELSE" {col += yyleng; return mc_else;}
"Do" {col += yyleng;  return mc_do;}
"print" {col += yyleng;  return mc_print;}
{IDF} { 
    col += yyleng;  
    //printf("idf reconnu: %s (longueur: %d)\n", yytext, yyleng);
    return idf; 
}

{chaine} { col += yyleng; return chaine;}
{Entier} { col += yyleng; return entier;}  
"[" {col += yyleng;  return cro;}
"]" {col += yyleng; return crf;}
"==" {col += yyleng; return egal;}
[{},=()] {col += yyleng; return yytext[0];}
{comment} {printf("commentaire sur 1 seule ligne:  %d\n",nb_ligne); }
[ \t] {col += yyleng;}
\n {col=1;nb_ligne++;}
. {printf("Erreur lexique: %s a la ligne %d a la colonne %d\n",yytext,nb_ligne, col);}
%%