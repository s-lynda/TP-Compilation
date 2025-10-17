%{
    /*  Partie déclaration en C*/
#include <stdio.h>
int nb_ligne=1;
%}
/* Partie : Expressions régulières */

lettre [a-zA-Z]
chiffre [0-9]
IDF {lettre}({lettre}|{chiffre})*
cst {chiffre}+
/* -- Partie : Règles de traduction -- */
%%
"main" {printf("MAIN\n");}
"(" {printf("OPEN_PARENTHESIS\n");}
")" {printf("CLOSE_PARENTHESIS\n");}
"{" {printf("OPEN_BRACE\n");}
"}" {printf("CLOSE_BRACE\n");}
";" {printf("SEMI_COLON\n");}
"=" {printf("ASSIGN_OP\n");}
"\\" {printf("BACKSLASH\n");}
"\\\\" {printf("DOUBLE_BACKSLASH\n");}
"\"" {printf("QUOTE\n");}   
{IDF} {printf("IDENTIFIER\n");}
{cst} {printf("NUMBER\n");}
[ \t]
\n {nb_ligne++;}
. {printf("Lexical error at line %d \n",nb_ligne) ;}
%%
int main ()
{
    yylex ();
    return 0;
}
