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

#include <stdarg.h>   //for va_list

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
    
    
    //########################################
    //####Stringization and concatenation#####
    //########################################
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
    
    //########################################
    //####CONDITIONAL COMPILATION#############
    //########################################
    
#define DEFINED_NO_VALUE
#define VERSION 10
#define ZED 0
   
    //#ifdef  #else  #endif
    //Use #ifndef if you are interested in
    //knowing if a symbol is not defined.
#ifdef DEFINED_NO_VALUE
    printf("defined_no_value is defined\n");
#else
    i can has syntax error;
#endif
    
#ifdef ZED
    printf("zed is defined\n");
#endif
    
    //#if
//#if some_symbol works like #ifdef except that
    //it uses the value of the symbol when deciding whether
    //to include the following text. If the symbol has a
    //non-zero numeric value, the text following the #if
    //is allowed to pass through to the compiler.
    //Any other symbol, whether alphanumeric or a macro,
    //will cause the text following the #if to
    //be omitted until the preprocessor sees an #endif or
//#else directive.
    
#if ZED //must be a non-zero numeric value
    printf("zed evaluates to true\n");
#else
    printf("zed evaluates to false\n");
#endif
    
#if VERSION > 5 && VERSION < 20
    printf("Version is in the correct range.\n");
#endif
    
    
    //#ifndef Check id symbol is defined
    
    
    //Expected Output
//    defined_no_value is defined
//    zed is defined
//    zed evaluates to false
//    version is in the correct range.
    
    
    
    //########################################
    //####### PREDEFINED SYMBOLS #############
    //########################################

    /*
     *URL->> http://nadeausoftware.com/articles/2011/12/c_c_tip_how_list_compiler_predefined_macros
    Command-line options
    Most compilers have command-line options to list predefined macros:
    
    Command lines
    Compiler            C macros                            C++ macros
    Clang/LLVM          clang -dM -E -x c /dev/null         clang++ -dM -E -x c++ /dev/null
    
    GNU GCC/G++
                        gcc   -dM -E -x c /dev/null	g++     -dM -E -x c++ /dev/null
    
    Hewlett-Packard C/aC++	cc    -dM -E -x c /dev/null	aCC     -dM -E -x c++ /dev/null
    
    IBM XL C/C++            xlc   -qshowmacros -E /dev/null	xlc++   -qshowmacros -E /dev/null
    
    Intel ICC/ICPC          icc   -dM -E -x c /dev/null	icpc    -dM -E -x c++ /dev/null
    
    Microsoft Visual Studio	(none)	(none)
    
    Oracle Solaris Studio	cc    -xdumpmacros -E /dev/null	CC      -xdumpmacros -E /dev/null
    
    Portland Group PGCC/PGCPP	pgcc  -dM -E	(none)
    */
    
    //ALL USEFUL PREDEFINED SYMBOLS
    
    __APPLE__ ;     // -->  Defined for an Apple platform ,such as OS X
    
    __APPLE_CC__;   // integer value representing the version of the compiler
    
    //__OBJC__;     if compiler is compiling in OBJ C mode;
    
    //_cplusplus;   if compiler is compiling in C++ mode
    
    __MACH__;       // if MAch systems calls are avaialble
    
    __LITTLE_ENDIAN__;  //Defined if you are compiling for a
                        //little endian processor, like Intel or ARM.
    
    //__BIG_ENDIAN__; //Defined if you are compiling for a big endian
                        //processor, like PowerPC.
    
    __LP64__ ;      //Defined if you are compiling in 64-bit mode.
    
    //SYMBOLS TO USE
    
    __DATE__ ;      //the current date ,as a char*
    __TIME__ ;      //the current time ,as a char*
    __FILE__ ;      //name of the file currently being compiled,as a  char*
    __LINE__ ;      //line number of the file before preprocessing,as an int
    __func__ ;      //name of the function or OBJ C method being compiled
                    //as a char*
                    //not a preprocessor feature
                    //preprocessor knows nothing about the languages of the
                    //files it processes
                    //this comes from the compiler
    __FUNCTION__;   // same as __func__
                    //returns function/method name
    __PRETTY_FUNCTION__ ;   //same as __func__,but includes type information
    //always USE THIS //Will not return Object Type for OBJ C
                           
    
    printf("file %s,line %d\n",__FILE__,__LINE__);
    printf("function: %s\n",__FUNCTION__);
    printf(" pretty function: %s\n",__PRETTY_FUNCTION__);
    
    //EXPECTED OUTPUT
    //--> file /Users/marjinn/Dropbox/NewBeginnings/OBJ_BEG_TO/StartOBjC-
    //    Basics/StartOBjC-Basics/Cme.c,
    //    line 132
    //--> function: runOnMain
    //--> pretty function: void runOnMain()
    
    //########################################
    //########### FILE INCLUSION #############
    //########################################
    
    /*
     INCLUDE STAEMENT
     #include
     */
    
    //eg : #include <stdio.h>
    //the file name in angle brackets to
    //indicate the file being included is a “system” header:
    //#include  directive
    //preprocessor looks in /usr/include
    
    //eg: #include "ATMMachine.h"
    //indicate that the file being included is one that
    //belongs to your project:
    
    //###### INCLUDE GAURD
    //######
    //TO AVOID MULTIPLE INCLUTIONS OF SAME HEADER FILE
    //There is a standard trick you can use to
    //prevent multiple inclusions of a file from causing errors:
    //an include guard,
    
    //create include-gaurd.h //or any header file fo your choice
    //ONLY FOR C files that use include statement
