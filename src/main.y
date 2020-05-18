%{
#include <stdio.h>
#include <stdlib.h>
void yyerror(char *c);
int yylex(void);
%}

%token ABRECHA FECHACHA FIM ABRECOL FECHACOL STR N TEXTO ATRIBUIR VIR

%%

J:
  ABRECHA K FECHACHA {};
  | ABRECHA K FIM {printf("VALIDO\n");};

K:
  S {};
  | S VIR S {};

S:
  I ATRIBUIR D {};
  | I ATRIBUIR L {};
  | I ATRIBUIR J {};
  | J {};

L:
  ABRECOL EL FECHACOL {};
  | ABRECOL FECHACOL {};

EL:
  D {};
  | EL VIR EL {};
  | L {};

I:
  STR {};

D:
  N {};
  | I {};
%%

void yyerror(char *c) 
{
  printf("INVALIDO\n");
}

int main()
{
  yyparse();
  return 0;
}