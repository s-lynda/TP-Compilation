%{
 int nb_ligne=1;
%}
Nombre [0-9]+ 
Idf [a-zA-Z_][a-zA-Z0-9_]*
string \"[^"]*\"

%%
Programme {printf("Mot-cle : %s\n", yytext);}
entier {printf("Mot-cle : %s\n", yytext);}
String  {printf("Mot-cle : %s\n", yytext);}
si {printf("Mot-cle : %s\n", yytext);}
sinon {printf("Mot-cle : %s\n", yytext);}
alors {printf("Mot-cle : %s\n", yytext);}
{Idf} {printf("Identificateur : %s\n", yytext);}
{Nombre} {printf("Nombre : %s\n", yytext);}
{string} {printf("String : %s\n", yytext);}
":=" {printf("Symbole: %s\n", yytext);}
"<=" {printf("Symbole: %s\n", yytext);}
[(){}=;\[\]<>] {printf("Symbole: %s\n", yytext);}
[ \t]+ 
\n {nb_ligne++;}
. {printf("Erreur lexicale sur l'entite %s à la ligne %d\n", yytext, nb_ligne);}
%%
int main()
{
    yylex();
    return 0;
}
