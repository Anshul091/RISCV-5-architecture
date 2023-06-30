%{
#include <stdio.h>
int count_char=0;
int count_word=0;
int count_space=0;
int count_line=1;
%}

%%
[^\n\t ]+   { count_word++, count_char+=yyleng; }
[\t ]       { count_space+=yyleng; count_char+=yyleng;}
\n          { count_line++;  }

%%

int main(int argc, char* argv[])
{
    if( argc==1){
        printf("No file is given.\n");
        return 0;
    }
    yyin=fopen( argv[1],"r");
    yylex();
    printf("\n Number of Space =%d", count_space);
    printf("\n Number of Lines =%d", count_line);
    printf("\n Number of Words =%d", count_word);
    printf("\n Number of Charachters =%d", count_char);
    printf("\n");
    fclose(yyin);
    return 0;
}