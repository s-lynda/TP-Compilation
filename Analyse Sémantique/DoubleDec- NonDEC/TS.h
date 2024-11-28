#include <stdio.h>
#include <string.h>

//Declaration de la TS
typedef struct
{
  char NomEntite[20];
  char CodeEntite[20];
  char TypeEntite[20];
} TypeTS;

TypeTS ts[100];

// init compteur 
int CpTS = 0;
/* La fonction recherche : cherche si l'entite existe deja ou pas dans la table de symbole
retourne sa position  i:  si l'entite existe déjà 
Sinon  -1 ( c-a-d l'entite n'existe pas  )
*/
int recherche(char entite[])
{
  int i = 0;
  while (i < CpTS)
  {
    if (strcmp(entite, ts[i].NomEntite) == 0)
        return i;
    i++;
  }

  return -1;
}

//Fonction d'insertion des entités du programme dans la TS

void inserer(char entite[], char code[])
{
  if (recherche(entite) == -1)
  {
    strcpy(ts[CpTS].NomEntite, entite);
    strcpy(ts[CpTS].CodeEntite, code);
    CpTS++;
  }
}

//Fonction d'affichage de la TS
void afficher()
{
  printf("\n/***************Table des symboles ******************/\n");
  printf("__________________________________________________\n");
  printf("\t| NomEntite |  CodeEntite  | TypeEntite \n");
  printf("__________________________________________________\n");
  int i = 0;
  while (i < CpTS)
  {
    printf("\t|%10s |%12s  |%12s |\n", ts[i].NomEntite, ts[i].CodeEntite,ts[i].TypeEntite);
    i++;
  }
}

// fonction qui insère le type d'une etité une fois il va être reconu dans la syntaxe 
void insererType(char entite[], char type[])
{
    int posEntite=recherche(entite);
    if (posEntite!=-1) // si l'entité existe dans la TS
    { 
        strcpy(ts[posEntite].TypeEntite,type);
        //printf("lentite est %s, son type est %s\n",ts[posEntite].NomEntite,ts[posEntite].TypeEntite);
    }
}

// Fonction RechercheType : retourne le type de l'entité
int rechercheType(char entite[])
{
    int posEntite=recherche(entite);
    if(strcmp(ts[posEntite].TypeEntite,"")==0) return 0; // l'entité n'est pas encore déclarée
    else return -1; // elle est déclarée
}
