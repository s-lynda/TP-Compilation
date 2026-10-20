/***
Analyseur lexicale pour les instructions suivantes: 
     x=x+2;
     z=z/2;
     y=y*6;
*****/

%{
    /* Declaration en C */
    #include<stdio.h>
    int nb_ligne=1;

%}
/* RegEx definition */

IDF [a-zA-Z]([a-zA-Z0-9])*
Number [0-9]+
%%
{IDF} {printf("IDF reconnu: %s\n",yytext);}
{Number} {printf("Num reconnu: %s\n",yytext);}
"=" {printf("%s\n",yytext);}
"+" {printf("%s\n",yytext);}
"/" {printf("%s\n",yytext);}
"*" {printf("%s\n",yytext);}
";" {printf("%s\n",yytext);}
[ \t]
\n {nb_ligne++;}
. {printf("Erreur lexicale sur l'entite %s a la ligne %d\n",yytext,nb_ligne);}
%%
int main(){
    yylex();
    return 0;
}
