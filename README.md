# cdlab
# Program 1: 
- Write a LEX program to count number of words, lines, characters and whitespaces in a given paragraph.
- Write a YACC program to recognize strings of the form anbn+mcm, n,m>=0.
# Program 2:
- Write a LEX program to count number of Positive and Negative integers and Positive & Negative fractions.
- Write a YACC program to validate and evaluate a simple expression involving operators +,- , * and /.
# Program 3:
- Write a LEX program to count the number of comment lines in a C Program. Also eliminate them and copy that program into a separate file.
- Write a YACC program to recognize a nested (minimum3levels)FOR loop statement for C language.
# Program 4:
- Write a LEX program to recognize and count the number of identifiers, operators and keywords in a given input file.
- Write a YACC program to recognize nested IF control statements (C language) and display the number of levels of nesting.
# Program 5: Write a YACC program to recognize Declaration statement (C language) and display the number variables declared .
- Variable can be any basic data type  or array type
- Example int a[10],a,b,c;   
# Program 6: YACC program that reads the C statements for an input file and converts them in quadruple three address intermediate code.
# Program 7: Write a YACC program that identifies the Function Definition of C language.
# Program 8: Write a YACC program that generates Assembly language (Target) Code for valid Arithmetic Expression.

# Commands to install LEX and YACC in Ubuntu:
- sudo apt update
- sudo apt install flex bison

# Commands for LEX Programs:
- lex lexer.l
- gcc lex.yy.c -lfl
- ./a.out

# Commands for YACC Programs:
- lex lexer.l
- yacc -d parser.y
- gcc lex.yy.c y.tab.c -lfl
- ./a.out
