%{
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

int valid=1;
int count_identifier=0;
int count_operators=0;
int bracket=0;
int past=0;

char* identifier[100];
char operators[100];

void addidentifier( char* str, int len);
void print_result();
%}

%%
\(  {bracket++; past=1;}
\)  {bracket--; if(bracket<0) valid=0; if( past==2){ valid=0;} past=0;}
(\*|\+|\/|\-)   { operators[count_operators]=*yytext; count_operators++; if( past==1 || past==2 ){ valid=0;} past=2;  }
([A-Za-z][0-9A-Za-z]*) { addidentifier( yytext,yyleng); if( past!=1 && past!=2){ valid=0;} past=3;}
([0-9]+) { addidentifier(yytext,yyleng);if( past!=1 && past!=2){ valid=0;} past=3;}
\n { print_result();}
. 
%%

void addidentifier( char* str, int len)
{
    char * now;
    now=malloc( sizeof(char)*(len+1));
    strcpy(now,str);
    identifier[count_identifier]=now;
    count_identifier++;
}

void print_result(){
    if(valid==0 || past==2 || past==1 )
    {
        printf("Expression is Invalid.\n");
    }
    else
    {
        printf("Expression is valid.\n");
    }
    printf("The operators are: ");
    for( int i=0;i<count_operators;i++)
        printf("%c ", operators[i]);
    printf("\n");

    printf("The identifier are: ");
    for( int i=0;i<count_identifier;i++)
        printf("%s ", identifier[i]);
    printf("\n");
    
    valid=1;
    bracket=0;
    count_operators=0;
    count_identifier=0;
    past=0;

    printf("\n");
}

int main(int argc, char* argv[])
{
    if( argc==1){
        printf("No file is given.\n");
        return 0;
    }

    yyin=fopen( argv[1],"r");

    yylex();

    print_result();

    return 0;
}