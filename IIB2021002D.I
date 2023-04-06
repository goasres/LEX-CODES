%{
#include<stdio.h>

%}

%%

/\.\*/ printf("%s\n", yytext + 2);

%%
int yywrap(){ return 1; }
int main(int argc, char* argv[]) {
    yylex();
    return 0;
}
