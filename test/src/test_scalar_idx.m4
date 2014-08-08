/* QLA test code */
/* for indexed scalar routines. */
/* C code generated by m4 from test_scalar_idx.m4 */

include(protocol_idx.m4)

#include <qla.h>
#include <qla_d.h>
#include <stdio.h>
#include <string.h>
#include <math.h>
#include <time.h>
#include "compare.h"

#define arrayr(t,v,n) t *v=(t*)amalloc(n*sizeof(t),ealign*sizeof(QLA_Real))
#define arrayc(t,v,n) t *v=(t*)amalloc(n*sizeof(t),ealign*sizeof(QLA_Complex))
#define arrayrq(t,v,n) t *v=(t*)amalloc(n*sizeof(t),ealign*sizeof(QLA_Q_Real))
#define arraycq(t,v,n) t *v=(t*)amalloc(n*sizeof(t),ealign*sizeof(QLA_Q_Complex))
static void *
amalloc(size_t n, size_t align)
{
  size_t a2 = 2*align;
  void *t = malloc(n+a2);
  //fprintf(stderr, "align: %i  t: %p\n", (int)align, t);
  size_t endbits = ((size_t)t) & (a2-1);
  size_t offset = ((a2 + align) - endbits) % a2;
  //fprintf(stderr, "align: %i  offset: %i\n", (int)align, (int)offset);
  return (void*)(offset + (char*)t);
}

