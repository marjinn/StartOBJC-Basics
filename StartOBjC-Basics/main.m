//
//  main.m
//  StartOBjC-Basics
//
//  Created by mar Jinn on 12/7/13.
//  Copyright (c) 2013 mar Jinn. All rights reserved.
//

#import <Foundation/Foundation.h>

//GlobalVariable
//int bar;

int main(int argc, const char * argv[])
{
    
    @autoreleasepool { /* NSAutoreleasePool* pool
                        = [[NSAutoreleasePool alloc]init]
                        
                        [pool drain]
                        */
        
        // insert code here...
        NSLog(@"Hello, World!");
        
        int  hours = 24;
        int minutes = 60;
        int seconds = 60;
        
        int product = 0;
        product = hours * minutes * seconds;
        NSLog(@"The Product is %d",product);
        
        /*########*/
        //if-else
         /*########*/
        int aNumber;
        aNumber = 99;
        if (aNumber == 99) {// '==' equlaity check
            NSLog(@"True");
        }
        if (aNumber != 99) {
            NSLog(@"False");
        }
        else{
            NSLog(@"MayBe");
        }
        
         /*########*/
        //logical and &&
         /*########*/
        int c;
        c = 100;
        int d;
        d = 50;
        if ((c == 100) && (d == 50)) {
            NSLog(@"Yo");
        }
        //OR ||
        if ((c == 100) || (d == 50)) {
            NSLog(@"Do");
        }
        
         /*########*/
        //switch-case
         /*########*/
        int category;
        category = 47;
        
        switch (category) {
            case 47:
                NSLog(@"blah!");
                break;
                
            case 48:
                NSLog(@"naa!");
                break;
                
            case 49:
                NSLog(@"no Way");
                break;//no break - reaches fallthrough
                
            case 40:
                NSLog(@"Category 40");
                break;//if no break both will be printed
                
            case 41:
            case 43:
                NSLog(@"Category 40,41,43");
                break;
                
            default:
                break;
        }
        
        
        //+=
        int score;
        score = 10;
        score += 10;
        NSLog(@"%d",score);
        
        //Operator Precedence
        ///BODMAS
        
        //modulus % (only on int)
        int year = 2003;
        int remainder = year % 4;//remainder
        NSLog(@"reminnder %d",remainder);
        
        int a = 10;
        a = a+ 1;
        a +=1;
        //Unary Operator
        a++;//Postfix Operator
        ++a;//Prefix
        
        a = a - 1;
        a -= 1;
        a--;
        --a;
        
        int b = 5; //carves 4 bytes of space in memory ,put 5 in it;
        NSLog(@"The value of a is %i",++b);//prints 6
        NSLog(@"The value of a is %i",b++);//prints 5,then chages value of 'a'
        //to 6
        
        //Ternary Opertor
        //condition ? true : false
        int playerOne = 1000;
        int playerTwo = 2220;
        
        int highScore = 0;
        
        if (playerOne > playerTwo) {
            highScore = playerOne;
        }
        else
        {
            highScore = playerTwo;
        }
        
        //alternatively
        highScore =  playerOne > playerTwo ? playerOne : playerTwo;
        
        //bit-wise operators
        
         /*########*/
        //lOOping
         /*########*/
        //while
        int lpCnt = 10;
        while (lpCnt > 0) {
            NSLog(@"while %d",lpCnt);
            lpCnt--;
        }
        
        //do-while
        int lpCount = 10;
        do {
            NSLog(@"do-while %d",lpCount);
            lpCount--;
        } while (lpCount > 0);
        
        //for
        //'i' is called index variable
        for (int i = 10; i > 0; i--) {
            NSLog(@"for %d",i);
        }
        
        //break
        for (int i = 1; i < 5000; i++) {
            NSLog(@"The value of index is %i",i);
            // ...
            if (i == 101) {
                break;//Jumps out of the loop
            }
            // ...
        }
        
        //continue
        for (int i = 1; i < 5000; i++) {
            // ...
            if (i % 5 == 0) {
                continue;//Skip this
                //jump back to the top
            }
            // ...
            NSLog(@"The value of index is %i",i);
        }
        
        
         /*########*/
        //Variables -->
        //named container representing  a piece of memory set aside for use
        //naming in --> camel case
         /*########*/
        
        /*primitive*/
        //int ->signed by default -2.1 bilion 2.1 billion //32-bit 4bytes
        //for unsigned      -->  add 'unsigned' modifier
        //unsigned int myChore;
        //for long          --> add 'long' modifier
        //long int myChore;
        //on 32 bit -2.1 billion to +2.1 billion 4 bytes
        //on 64-bit -9223372036854775808 to
        //9223372036854775808                8 bytes
        //for long long     --> add 'long long' modifier
        //long long int myChore;
        //on 32 bit -9223372036854775808 to
        //9223372036854775808                8 bytes
        //on 64-bit -9223372036854775808 to
        //9223372036854775808                8 bytes
        //for short         --> add 'short' modifier
        //short int smallScore
        //on 32 bit -32,767 to 32,767       2 bytes
        //both signed and unsigned
        //short unsigned int smallScore;//all positive values
        
        //float                   4 bytes
        //float myFloat = 7.2f; //if no 'f' default is double;
        //double                  8 bytes
        //double myDouble = 7.2;
        

        
        float myF   = 7.2f;
        double myD  = 7.2;
        
        NSLog(@"The value of myF is %f & myD is %e",myD,myF);
        //%f double,float  //6 decimal places
        //%e 7.200000e+00
        
        int aintVar = 25;
        int bintVar = 2;
        float result = aintVar / bintVar;
        NSLog(@"The result is %f",result);
        //Output -> 12.000000 //truncates anything after decimal place
        float castedResult = (float)aintVar / bintVar;
        NSLog(@"The result is %f",castedResult);
        //Output -> 12.500000
        
        //char
        //1 byte 1 character
        char myChar = 'b';
        NSLog(@"The char is %c",myChar);
        
        //BOOL --> typedef signed char BOOL //objc.h
        BOOL isDone = YES;
        BOOL notDone = NO;
        NSLog(@"BOOL YES %c NO %c",isDone,notDone);//BOOL YES  NO
        NSLog(@"BOOL YES %i NO %i",isDone,notDone);//BOOL YES 1 NO 0
        
        //enum
        //define a datatype with restricted range of values
        enum seatPref {
            window = 0,
            aisle = 1,
            middle =2
        };
        
        enum seatPref bobSeatPref = aisle;
        enum seatPref fredSeatPref = window;
        enum seatPref joeSeatPref = middle;
        //enum seatPref joanSeatPref = front;
        
        if (bobSeatPref == window) {
            //do something
        }
        else if (fredSeatPref == window)
        {
            //do something else
        }
        else if (joeSeatPref == window)
        {
            //do something else
        }
        
        NSLog(@"Fred wants %i",fredSeatPref);
        
        //typedef
        typedef int simonsInt;
        simonsInt foo = 900;
        foo++;
        
        typedef enum _seatPref {_window = 0,_aisle = 1,_middle =2} seat_Pref;
        seat_Pref bloom = 200;
        bloom--;
        
         /*########*/
        //Pre-processor directive
         /*########*/
//#define <#macro#>
#define HIGHSCORE 10000;

        //During Compile Time
#if DEBUG
        NSLog(@"In DEBUG");
#endif
        
         /*########*/
        //STRING
         /*########*/
       // NSString /NSString.h
        NSString* message = @"Hello";
        NSLog(@"NSstring print out %@",message);
        
    }
    return 0;
}


//functions
/*
 returnType name(pramaters){
 }
 */
//singleparamter
void myFunction(void){
    //code
    return;
}

int my_Function(void){
    //code
    return 0;//function ends here
}

//Abstraction
//Poplymorphism
//Inheritance
//Encapsulation


void mynuFunc(NSString* foo)
{
    //do it
    return;
}