#ifndef INCLUDE_GAURD_H
#define INCLUDE_GAURD_H
    //Put the header contents here
#endif  //INCLUDE_GAURD_H
    
    //IF THIS DOESNT WORK
//#pragma once
    //can be used to tell compiler to include the headrer only once
    
    /*
     IMPORT STATEMENT
     #import 
     directive, which directs the compiler to include the file only once.
     */
    
    
    //########################################
    //########### MACRO HYGIENE #############
    //########################################

#define SQUARE(x)  x*x
    SQUARE(5);
    /* OUTPUT
     5*5 = 25
     */
    
    SQUARE(2+3);
    /* OUTPUT
     2+3*2+3 = 11
     */
    
#define SQUARE_R(x) (x)*(x)
    SQUARE_R(2+3);
    /* OUTPUT
     (2+3)*(2+3) = 25
     */
   
    /* PROPER MACRO DECLARATION
     prevents problems if the macro expands into an 
     expression with operators of higher precedence.
     */
#define SQUARE_DONE_RIGHT(x) ((x)*(x))
    /* WARNING
     Beware of side effects in macros. 
     ---------------------------------
     Preprocessor macro expansion is strictly textual substitution. 
     The code SQUARE(i++) will expand to ((i++) * (i++)), 
     which actually is undefined in the C standard. 
     It might cause i to be incremented twice. 
     Then again, it might not. Similarly, 
     using functions with side effects, or that are
     computationally expensive, in a macro like this 
     one could be bad news.
     */
    
    //########################################
    //########### MULTILINE MACROS #############
    //########################################
#define FOUND_AN_ERROR(desc)  \
error_count++; \
fprintf(stderr,"Found an error '%s' at file '%s',line %d\n", \
desc,__FILE__,__LINE__)
    
    /* PROBLEMS WITH PREPROCESSOR MUTATION
     */
    
    //code that works
    int error_count = 0;
    if (2) {
        FOUND_AN_ERROR ("something really bad happened");
    }
    
    //bad code
    if (2)
        FOUND_AN_ERROR ("something really bad happened");
    /* *WHY*
     Take a look at what is happening as the preprocessor mutates your code from:
     
     if (argc == 2)
     FOUND_AN_ERROR ("something bad happened");
     to
     
     if (argc == 2)
        error_count++;
        fprintf (stderr, "Found an error '%s' at file %s, line %d\n",
     "something bad happened", "multilineMacro.m", 13);
     
     This is what it looks like indented the way that it is actually being executed:
     if (argc == 2)
        error_count++;
     fprintf(stderr, "Found an error '%s' at file %s, line %d\n",
     "something bad happened", "multilineMacro.m", 13);
     
     */
    
    //SOLUTION
