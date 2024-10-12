%{
#include<stdio.h>
#include "y.tab.h"
%}
digit [0-9]+
letter[a-zA-Z_]
id {letter}({letter}|{digit})*

%%
(int|float|void|char|bool) {return TYPE;}
return {return RET;}
{digit} {return NUM;}
{id} {return IDEN;}
[ \t\n] ;
. return yytext[0];
%%
