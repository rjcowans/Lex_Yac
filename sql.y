%{
#include <stdio.h>
#include <stdlib.h>
extern yylex();
extern yytext[];
extern FILE *yyin;
%}
%start Program
%token DIGIT 
%token RENAME 
%token AS 
%token LTE 
%token GTE 
%token EQUAL 
%token LESS 
%token GREAT 
%token BETWEEN 
%token ATT 
%token RELTOK 
%token COMMA 
%token OPENP 
%token CLOSEP 
%token OPENB 
%token CLOSEB 
%token BITOP 
%token WHERE
%%
Program: expression

expression: onerelationexpression
	  | tworelationexpression 

onerelationexpression: renaming 
		     | restriction 
		     | projection 

renaming: term RENAME attribute AS attribute 

term: relation 
    | OPENP expression CLOSEP {};

restriction: term WHERE comparison {};

projection: term 
	  | term OPENB attributecommalist CLOSEB 

attributecommalist: attribute 
		  | attribute COMMA attributecommalist 

tworelationexpression: projection binaryoperation expression 

binaryoperation: BITOP 

comparison: attribute compare DIGIT

compare: LTE 
       | GTE 
       | LESS 
       | GREAT
       | EQUAL 
       | BETWEEN 

attribute: ATT 

relation: RELTOK
%%
int main(int argc, char *argv[])
{
   yyin = fopen(argv[1], "r");
   if (!yyin){
	printf("NO FILE\n");
	exit(0);
   }
   yyparse();
   printf("ACCEPT\n");
}
yyerror()
{

   printf("REJECT\n");
   exit(0);
}
yywrap()
{
   printf("\nin wrap\n");
  exit(0);
}
