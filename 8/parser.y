%{
#include<stdio.h>
#include<stdlib.h>
#include<string.h>
struct tableRow{
	char op;
	char *arg1,*arg2,*res;
};
struct tableRow table[100];
int tableIndex=0;
char *addToTable(char op,char *arg1,char *arg2,char *res);
char *getTempVar();
void printTable();
void printTarget();

extern FILE *yyin;
%}
%union{
	char *str;
}

%token <str> NUM IDEN
%type <str> EXP PROG

%left '='
%left '+' '-'
%left '*' '/'

%%
PROG : PROG EXP ';'
     | EXP ';'
     ;
EXP : EXP '+' EXP {$$=addToTable('+',$1,$3,getTempVar());}
    | EXP '-' EXP {$$=addToTable('-',$1,$3,getTempVar());}
    | EXP '*' EXP {$$=addToTable('*',$1,$3,getTempVar());}
    | EXP '/' EXP {$$=addToTable('/',$1,$3,getTempVar());}
    | IDEN '=' EXP {$$=addToTable('='," ",$3,$1);}
    | IDEN {$$=$1;}
    | NUM { $$=$1;}
    ;
%%

int yyerror(char *msg){
	printf("%s\n",msg);
	exit(0);
}
int main(){
	yyin=fopen("input.c","r");
	yyparse();
	printTable();
	printTarget();
	return 0;
}
char *addToTable(char op,char *arg1,char *arg2,char *res){
	table[tableIndex].op=op;
	table[tableIndex].arg1=strdup(arg1);
	table[tableIndex].arg2=strdup(arg2);
	table[tableIndex].res=strdup(res);
	tableIndex++;
	return res;
}
char *getTempVar(){
	static int count=1;
	char *temp=malloc(4*sizeof(char));
	sprintf(temp,"t%d",count);
	count++;
	return temp;
}
void printTable(){
printf("quadruples\n");
	for(int i=0;i<tableIndex;i++){
		printf("%c %s %s %s\n",table[i].op,table[i].arg1,table[i].arg2,table[i].res);
	}
}

void printTarget(){
printf("target code\n");
	for(int i=0;i<tableIndex;i++){
		if(table[i].op=='='){
			printf("LD R1 %s \n",table[i].arg2);
			printf("ST %s R1\n",table[i].res);
			}
		else{
			printf("LD R1 %s\n",table[i].arg1);
			printf("LD R2 %s\n",table[i].arg2);
			char operation[10];
			switch(table[i].op){
				case '+':{strcpy(operation,"ADD");
					break;
					}
				case '-':{strcpy(operation,"SUB");
					break;
					}
				case '*':{strcpy(operation,"MUL");
					break;
					}
				case '/':{strcpy(operation,"DIV");
					break;
					}
			}
			printf("%s R3,R1,R2\n",operation);
			printf("ST R3 %s\n",table[i].res);
	}
}
}
