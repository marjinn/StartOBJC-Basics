//
//  VariableArgumentListExample.m
//  StartOBjC-Basics
//
//  Created by mar Jinn on 12/22/13.
//  Copyright (c) 2013 mar Jinn. All rights reserved.
//

#import "VariableArgumentListExample.h"



//########################################
//######## VARIABLE ARGUMENT LISTS #######
//########################################

/* *_ Variadic function _* is a fancy name for a function
 that takes a variable number of arguments.
 declared in stdarg.h */

/* *HOW TO*
 
 1.Declare a variable of type 'va_list'
 2.initilaize the va_list variable by using
 'va_start(ap, param)'
 where 'ap'      is the va_list variable name
 'param'   is the first of the additional arguments
 3.To get the actual argument values,call va_arg() with the type
 of data you expect that argument to be.
 It returns the correct number of bytes fo type and
 advance the va_list to point to the next argument
 va_arg(ap, type)
 where 'ap'      is the va_list variable name
 'type'    type of the data coming in
 4.Keep on calling va_arg(), giving it the expected types,
 until you are done processing the arguments.
 5.Call va_end() to clean up any internal state.
 6.There is no way to know the typ in advance  or the end of arguments
 7.To know the end of argument we use sentinel values
 
 
 */
/*Sum all the integers passed in
 Stopping if its zero*/
int add_EmUp(int firstNum,...)
{
    //declare  avariable of type va_list
    va_list args; /*acts like  a pointer to argument*/
    
    //initilaize the varibale that will hold the sum
    int sum = firstNum;
    
    int number = 0;
    
    //initilaize the va_list
    va_start(args,firstNum);/*va_list now points to the first of the
                             additional arguments*/
    
    while (1) {
        //statements
        //get the actual argument values, you call va_arg()
        //with the type of data you expect that argument to be.
        /* get the argument */
        number = va_arg(args,int);
        //add current value held by 'number' to previous
        sum += number;
        //break out of the loop when the list ends
        //here the list should end with 0
        //alternatively we can use a 'for' loop
        //number of arguments passed should be the first argument
        if (number == 0) {
            break;
        }
    }
    
    //this call cleans up any internal state issues
    va_end(args);
    return sum;
}//addEmUP


/*VARARGS WITH SENTINEL values and __attribute__ used as tag*/

void print_Strings(char* first, ...) __attribute__((sentinel));

void print_Strings(char* first, ...)
{
    //declare va_list type
    va_list args;
    //initilaise with va_start -set first caracater in the list
    va_start(args, first );
    //declare holder variable
    char* string = first;
    //last member of the list should be NULL
    while (string != NULL)
    {
        printf("%s",string);
        //get value
        string = va_arg(args, char*);
    }
    //end the list
    va_end(args);
    printf("\n");
    
}//printStrings


/*VA_ARGS CONDITIONAL LOGGING*/
/* Naming Conventions
 ------------------
 A leading or trailing “v” is sometimes used for the name of a
 function or method that takes a va_list,
 such as vsnprintf() or NSLogv()
 */

int global_Level = 50;
void debug_Log (int logLevel, const char* format,...)__attribute__((sentinel));

void debug_Log (int logLevel, const char* format,...)
{
    if (logLevel > global_Level)
    {
        //declare va_list
        va_list args;
        //initialize
        va_start(args, format);
        //print the list
        vprintf(format, args);
        //end the list
        va_end(args);
    }
}//debugLog



@implementation VariableArgumentListExample

-(void)describeObjects:(id) firstObject, ...
{
    //declare va_list variable
    va_list args;
    
    //initilaize
    va_start(args, firstObject);
    
    //declare holder variable
    id holderObj = nil;
    holderObj = firstObject;
    
    while (holderObj)
    {
        NSString* string;
        string = [holderObj description];
        //print
        NSLog(@"the description is :\n  %@",string);
        //get next object
        holderObj = va_arg(args, id);
    }
}//describeObjects

//#############
//QuietLog#####
//#############
/*
QuietLog() is a function like NSLog() except that it does not prepend the
 extra information such
as process ID and the current time to the subsecond level, greatly
 reducing the volume of output. What makes the implementation a little
 more interesting is that we cannot use vprintf() because vprintf() does
 not understand the Cocoa’s %@ conversion specifier for printing an 
 object’s description.
 */
void QuietLog(NSString* format,... )
{
    //declare va_list
    va_list argList;
    
    //initialize
    va_start(argList, format);
    
    NSString* string;
    /*  Returns an NSString object initialized by using a given format
        string as a template into which the remaining argument values are
        substituted according to the user’s default locale.
     */
    string = [[NSString alloc]initWithFormat:format
                                   arguments:argList];//no need for va_args()
    
    //endlist
    va_end(argList);
    
    printf("%s\n",[string UTF8String]);
    
    //[string release];non ARC
    
    
}

@end