void
runtest(FILE *fp, int ealign)
{
#define QLA_DF_r_eq_I_dot_I QLA_D_r_eq_I_dot_I
#define QLA_QD_r_eq_I_dot_I QLA_D_r_eq_I_dot_I

#define QLA_PRF(x) QLA_DF_ ## x
#define QLA_PRD(x) QLA_QD_ ## x

#if ( QLA_Precision != 'Q' )  /* Q precision is limited to assignments */

#if (QLA_Precision == 1) || (QLA_Precision == 'F')
#define QLA_PR(x) QLA_DF_ ## x
  QLA_D_Real destrP, chkrP;
  QLA_D_Complex destcP, chkcP;
#else
#define QLA_PR(x) QLA_QD_ ## x
  QLA_Q_Real destrP, chkrP;
  QLA_Q_Complex destcP, chkcP;
#endif

  QLA_Real sR4       = -1.635;

  arraycq(QLA_Q_Complex, chkCQ, MAX);
  QLA_Int destI[MAX], chkI[MAX];

  QLA_Real destr,chkr;
  QLA_D_Real destrD,chkrD;
  QLA_Complex destc,chkc;
  QLA_Q_Real chkrQ;
  QLA_Q_Complex chkcQ;

  QLA_Real sC4re      = 831.2;
  QLA_Real sC4im      = -701.;
  QLA_Complex sC4;

  arrayr(QLA_Real, sR2, MAX);
  arrayr(QLA_Real, sC2re, MAX);
  arrayr(QLA_Real, sC2im, MAX);
  arrayc(QLA_Complex, sC2, MAX);
  int zI1[MAX] = { 3, 0, 7, 1, 0, 0, 3, 2, 1, 0};
  QLA_Int sI1[MAX] = { 61, -10,  73, -96,  50,
  		   92,  34, -21, -67, 104};
  QLA_Int sI2[MAX] = {-2359, -6106, -5588, -6899, -5000,
		9789, -4457, 8602, 4282, 7920};
  QLA_Int sI3[MAX] = { 92,  34, -21, -67, 104,
		   61, -10,  73, -96,  50};
  int sR3x[MAX] = {8,3,2,5,6,9,7,4,0,1};
  int sC2x[MAX] = {4,9,0,2,1,3,7,8,5,6};
  int sI1x[MAX] = {4,9,0,2,1,3,7,8,5,6};
  int sI2x[MAX] = {4,9,0,2,1,3,7,8,5,6};
  int sI3x[MAX] = {8,3,2,5,6,9,7,4,0,1};

  QLA_Int *zI1p[MAX];
  QLA_Int *sI1p[MAX], *sI2p[MAX], *sI3p[MAX];
  QLA_Real *sR2p[MAX], *sR3p[MAX];
  QLA_Complex *sC2p[MAX];
#endif
  
  arrayr(QLA_Real, sR1, MAX);
  arrayr(QLA_Real, sR3, MAX);
  arrayr(QLA_Real, sC1re, MAX);
  arrayr(QLA_Real, sC3re, MAX);
  arrayr(QLA_Real, sC1im, MAX);
  arrayr(QLA_Real, sC3im, MAX);

  arrayc(QLA_Complex, sC1, MAX);
  arrayc(QLA_Complex, sC3, MAX);

  QLA_RandomState sS1[MAX];

  int nI1[MAX] = { 3, 12, 7, 1, 5, 8, 3, 2, 1, 5};

  QLA_Int sI4      = 5001;

  int dRx[MAX]  = {8,5,6,7,1,2,9,0,3,4};
  int sR1x[MAX] = {3,0,1,8,2,4,5,9,7,6};
  int sR2x[MAX] = {4,9,0,2,1,3,7,8,5,6};

  int dCx[MAX]  = {8,3,2,5,6,9,7,4,0,1};
  int sC1x[MAX] = {8,5,6,7,1,2,9,0,3,4};

  int sS1x[MAX] = {1,3,8,5,9,4,7,6,0,2};

  QLA_Real *sR1p[MAX];
  QLA_Complex *sC1p[MAX];
  QLA_RandomState *sS1p[MAX];

  arrayr(QLA_Real, destR, MAX);
  arrayr(QLA_Real, chkR, MAX);
  arrayc(QLA_Complex, destC, MAX);
  arrayc(QLA_Complex, chkC, MAX);

  int i;
  char name[64];

  // initialize
  QLA_seed_random(sS1, 987654321, time(NULL));
#define R QLA_gaussian(sS1)
  for(i = 0; i < MAX; i++){
#if ( QLA_Precision != 'Q' )
    sR2[i] = R;
    sC2re[i] = R;
    sC2im[i] = R;
#endif
    sR1[i] = R;
    sC1re[i] = R;
    sC1im[i] = R;
    sR3[i] = R;
    sC3re[i] = R;
    sC3im[i] = R;
  }
#undef R

  /* Create pointer lists */

  for(i = 0; i < MAX; i++){
    sR1p[i] = &sR1[sR2x[i]];
    sC1p[i] = &sC1[sC1x[i]];
    sS1p[i] = &sS1[sS1x[i]];

#if ( QLA_Precision != 'Q' )  /* Q precision is limited to assignments */
    sR2p[i] = &sR2[sR3x[i]];
    sR3p[i] = &sR3[sR1x[i]];

    sC2p[i] = &sC2[sC2x[i]];

    sI1p[i] = &sI1[sI1x[i]];
    sI2p[i] = &sI2[sI2x[i]];
    sI3p[i] = &sI3[sI3x[i]];

    zI1p[i] = &zI1[sR2x[i]];
#endif
  }

  /* Create complex variables with known real and imaginary parts */

  for(i = 0; i < MAX; i++){
    QLA_c_eq_r_plus_ir(sC1[i],sC1re[i],sC1im[i]);
#if ( QLA_Precision != 'Q' )  /* Q precision is limited to assignments */
    QLA_c_eq_r_plus_ir(sC2[i],sC2re[i],sC2im[i]);
#endif
    QLA_c_eq_r_plus_ir(sC3[i],sC3re[i],sC3im[i]);
  }
#if ( QLA_Precision != 'Q' )  /* Q precision is limited to assignments */
  QLA_c_eq_r_plus_ir(sC4,sC4re,sC4im);
#endif

  /* Independent check of vector copy */

  strcpy(name,"QLA_R_veq_R");
  QLA_R_veq_R(destR,sR1,MAX);
  for(i = 0; i < MAX; i++){QLA_R_eq_R(&chkR[i],&sR1[i]);}
  checkeqidxRR(chkR,destR,name,fp);

  strcpy(name,"QLA_C_veq_C");
  QLA_C_veq_C(destC,sC1,MAX);
  for(i = 0; i < MAX; i++){QLA_C_eq_C(&chkC[i],&sC1[i]);}
  checkeqidxCC(chkC,destC,name,fp);

#if ( QLA_Precision != 'Q' )  /* Q precision is limited to assignments */

  /* Unary functions of real and complex */

unary(R,eq_cos,R)
unary(R,eq_sin,R)
unary(R,eq_tan,R)
unary(R,eq_acos,R)
unary(R,eq_asin,R)
unary(R,eq_atan,R)
unary(R,eq_sqrt,R)
unary(R,eq_fabs,R)
unary(R,eq_exp,R)
unary(R,eq_log,R)
unary(R,eq_sign,R)
unary(C,eq_cexpi,R)
unary(R,eq_norm,C)
unary(R,eq_arg,C)
unary(C,eq_cexp,C)
unary(C,eq_csqrt,C)
unary(C,eq_clog,C)
unary(R,eq_cosh,R)
unary(R,eq_sinh,R)
unary(R,eq_tanh,R)
unary(R,eq_log10,R)
unary(R,eq_ceil,R)
unary(R,eq_floor,R)

  /* Simple Binary functions */

binary(R,eq,R,mod,R,sR1,sR3)
binary(R,eq,R,max,R,sR1,sR3)
binary(R,eq,R,min,R,sR1,sR3)
binary(R,eq,R,pow,R,sR1,sR3)
binary(R,eq,R,atan2,R,sR1,sR3)
binary(R,eq,R,ldexp,I,sR1,sI3);

#endif /* QLA_Precision != Q */

  /* Assignments */

unary(R,eq,R)
unary(C,eq,C)
unary(R,peq,R)
unary(C,peq,C)
unary(R,eqm,R)
unary(C,eqm,C)
unary(R,meq,R)
unary(C,meq,C)

#if ( QLA_Precision != 'Q' )  /* Q precision is limited to assignments */

  /* Complex conjugate */

unarya(C,eq,C)
unarya(C,peq,C)
unarya(C,eqm,C)
unarya(C,meq,C)

  /* Local squared norm */

alleqops(`unary(R,',`_norm2,C)')

  /* Type conversion */

unary(C,eq,R)
binary(C,eq,R,plus_i,R,sR1,sR3)
unary(R,eq_re,C)
unary(R,eq_im,C)
unary(R,eq,I)
unary(I,eq_trunc,R)
unary(I,eq_round,R)

  /* Multiplication by real or complex constant */

alleqops(`binaryconst(R,',`_r_times,R,R)')
alleqops(`binaryconst(C,',`_r_times,R,C)')
alleqops(`binaryconst(C,',`_r_times,R,C,a)')
alleqops(`binaryconst(C,',`_c_times,C,C)')
alleqops(`binaryconst(C,',`_c_times,C,C,a)')
alleqops(`unarytimesi(C,',`_i,C)')

  /* Division */

binary(R,eq,R,divide,R,sR1,sR2)
binary(C,eq,C,divide,C,sC1,sC2)

  /* Addition or subtraction */

binary(R,eq,R,plus,R,sR1,sR2)
binary(R,eq,R,minus,R,sR1,sR2)
binary(C,eq,C,plus,C,sC1,sC2)
binary(C,eq,C,minus,C,sC1,sC2)

  /* Multiplication */

alleqops(`binary(R,',`,R,times,R,sR1,sR2)')
alleqops(`binary(C,',`,R,times,C,sR1,sC1)')
alleqops(`binary(C,',`,R,times,Ca,sR1,sC1)')
alleqops(`binary(C,',`,C,times,C,sC1,sC2)')
alleqops(`binary(C,',`,C,times,Ca,sC1,sC2)')
alleqops(`binary(C,',`,Ca,times,C,sC1,sC2)')
alleqops(`binary(C,',`,Ca,times,Ca,sC1,sC2)')

  /* Local inner product - complex */

alleqops(`binary(C,',`,C,dot,C,sC1,sC2)')
alleqops(`binary(C,',`,Ca,dot,C,sC1,sC2)')
alleqops(`binary(C,',`,C,dot,Ca,sC1,sC2)')
alleqops(`binary(R,',`_re,C,dot,C,sC1,sC2)')

  /* Ternary operations */

ternaryconst(R,eq_r_times,R,R,plus,R)
ternaryconst(R,eq_r_times,R,R,minus,R)
ternaryconst(C,eq_r_times,R,C,plus,C)
ternaryconst(C,eq_r_times,R,C,minus,C)
ternaryconst(C,eq_c_times,C,C,plus,C)
ternaryconst(C,eq_c_times,C,C,minus,C)

  /* Boolean comparisons */

binary(I,eq,R,eq,R,sR1,sR2)
binary(I,eq,R,ne,R,sR1,sR2)
binary(I,eq,R,gt,R,sR1,sR2)
binary(I,eq,R,lt,R,sR1,sR2)
binary(I,eq,R,ge,R,sR1,sR2)
binary(I,eq,R,le,R,sR1,sR2)

  /* Copymask */

binary(R,eq,R,mask,I,sR1,zI1)
binary(C,eq,C,mask,I,sC1,zI1)

  /* Reductions */

unaryglobalnorm2real(r,eq_norm2,R,,,)
unaryglobalnorm2real(r,eq_norm2,I,,,)
unaryglobalnorm2(r,eq_norm2,C,,,)
binaryglobaldotreal(r,eq,R,dot,R,,,)
binaryglobaldotreal(r,eq,I,dot,I,,,)
binaryglobaldot(c,eq,C,dot,C,,,)
binaryglobaldot(c,eq,Ca,dot,C,,,)
binaryglobaldotreal(r,eq_re,C,dot,C,,,)
unarysumreal(r,eq_sum,R,,,)
unarysumreal(r,eq_sum,I,,,)
unarysum(c,eq_sum,C,,,)

#endif /* QLA_Precision != Q */

  /* Fills */

unaryconstzero(R,eq_zero)
unaryconstzero(C,eq_zero)

#if ( QLA_Precision != 'Q' )  /* Q precision is limited to assignments */

unaryconst(R,r)
unaryconst(C,c)

  /* Random numbers */

unaryrand(R,eq_random)

#endif /* QLA_Precision != Q */

unaryrand(R,eq_gaussian)
unaryrand(C,eq_gaussian)
}

int
main(int argc, char *argv[])
{
  FILE *fp;
  char *fn = basename(argv[0]);
  int len = strlen(fn) + 10;
  char buf[len];
  strcpy(buf, fn);
  fn = strcat(buf, ".result");
  fp = fopen(fn, "w");
  if (fp == NULL) {
    fprintf(stderr, "Error in report function - cannot create \"%s\"\n", fn);
    exit(-1);
  }

  fprintf(stderr, "start\n");

  for(int i=1; i<=32; i*=2) {
    runtest(fp, i);
  }

  return 0;
}
