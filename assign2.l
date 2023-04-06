%{
#include <stdio.h>
#include <string.h>
%}

%%
"while"|"if"|"for"|"int"|"float"|"char"|"main"|"printf"|"scanf"|"break"|"do"|"typedef"|"static"  { printf("Keyword: %s\n", yytext); }
[0-9]+\.[0-9]+               { printf("Float: %s\n", yytext); }
[0-9]+                      { printf("Integer: %s\n", yytext); }
[a-z_A-Z][a-z_A-Z0-9]{0,19} { printf("Identifier: %s\n", yytext); }
"&&"|"||"|"!"                { printf("Logical operator: %s\n", yytext); }
"+"|"-"|"/"|"*"              { printf("Arithmetic operator: %s\n", yytext); }
">="|"<="|">"|"<"|"!="       { printf("Relational operator: %s\n", yytext); }
"--"|"++"|"*"               { printf("Unary operator: %s\n", yytext); }
.                           
%%

int main() {
    yylex();
    return 0;
}

int yywrap()
{
  return 1;
}
