%{
#include<stdio.h>
#include "y.tab.h"
%}

digit [0-9]+
letter [a-zA-Z_]

%%
if {return IF;}
{letter}({letter}|{digit})* {return IDEN;}
{digit}+ {return NUM;}
(<|>|<=|>=|\+|-|\*|\/|==|=) {return RELOP;}
[ \t\n] ;
. return yytext[0];
%%
