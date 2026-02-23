
#include<stdio.h>
#include<stdlib.h>
#include<string.h>

//Declaration de la structure quadruplets
typedef struct{
    char oper[100]; 
    char op1[100];   
    char op2[100];   
    char res[100];  
}qdr;

qdr quad[1000];

// Compteur de quadruplet
extern int qc;

/*1- Fonction d'ajout d'un quadruplet à une table de quadruplets */
void quadr(char opr[],char op1[],char op2[],char res[])
{
	strcpy(quad[qc].oper,opr);
	strcpy(quad[qc].op1,op1);
	strcpy(quad[qc].op2,op2);
	strcpy(quad[qc].res,res);
  qc++;
}

/* 2- Fonction qui permet de mettre à jour les quadruplets 
selon la position : (0,1,2,3) 
*/
void updateQuad(int num_quad, int colon_quad, char val [])
{
  if (colon_quad==0) strcpy(quad[num_quad].oper,val);
  else if (colon_quad==1) strcpy(quad[num_quad].op1,val);
          else if (colon_quad==2) strcpy(quad[num_quad].op2,val);
                    else if (colon_quad==3) strcpy(quad[num_quad].res,val);
}

/* Fonction d'affichage des quadruplets générés */
void afficher_qdr()
{
  printf("*********************Les Quadruplets***********************\n");
  printf("____________________________________________________________\n");
  int i;
  for(i=0;i<qc;i++)
  {
  printf("\n %d - ( %s  ,  %s  ,  %s  ,  %s )",i,quad[i].oper,quad[i].op1,quad[i].op2,quad[i].res); 
  printf("\n--------------------------------------------------------\n");
  }
}

