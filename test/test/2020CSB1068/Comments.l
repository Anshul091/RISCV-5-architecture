%{
#include <stdio.h>
int count_comments=0;
FILE *final_file;

int nmultiline(char * yytext, int yyleng)
{
    int count=1;
    for( int i=0;i<yyleng;i++)
    {
        if( yytext[i]=='\n')
            count++;
    }
    return count;
}
%}

%%
\/\/.*          {count_comments++;}
\/\*[^\*\/]*\*\/ {count_comments+=nmultiline(yytext,yyleng);}
%%

int main(int argc, char* argv[])
{
    if( argc==1){
        printf("No file is given.\n");
        return 0;
    }

    yyout=fopen( "output.c","w");
    yyin=fopen( argv[1],"r");

    yylex();

    printf("Number of Commented Lines are : %d\n",count_comments);

    fclose(yyin);
    fclose(yyout);
    return 0;
}

