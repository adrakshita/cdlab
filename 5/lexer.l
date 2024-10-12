%{
#include<stdio.h>
#include "y.tab.h"
%}
digit [0-9]+
letter[a-zA-Z_]
id {letter}({letter}|{digit})*

%%
(int|float|void|char|bool) {return TYPE;}
{digit} {return NUM;}
{id}(\[{digit}\])* {return VAR;}
[ \t\n] ;
. return yytext[0];
%%
