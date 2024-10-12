%{
#include<stdio.h>
#include<stdlib.h>
int ifcount=0,nest=0,max=0;
extern FILE *yyin;
%}
%token IF ELSE NUM IDEN RELOP

%%
S : IF '(' E ')'  {ifcount++;nest++;if(nest>max)max=nest;} BODY {nest--;}
  ;
BODY : '{' BODY BODY '}'
     | E ';'
     | S {printf("nesting\n");}
     |
     ;
E : E RELOP E
  | IDEN
  | NUM
  | IDEN '=' E
  |
  ;
%%
int yyerror(char *msg){
printf("error:%s\n",msg);
exit(0);
}
int main(){
yyin=fopen("input.c","r");
yyparse();
printf("if count=%d\n",ifcount);
printf("max nesting=%d\n",max);
return 0;
}
