%{
#include<stdio.h>
#include<stdlib.h>
int decl=0;
%}
%token TYPE NUM VAR 

%%
D : TYPE variables ';'
  ;
variables : variables ',' variable
          | variable
          ;
variable : VAR '=' NUM {decl++;}
         | VAR {decl++;}
         ;
%%
int yyerror(char *msg){
printf("%s\n",msg);
exit(0);
}
int main(){
printf("enter input\n");
yyparse();
printf("declaration count=%d\n",decl);
return 0;
}
       
