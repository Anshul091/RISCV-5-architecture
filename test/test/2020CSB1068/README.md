Assumption made and Instruction to run for each question are given below:

-----------------------------------------------------------------------------
Q1

lex file : Count.l

1. I am assuming /n to be not a charachter.
2. You have to give the name of file as a commond line argument.
Suppose "count" is the final output file , so run it like ./count test.txt

-----------------------------------------------------------------------------
Q2

lex file : Comments.l

1. You have to give the name of file as a commond line argument.
Suppose "comment" is the final output file , so run it like ./comment test.txt
2. In multiline comment, we are assuming that no "*" or "/" will be used, otherwise regex will be too complex to be dealt with.

-----------------------------------------------------------------------------
Q3

lex file: ab.l
yacc file : ab.y

1. Just run the output file and input the string you want to check, if you want to check again, run the output file again

-----------------------------------------------------------------------------
Q4

lex file : calc.l

1. You have to give the name of file as a commond line argument.
Suppose "calc" is the final output file , so run it like ./calc exp.txt
2. In each line, write a expression and run output file with the text file, so for each row we will get 
    a. Whether expression is valid or not
    b. number of operators( *,/,+,-) , if same operators are coming twice, we are still printing them
    c. number of identifiers ( a,b,cd,123,212), if same identifier are coming twice, we are still printing them.
3. Also, we are also assuming that user will only use round brackers "(" & ")" and not use other kind of brackets 
4. Negative numbers are not allowed in our expression.
5. Division is floor divisiob as done in C.
6. Only +,-,*,/ will be used as operators , so don't put #,@ etc in between, it will give valid expression.

-----------------------------------------------------------------------------
Q5

Lex file : calc_second.l
Yacc file : calc.y

1. Just run the final output and enter the expression
2. Negative numbers are not allowed.
3. Division is floor division as done in C.
4. We are not checking for division by 0 
-----------------------------------------------------------------------------