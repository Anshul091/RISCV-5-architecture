%{
#include <stdio.h>
#include <stdlib.h>
void yyerror();
int yylex();
%}

%token NUMBER 
%left '+' '-'
%left '*' '/'

%%


Exp:
	Term { printf("%d\n",$$);return 0;}
Term:
	'(' Term ')'   {$$=$2;}
	| Term '-' Term { $$=$1-$3;}
	| Term '+' Term { $$=$1+$3;}
	| Term '/' Term { $$=$1/$3;}
	| Term '*' Term { $$=$1*$3;}
	| NUMBER        { $$=$1;}

%%

void yyerror()
{
	printf("INVALID EXPRESSION\n");
}
int main()
{
    printf("Enter the expression: ");
	yyparse();
}
