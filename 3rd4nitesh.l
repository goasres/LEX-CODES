%{
#include <stdio.h>
%}
%option noyywrap
%%
"//"
"/*"
"*/"
.       { fprintf(yyout, "%s", yytext); }
%%

int main(int argc, char *argv[]) {
    FILE *f;
    yyin = stdin;

    if(argc > 1) {
        f = fopen(argv[1], "r");
        if(!f) {
            fprintf(stderr, "Cannot open input file %s.\n", argv[1]);
            return 2;
        }
        yyin = f;
    }

    yylex();

    fclose(yyin);

    return 0;
}

void yyerror(char *s) {
    fprintf(stderr, "Error: %s\n", s);
}



