%{
    int num_chars = 0;
    int num_words = 0;
    int num_lines = 0;
%}

%option noyywrap

%%
\n    { num_lines++; }   // count new lines
.     { num_chars++; }   // count all characters
[a-zA-Z]+   { num_words++; }   // count words

%%

int main(int argc, char* argv[]) {
    if (argc != 2) {
        printf("Usage: %s input_file\n", argv[0]);
        return 1;
    }

    FILE* file = fopen(argv[1], "r");
    if (!file) {
        printf("Error: failed to open input file %s\n", argv[1]);
        return 1;
    }

    yyin = file;
    yylex();

    fclose(file);

    printf("Number of characters: %d\n", num_chars);
    printf("Number of words: %d\n", num_words);
    printf("Number of lines: %d\n", num_lines);

    return 0;
}
