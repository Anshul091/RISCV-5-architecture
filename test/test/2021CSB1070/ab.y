%{
#include <stdio.h>
#include <stdlib.h>
void yyerror( char * str);
int yylex();

%}

%%

Exp: 
    Term   { printf("String has a valid structure\n");return 0;}

Term:
    'a''a''a''a''a''a''a''a''a''a'CombA'b'

CombA:
    CombA 'a'
    |
%%

void yyerror( char * str)
{
    printf("String has an invalid structure\n");
}
int main()
{
    printf("Enter the string: ");
    yyparse();
}
