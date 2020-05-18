
%{
#include <stdlib.h>
void yyerror(char *c);

#include "y.tab.h"

%}


%%
([\n]*[{][\n]*) {
  return ABRECHA;
}

([\n]*[}]) {
  return FECHACHA;
}

([\n]*[}][[:space:]]*[\n]) {
  return FIM;
}

([\n]*[[][\n]*) {
  return ABRECOL;
}

([\n]*[]][\n]*) {
  return FECHACOL;
}

(["][A-z][A-z0-9[:space:]]*["]) {
  return STR;
}

([0-9][0-9.]*) {
  return N;
}

[:] {
  return ATRIBUIR;
}

([,][\n]*) {
  return VIR;
}

[[:space:]]+ ;

. ;

%%
    int yywrap()
    {
        return 1;
    }