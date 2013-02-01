/* QLA test code */
/* for indexed integer routines. */
/* C code generated by m4 from test_int_idx.m4 */

include(protocol_idx.m4)

`
#include <qla.h>
#include <stdio.h>
#include <string.h>
#include "compare.h"

int main(int argc, char *argv[]){

  QLA_Int sI1[MAX] = { 6188, -1038,  7359, -9607,  5032,
		9237,   3458, -2110, -6705, 10401};

  QLA_Int sI2[MAX] = {-2359, -6106, -5588, -6899, -5000,
		9789, -4457, 8602, 4282, 7920};
  
  QLA_Int sI3[MAX] = {-2359, -5632, -5588, -1155, 14546, 
		 21929, 7147, -26880, 4282, 5472};

  QLA_Int sI4       = -635;
  QLA_Int nI1[MAX] = { 3, 12, 7, 1, 5, 8, 3, 2, 1, 5};
  QLA_Int zI1[MAX] = { 3, 0, 7, 1, 0, 0, 3, 2, 1, 0};

  int dIx[MAX]  = {8,5,6,7,1,2,9,0,3,4};
  int sI1x[MAX] = {3,0,1,8,2,4,5,9,7,6};
  int sI2x[MAX] = {4,9,0,2,1,3,7,8,5,6};
  int sI3x[MAX] = {8,3,2,5,6,9,7,4,0,1};


  QLA_Int *sI1p[MAX], *sI2p[MAX], /**sI3p[MAX],*/ *nI1p[MAX], *zI1p[MAX];
  
  QLA_Int destI[MAX],chkI[MAX];

  QLA_RandomState destS[MAX], chkS[MAX];
  QLA_RandomState sS1[MAX], sS3[MAX], *sS1p[MAX];
  int sS1x[MAX] = {3,0,1,8,2,4,5,9,7,6};

  int i;

  char name[64];
  FILE *fp;

  char *test_program_name= basename(argv[0]); 
  test_program_name = strcat(test_program_name, ".result");
  if (NULL == (fp = fopen(test_program_name,"w"))) {
    fprintf(stderr, "Error in report function - cannot create \"%s\"\n", test_program_name);
    exit(-1);
  }

  for(i = 0; i < MAX; i++){
    sI1p[i] = &sI1[sI2x[i]];
    sI2p[i] = &sI2[sI3x[i]];
    //sI3p[i] = &sI3[sI1x[i]];
    nI1p[i] = &nI1[sI3x[i]];
    zI1p[i] = &zI1[sI2x[i]];
    sS1p[i] = &sS1[sS1x[i]];
  }

  /* Independent check of vector copy */

  strcpy(name,"QLA_I_veq_I");
  QLA_I_veq_I(destI,sI1,MAX);
  for(i = 0; i < MAX; i++){QLA_I_eq_I(&chkI[i],&sI1[i]);}
  checkeqidxII(chkI,destI,name,fp);

'

  /* Assignment */

unary(I,eq,I)
unary(I,peq,I)
unary(I,eqm,I)
unary(I,meq,I)

  /* Multiplication by constant */

binaryconst(I,eq_i_times,I,I)
binaryconst(I,peq_i_times,I,I)
binaryconst(I,eqm_i_times,I,I)
binaryconst(I,meq_i_times,I,I)

  /* Division */

binary(I,eq,I,divide,I,sI1,sI2);

  /* Addition, subtraction */

binary(I,eq,I,plus,I,sI1,sI2)
binary(I,eq,I,minus,I,sI1,sI2)
binary(I,eq,I,times,I,sI1,sI2)
binary(I,peq,I,times,I,sI1,sI2)
binary(I,eqm,I,times,I,sI1,sI2)
binary(I,meq,I,times,I,sI1,sI2)

  /* Ternary operations */

ternaryconst(I,eq_i_times,I,I,plus,I)
ternaryconst(I,eq_i_times,I,I,minus,I)

  /* Elementary Binary operations */

binary(I,eq,I,lshift,I,sI1,zI1)
binary(I,eq,I,rshift,I,sI1,zI1)
binary(I,eq,I,mod,I,sI1,nI1)
binary(I,eq,I,max,I,sI1,sI2)
binary(I,eq,I,min,I,sI1,sI2)

  /* Boolean operations */

binary(I,eq,I,eq,I,sI1,sI2)
binary(I,eq,I,ne,I,sI1,sI2)
binary(I,eq,I,gt,I,sI1,sI2)
binary(I,eq,I,lt,I,sI1,sI2)
binary(I,eq,I,ge,I,sI1,sI2)
binary(I,eq,I,le,I,sI1,sI2)
binary(I,eq,I,or,I,sI1,sI2)
binary(I,eq,I,and,I,sI1,sI2)
binary(I,eq,I,xor,I,sI1,sI2)
unary(I,eq_not,I)

  /* Copymask */

binary(I,eq,I,mask,I,sI1,zI1);
binary(S,eq,S,mask,I,sS1,zI1);

  /* Fills */

unaryconstzero(I,eq_zero)
unaryconst(I,eq_i)

  /* Seed random number generator */

unaryseed(S,eq_seed_i,I)

  /* Assignment */

unary(S,eq,S)
`
  return 0;
}
'
