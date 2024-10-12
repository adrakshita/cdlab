%{
#include<stdio.h>
#include<stdlib.h>
extern FILE *yyin;
%}
%token TYPE NUM IDEN RET

%%
S : F S
  | F
  ;
F : TYPE IDEN '(' params ')' '{' BODY '}'  {printf("function found\n");}
  | TYPE IDEN '(' params ')' stmt {printf("function found\n");}
  ;
params : param ',' params
       | param
       ;
param : TYPE IDEN
      ;
BODY : BODY stmt 
     | 
     ;
stmt : E ';'
     | RET E ';'
     ;
E : E '+' E
  | E '-' E
  | E '*' E
  | E '/' E
  | E '=' E
  | IDEN
  | NUM
  ;
  
%%
int yyerror(char *msg){
printf("%s\n",msg);
exit(0);
}
int main(){
yyin=fopen("input.c","r");
yyparse();
return 0;
}
       
