//
//  Cme.c
//  StartOBjC-Basics
//
//  Created by mar Jinn on 12/21/13.
//  Copyright (c) 2013 mar Jinn. All rights reserved.
//

#include "Cme.h"
#include <stdio.h>   //for printf()
#include <math.h>    //for sqrt()

//#########################
//######C Preprocessor#####
//#########################
//tells preprocessor to substitute 23 whenever it sees SOME_SYMBOL
#define SOME_SYMBOL 23
//tells preprocessor to take out the text whenever it sees  ANOTHER_SYMBOL
#define ANOTHER_SYMBOL
//Whenever the preprocessor sees MACRO with an argument,
//it expands to the text on the right-hand side of the #define,
//substituting the argument for x. For instance, MACRO(bork)
//will end up doSomethingCoolWith(bork) after the preprocessor
//finishes its work.
#define MACRO(x) doSomethingcoolWith(x)

//

void runOnMain(void)
{

#define FNORD hello
    int FNORD = 23;
    printf("hello,your number today is %d\n",hello);
    
#define NOBODY_HOME
    static unsigned NOBODY_HOME int thing = 42;
    printf("thing , your number today is %d\n",thing);
    
#define SUM(x,y) x + y
    int value = SUM(23, 42);
    printf("value, your number today is %d\n",value);
   
    //Expected Output
    //// gcc -g -Wall -o expansion expansion.m
    //hello, your number today is 23 thing,
    //your number today is 42 value,
    //your number today is 65
    
    
    
    //Stringization and concatenation
#define FIVE 5

//The # character can be used in a macro definition to turn an argument
    //into a literal string rather than having it evaluated.
//## can be used to textually paste two tokens together
#define PRINT_EXPR(x) printf("%s = %d\n",#x,(x))//#x is literally x without //evaluation,menaing whatever passed as 'x' will be treates as a string
    //literal hence %s
    PRINT_EXPR(5);
    PRINT_EXPR(5 * 10);
    PRINT_EXPR((int)sqrt(FIVE*FIVE) + (int)log(25 / 5));
    
#define SPLIT_FUNC(x,y) x##y
    SPLIT_FUNC(prin,tf) ("hello\n");
    
    //Expected Output
    //5 = 5
    //5 * 10 = 50
    //(int)sqrt(FIVE*FIVE) + (int)log(25 / 5) = 6
    //hello
    
    return;
}