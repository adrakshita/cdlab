%{
#include<stdio.h>
int posint=0,negint=0,posfrac=0,negfrac=0;
%}
digit [0-9]
pos \+?{digit}+
neg -{digit}+

%%
{pos} posint++;
{neg} negint++;
{pos}\/{pos} {posfrac++;}
{neg}\/{neg} {posfrac++;}
{pos}\/{neg} {negfrac++;}
{neg}\/{pos} {negfrac++;}
# return 0;
%%
int main(){
printf("enter input\n");
yylex();
printf("positive integers: %d\n negative inetgers: %d\n positive fractions: %d \n negative fractions: %d\n",posint,negint,posfrac,negfrac);
return 0;
}