#define FOUNDAN_ERROR(desc) \
do{ \
    error_count++; \
    fprintf(stderr,"Found an error '%s' at file '%s',line %d\n", \
desc,__FILE__,__LINE__); \
break; \
} while (0)

//if the macro is use in  a loop it will not break out of that  loop
    //but only out of the do-while in the macro implementation
    
///OR
#define FOUND_ANERROR(desc)  \
if (1) {   \
error_count++;   \
fprintf(stderr, "Found an error '%s' at file %s, line %d\n",  \
desc, __FILE__, __LINE__); \
break;  \
} else do {} while (0)
    
    
    //########################################
    //#### Const and volatile variables ######
    //########################################
    
    const int i = 23 ;//constant variable ie,read-only
    
    //const with pointers
    //------------------
    /* const first */
    //------------------
    //LIsting const first causes the data being pointed to be read-only
    
    /*pointer to const char*/
    //----------------------
    const char* string = "bork";//data pointer by 'string' is constant
    string = "greebie"; //pointer reassignment is  OK
    //string[0] = 'f';//Read-only variable is not assignable
    
    //-------------------
    /* const after '*' */
    //------------------
    // causes the pointer itself to be considered reda-only
    //without affecting the mutability of what it points to
    
    /*const pointer to char*/
    //-----------------------
    char* const string2 = "bork";
    //string2 = "greebie";//Read-only variable is not assignable
    //string2[0] = 'f'; possible but crashing
    
    //------------------------------
    /* const before and after '*' */
    //------------------------------
    const char* const string3 = "bork";
    //string3 = "greebie";//Read-only variable is not assignable
    //string3[0] = 'f';//Read-only variable is not assignable
    
    /*
     Keeping these separate in your brain is easy – 
     look at what the const is next to. 
     If it is next to a data type, then the data is what is considered constant. 
     If const immediately follows the *, then the pointer itself is considered constant.
     */
    
    volatile int _and = 3;
    /*
    Declaring a variable volatile means the value of the variable is
     reloaded from memory every time it is used. This guarantees 
     that you will have the correct value when you need it, but it also
     negates some possible compiler optimizations, like caching the value
     in a register in addition to its location in memory.
     */
    
    
    //########################################
    //########### VARARGS gotchas ############
    //########################################
    
    /*
    size_t mysize = somevalue;
    printf ("mysize is %d\n", mysize);
    This code assumes sizeof(size_t) == sizeof(int), 
     which is correct for 32-bit programming (both are four bytes) but not
     for 64-bit programming where 
     size_t is eight bytes and int is four bytes.
     The compiler pushes 8 bytes of data onto the call stack, 
     but printf() has been told to expect an int, 
     so it only pulls four bytes off the stack.
     
     One way to fix this is to cast your size_t argument to the type specified in the format string:
     printf ("mysize is %d\n", (int)mysize);
     This can be necessary when dealing with types whose size might vary from platform to platform. A better way is to ensure your format specifiers use the right types:
     */
    size_t mySize = 0;
    printf("mysize is %zu\n",mySize);
    /* z is a length modifier that alters the 'unsigned' conversion
     specifier 'u' to match the size of the platform-depedent type 
     size_t
     *///Onlt few such types have corresponding length modifiers;
        //refer printf(3) manpage
    
    
    
    
    return;
}//runOnMain


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
int addEmUp(int firstNum,...)
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

//void printStrings(char* first, ...) __attribute__((sentinel));

void printStrings(char* first, ...)
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

int globalLevel = 50;
//void debugLog (int logLevel, const char* format,...)__attribute__((sentinel));

