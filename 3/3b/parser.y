%{
#include<stdio.h>
#include<stdlib.h>
int fcount=0,nest=0,max=0;
extern FILE *yyin;
%}
%token FOR IDEN NUM RELOP INCDEC

%%
S : F ;
F : FOR FHEAD {fcount++;nest++;if(nest>max)max=nest;}  FBODY {nest--;}
  ;
FHEAD : '(' E ';' E ';' E ')'
FBODY : '{' BODY '}'
      | E ';'
      ;
BODY : BODY BODY
      | F {printf("nesting found\n");}
      | E ';'
      |
      ;
E : E RELOP E
  | IDEN INCDEC
  | INCDEC IDEN
  | IDEN
  | NUM          
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
printf("function count = %d\n",fcount);
printf("max nesting=%d\n",max);
return 0;
}
