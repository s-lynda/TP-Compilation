%{
   extern int nb_ligne;
   extern int Col;
   #include "syn.tab.h"
   #include "TS.h"
	extern YYSTYPE yylval;
%}
lettreM [A-Z]
lettre [a-zA-Z]
chiffre [0-9]
IDF {lettreM}({lettre}|{chiffre}|_)*
cst {chiffre}+
%%
Programme { rechercher(yytext,"Mot cle",0,"", 2); Col= Col + strlen(yytext); printf (" L'entite reconnue est %s \n", yytext); return mc_pgm;  }
INTEGER   { rechercher(yytext,"Mot cle",0,"", 2); Col= Col + strlen(yytext); printf (" L'entite reconnue est %s \n", yytext); return mc_entier; }
VAR       { rechercher(yytext,"Mot cle",0,"", 2); Col= Col + strlen(yytext); printf (" L'entite reconnue est %s \n", yytext); return mc_var ;}
CONST     { rechercher(yytext,"Mot cle",0,"", 2); Col= Col + strlen(yytext); printf (" L'entite reconnue est %s \n", yytext); return mc_const; }
{IDF}     { 
              yylval.str=strdup(yytext);
			  rechercher(yytext,"IDF","","",1);  
              Col= Col + strlen(yytext);
			  if (yyleng>10) printf ("Erreur Lexical: IDF trop long a la ligne %d a la colonne %d \n",nb_ligne, Col);
              else{printf (" L'entite reconnue est %s \n", yytext); 
			  return idf;
              }
		  }
{cst}     { 
              yylval.entier=atoi(yytext);
              Col= Col + strlen(yytext); 
			  printf (" L'entite reconnue est %s \n", yytext);
			  return cst;
		  }
"/"       { rechercher(yytext,"Separateur",0,"",3); Col= Col + strlen(yytext); printf(" L'entite reconnue est %s\n", yytext);  return divis;}
"#"       { rechercher(yytext,"Separateur",0,"",3); Col= Col + strlen(yytext); printf(" L'entite reconnue est %s\n", yytext);  return diaz;}
"{"       { rechercher(yytext,"Separateur",0,"",3); Col= Col + strlen(yytext); printf(" L'entite reconnue est %s\n", yytext);  return acco;}
"}"       { rechercher(yytext,"Separateur",0,"",3); Col= Col + strlen(yytext); printf(" L'entite reconnue est %s\n", yytext);  return accf;}
":"       { rechercher(yytext,"Separateur",0,"",3); Col= Col + strlen(yytext); printf(" L'entite reconnue est %s\n", yytext);  return dpt;}
"="       { rechercher(yytext,"Separateur",0,"",3); Col= Col + strlen(yytext); printf(" L'entite  reconnue est %s \n", yytext); return eg; }
":="      { rechercher(yytext,"Separateur",0,"",3); Col= Col + strlen(yytext); printf(" L'entite  reconnue est %s \n", yytext); return aff;}
"["       { rechercher(yytext,"Separateur",0,"",3); Col= Col + strlen(yytext);printf(" L'entite  reconnue est %s \n", yytext); return crov;}
"]"       { rechercher(yytext,"Separateur",0,"",3); Col= Col + strlen(yytext);printf(" L'entite  reconnue est %s \n", yytext);return crfm;}
"$"       { rechercher(yytext,"Separateur",0,"",3); Col= Col + strlen(yytext);printf(" L'entite  reconnue est %s \n", yytext);return fin;}
"//"      { rechercher(yytext,"Separateur",0,"",3); Col= Col + strlen(yytext);printf(" L'entite  reconnue est %s \n", yytext); return sep;}
[ \t]     {Col= Col + strlen(yytext);}
\n        {Col= 1; nb_ligne++;} 
. printf ("Entité  non reconnue a ligne %d a la colonne %d \n", nb_ligne, Col);
%%