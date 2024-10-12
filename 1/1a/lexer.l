%{
#include<stdio.h>
#include<stdlib.h>
int lines=0,words=0,spaces=0,chars=0;
%}
%%
\n {lines++;}
[ ] {spaces++;}
\t {spaces+=4;}
[^ \t\n#]+ {words++;chars+=yyleng;}
# return 0;
%%
int main(){
printf("input:\n");
yylex();
printf("Number of lines: %d\nNumber of spaces: %d\nNumber of words: %d\nNumber of characters: %d \n",lines,spaces,words,chars);
return 0;
}
