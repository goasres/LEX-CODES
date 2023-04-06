%{
    #include <stdio.h>
    int int_count = 0;
%}

%option noyywrap

%%
"int "     { int_count++; printf("float "); }
.       { putchar(yytext[0]); }

%%

int main(int argc, char** argv) {
    if (argc < 2) {
        printf("Usage: %s <input-file>\n", argv[0]);
        return 1;
    }

    FILE* input = fopen(argv[1], "r");
    if (input == NULL) {
        printf("Error: cannot open input file '%s'\n", argv[1]);
        return 1;
    }

    yyin = input;
    yylex();
    printf("Number of occurrences of 'int': %d\n", int_count);
    fclose(input);
    return 0;
}
