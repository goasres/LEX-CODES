%{
#include <stdio.h>
int comment = 0;
%}

%%

"/*"      { comment = 1;}
"*/"      { comment = 0;}
"//"      { comment = 1;}
";"     { printf("%s", yytext);comment = 0;}

[^\n]   {
                if (!comment) {
                        printf("%s", yytext);
                }
        }

\n     {
                if (!comment) {
                        printf("\n");
                }
        }

%%
int yywrap(){ return 1; }
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
