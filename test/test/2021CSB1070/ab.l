%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "y.tab.h"
extern int yylval;
%}

%%
.|\n return yytext[0];
%%

int yywrap(){
    return 1;
}