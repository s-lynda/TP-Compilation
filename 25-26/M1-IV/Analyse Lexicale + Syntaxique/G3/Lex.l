%{
int nb_ligne=1;
%}
IDF [a-zA-Z_][a-zA-Z0-9_]*
chaine \"[^\"]*\"
Nbr [0-9]+
%%
Declaration {printf("Mot Cle: %s\n",yytext);}
Code {printf("Mot Cle: %s\n",yytext);}
"int" {printf("Mot Cle: %s\n",yytext);}
"float" {printf("Mot Cle: %s\n",yytext);}
IF {printf("Mot Cle: %s\n",yytext);}
Do {printf("Mot Cle: %s\n",yytext);}
END {printf("Mot Cle: %s\n",yytext);}
{IDF} {printf("IDF: %s\n",yytext);}
{Nbr} {printf("Nombre: %s\n",yytext);}
"<=" {printf("Operateur: %s\n",yytext);}
[-,;:>{}()*/+] {printf("Symbole: %s\n",yytext);}
{chaine} {printf("Chaine: %s\n",yytext);}
[ \t] ;
\n {nb_ligne++;}
. {printf("Erreur lexicale a la ligne %d: %s\n",nb_ligne,yytext);}
%%
int main()
{
    yylex();
    return 0;
}