void debugLog (int logLevel, const char* format,...)
{
    if (logLevel > globalLevel)
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


//########################################
//############ VARIADIC MACROS ###########
//########################################

/*USING VARARGS IN A MACRO*/

//As you can tell by the name, these are macros that accept a variable
//number of arguments. You cannot address individual arguments in your
//macros, but you can use the symbol __VA_ARGS__ to reference the
//remaining arguments. Remember this is still textual manipulation; a
//va_list is not created in the process.

/*PROBLEM*/ //IF no arguments supplied..Causes syntax error

/*
 You might have a macro that looks like this:
 #define THING(string, ...) printf (string, __VA_ARGS__)
 If you invoke the THING macro with more than one argument, things work
 out okay.
 
 THING ("hello %s %s\n", "there", "george");
 
 turns into
 
 printf ("hello %s %s\n", "there", "george");
 
 If you do not supply any additional arguments,
 you get a leftover comma and an accompanying syntax error:
 
 THING ("hi\n");
 
 turns into
 
 printf ("hi\n", );
 */

/* Solution */

/*
 if you foresee this being a problem with your macro, 
        use ##__VA_ARGS__, prepending two pound signs,
 which causes the preprocessor to eat the preceding comma.
 With THING defined as 
 
 #define THING(string, ...) printf (string,## __VA_ARGS__)
 
 the failing example
 
 THING ("hi\n");
 
 now expands to
 
 printf ("hi\n");
 */

int global_level = 50;
#define DEBUGLOG_(logLevel,format,...) \
do{\
    if ((logLevel) > global_level) printf((format),##__VA_ARGS__); \
}while(0)

void callAllVaArgsMAcro(void)
{
DEBUGLOG_ (10, "this will not be seen: %d, %s, %d\n", 10, "hello", 23);
DEBUGLOG_ (87, "this should be seen: %s, %d\n", "bork", 42);
DEBUGLOG_ (87, "and this should be seen\n");
}

/* OUTPUT 
 
 this should be seen: bork, 
 42 and this should be seen
 
 */


//########################################
//############ BIT_WISE OPERATORS ###########
//########################################

// AND &  OR |  XOR ^  NOR ~

//BITWISE SHIFT

/*########################################*/
            /* BIT MASKS*/
/*########################################*/

/*
enum {
    NSEnumerationConcurrent = (1UL << 0),   // binary 0001
    NSEnumerationReverse = (1UL << 1),      // binary 0010
    };
typedef NSUInteger NSEnumerationOptions;
 */


#define THING_1_MASK    1            //0000 0001
#define THING_2_MASK    2            //0000 0010
#define THING_3_MASK    3            //0000 0011
#define ALL_THINGS      (THING_1_MASK | THING_2_MASK | THING_3_MASK) //0000 0111

#define ANOTHER_MASK    (1 << 5)       //0010 0000 ie
                                        //0000 0001
                                        //last bit 5 places shifted
                                        //to the right

#define ANOTHER_MASK_2    (1 << 6)       //0100 0000 ie
                                        //0000 0001
                                        //last bit 5 places shifted
                                        //to the right

#define ALL_ANOTHERS    (ANOTHER_MASK | ANOTHER_MASK_2)  // 0110 0000
//i.e 0010 0000 | 0100 0000     0110 0000
#define ALL_USEFUL_BITS (ALL_THINGS | ALL_ANOTHERS)      // 0110 0111
//i.e 0000 0111 | 0110 0000     0110 0111

static void showMaskValue(int value)
{
    printf("\n");
    printf("value %x\n",value);
    
    if (value & THING_1_MASK) printf ("  THING_1\n");
    if (value & THING_2_MASK) printf ("  THING_2\n");
    if (value & THING_3_MASK) printf ("  THING_3\n");
    
    if (value & ANOTHER_MASK) printf ("  ANOTHER_MASK\n");
    if (value & ANOTHER_MASK_2) printf ("  ANOTHER_MASK_2\n");
    
     if ((value & ALL_ANOTHERS) == ALL_ANOTHERS) printf ("  ALL ANOTHERS\n");
    
}//showMaskValue

void ios7ProgrammingFundamentals(void)
{
    
}//ios7ProgrammingFundamentals
