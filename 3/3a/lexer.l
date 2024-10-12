%{
#include<stdio.h>
int single=0,multi=0,mlines=0;
FILE *yyout;
%}
%%
\/\/.*\n {single++;}
"/*"[^*]*"*/" {multi++;
		for(int i=0;i<yyleng;i++){
			if(yytext[i]=='\n')
				mlines++;
		}
		mlines++;
	}
. fprintf(yyout,"%s",yytext);
\n fprintf(yyout,"\n");
%%
int main(){
yyin=fopen("input.c","r");
yyout=fopen("output.c","w");
yylex();
printf("Number of single comment lines=%d\n Number of multi comments=%d\n Number of multi comment lines=%d\n",single,multi,mlines);
return 0;
}
