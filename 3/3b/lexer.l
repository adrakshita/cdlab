%{
#include<stdio.h>
#include "y.tab.h"
%}

digit [0-9]+
letter [a-zA-Z_]

%%
for return FOR;
{digit} return NUM;
{letter}({letter}|{digit})* return IDEN;
(\+|-|\*|\/|<|>|<=|>=|=|==) return RELOP;
(\+\+|--) return INCDEC;
[ \t\n] ;
. return yytext[0];
%%
