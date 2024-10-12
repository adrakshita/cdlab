%{
#include<stdio.h>
#include "y.tab.h"
%}
digit [0-9]+
letter[a-zA-Z_]


%%
{digit} {yylval.str=strdup(yytext);return NUM;}
{letter}({letter}|{digit})* {yylval.str=strdup(yytext);return IDEN;}
[ \t\n] ;
. return yytext[0];
%%
