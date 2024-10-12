%{
#include<stdio.h>
#include<stdlib.h>
int iden=0,key=0,oper=0;
%}
digit [0-9]
letter [a-zA-Z_]
k (main|int|char|float|bool|return|if|else|for|void)

%%
{k} {key++;}
(\+|-|\*|\/|=) {oper++;}
{letter}({letter}|{digit})* {iden++;}
%%

int main(){
yyin=fopen("input.txt","r");
yylex();
printf("identifiers=%d\nkeywords=%d\noperators=%d\n",iden,key,oper);
return 0;
}
