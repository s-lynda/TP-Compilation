%{
  /*
   TO DO: 
   - Add else instruction.
   - Make changements to the grammar to allow these type of instruction and more: 
     y = g+3 - (y+4) * 2 / (r+3);
   - Conditions with more than 2 operands: 
     if (x>y) && (y>z) { ... }
  */
  #include <stdio.h>
  #include "parser.tab.h"
  int nb_ligne=1;
  int col=1;
%}
IDF [a-zA-Z][a-zA-Z0-9_]*
Nbr [0-9]+
%%
DEC {printf("\nKW %s ", yytext);col += yyleng; return mc_dec;}
Integer {printf("\nINT %s ", yytext);col += yyleng; return integer;}
INSTR {printf("\nKW %s ", yytext); col += yyleng; return instr;}
Do {printf("\nKW %s ", yytext); col+=yyleng; return mc_do;}
While {printf("\nKW %s ", yytext);col += yyleng; return mc_while;}
If {printf("\nKW %s ", yytext);col += yyleng; return mc_if;}
endIF {printf("\nKW %s ", yytext);col += yyleng; return endIf;}
ENDP {printf("\nKW %s ", yytext);col += yyleng; return endp;}
{IDF} {printf("\nIDF %s ", yytext);col += yyleng; return idf;}
{Nbr} {printf("\nNBR %s ", yytext);col += yyleng; return nbr;}
[-+*:.,;(){}>=] { printf("\nSEP %c ", yytext[0]); col += yyleng; return yytext[0];}
[ \t] {col += yyleng;} 
\n {nb_ligne++; col=1;} 
. {printf("\nErreur lexicale sur l entite %s a la ligne %d a la colonne %d\n", yytext, nb_ligne, col);col += yyleng;}
%%