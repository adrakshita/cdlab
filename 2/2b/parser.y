%{
#include<stdio.h>
#include<stdlib.h>
%}
%left '+' '-'
%left '*' '/'
%token NUM
%%
S : E{printf("answer is %d\n",$1);}
E : E '+' E{$$ = $1 + $3;}
  | E '-' E{$$ = $1 - $3;}
  | E '*' E{$$ = $1 * $3;}
  | E '/' E{$$ = $1 / $3;}
  | NUM{$$=$1;}
  ;
%%
int yyerror(){
printf("error\n");
exit(0);
}
int main(){
yyparse();
return 0;
}
