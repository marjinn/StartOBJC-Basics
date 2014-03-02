//
//  FunRunWithTheRunTime.m
//  StartOBjC-Basics
//
//  Created by mar Jinn on 3/2/14.
//  Copyright (c) 2014 mar Jinn. All rights reserved.
//

#import "FunRunWithTheRunTime.h"
#import <objc/runtime.h>

@implementation FunRunWithTheRunTime

/*
 * This is essentilaly an Objc method
 * and I will add this to the class  When i want using Runtime
 *
 * Step 1 - Not really necessary
 * Declare the prototype of the method you want to provide  a dynamic implementation for
 * eg: here my C function is void backGrounNotificationCall(id self,SEL _cmd)
 and the method to be cretaed from this is
 void backGrounNotificationCall(id self,SEL _cmd);
 *
 * Step 2
 * you override +(BOOL)resolveInstanceMethod:(SEL)sel for instance method
 * + (BOOL)resolveClassMethod:(SEL)sel for class method
 *
 * Step 3
 * call the runtime method
 * BOOL class_addMethod(Class cls, SEL name, IMP imp, const char *types)
 * cls = [self class] or equivalent
 * name = name of the method that you decalred ,the Objc one
 * IMP = function pointer to the C function we use
 *              typedef id (*IMP)(id, SEL, ...); <-- this is the signature
 *                                                 of the function we
 *                                                  need to implement.
 *
 * types =
 * types
 An array of characters that describe the types of the arguments to the method.
 For possible values, see Objective-C Runtime Programming Guide > “Type Encodings”.
 Since the function must take at least two arguments—self and _cmd,
 the second and third characters must be “@:” (the first character is the return type).
 i.e if we have added arguments to our C function
 for e.g
 C function
 void myCTransformerFunc(id self,SEL _cmd,int someNumber)
 then types = "int@:"
 */
void backGrounNotificationCall(id self,SEL _cmd,NSNotification* notification)
{
    /*
     * This func was created to be used as selector for notification
     */
    
}

+(BOOL)resolveInstanceMethod:(SEL)sel
{
    BOOL methodAddresult;
    SEL selector;
    selector = NSSelectorFromString(@"backGrounNotificationCall:");
    
    //or
    
    SEL anotherSelector;
    anotherSelector = sel_registerName("backGrounNotificationCall:");
    
    /*
     * To suppress the undeclared selector warning
     *
     * Step 1) As Above
     *
     * Step 2) use #pragma clang diagnostic push
     */
    
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
    if (sel == @selector(backGrounNotificationCall:))
    {
        /*
         * add method dynamically to class
         * trying to test this behaviour
         * will use this method as the selector to be invoked when the notification fires
         */
        methodAddresult =
        class_addMethod([self class], sel, (IMP)backGrounNotificationCall, "NSNotification*@:");
        
        return methodAddresult;
    }
#pragma clang diagnostic pop
    
    return [super resolveInstanceMethod:sel];
}



@end
