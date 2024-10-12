%{
#include<stdio.h>
#include<stdlib.h>
%}
%%
S : A B 
  ;
A : 'a' A 'b'
  |
  ;
B : 'b' B 'c'
  |
  ;
%%
int yyerror(){
printf("invalid input");
exit(0);
}
int main(){
yyparse();
printf("valid input");
return 0;
}
