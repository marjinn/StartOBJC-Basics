//
//  FunRunWithTheRunTime.m
//  StartOBjC-Basics
//
//  Created by mar Jinn on 3/2/14.
//  Copyright (c) 2014 mar Jinn. All rights reserved.
//

#import "FunRunWithTheRunTime.h"
#import <objc/runtime.h>

#pragma mark
#pragma Dynamic Method Resolution

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


#pragma mark
#pragma Getting a method Address
/*
 * The only way to circumvent dynamic binding is to get the address of a method and call it directly as if it were a function. This might be appropriate on the rare occasions when a particular method will be performed many times in succession and you want to avoid the overhead of messaging each time the method is performed.
 *  This might be appropriate on the rare occasions when a particular method will be performed many times in succession and you want to avoid the overhead of messaging each time the method is performed.
 */

/*
 * 1) Create a function pointer with input parameters of the selctor
        including the hidden ones id & SEL 
    and also the return type
 
    for eg: 
    Method :      -(void)MethodToBeCalled:(BOOL)someBool
    IMP Pointer : void(*setter)(__strong id ,SEL ,BOOL );
                    name of the poiner could be anything
    
 * 2) get the actual method Implementation ie a function pointer
        setter = (void(*)(__strong id ,SEL ,BOOL ))
    [self methodForSelector:@selector(MethodToBeCalled:)];
 
 */
-(void)callAMethodsImplementationOevrAndOverAgain
{
    
    void(*setter)(__strong id ,SEL ,BOOL );
    
    int i;
    
    setter = (void(*)(__strong id ,SEL ,BOOL ))
    [self methodForSelector:@selector(MethodToBeCalled:)];
    
    for (i = 0; i < 1000 ; i++)
    {
        //
        setter(self,@selector(MethodToBeCalled:),YES);
    }
    
    return;
}

-(void)MethodToBeCalled:(BOOL)someBool
{
    NSLog(@"string\n%@",NSStringFromSelector(_cmd));
    return;
}


-(void)getPr
{
    id LenderClass;
    LenderClass = objc_getClass("Lender");
    
    unsigned int outCount;
    outCount = 0;
    
    objc_property_t* properties;
    properties = class_copyPropertyList(LenderClass, &outCount);
    
    //get property with name alone
    for (int i = 0; i < outCount; i++) {
        objc_property_t property;
        property = properties[i];
        
        fprintf(stdout,"%s %s\n",
                property_getName(property),
                property_getAttributes(property)
                );
        
    }
}


@end

#pragma mark
#pragma Getting the list of properties
@interface Lender : NSObject
{
    float alone;
    int (*functionPointerDefault)(char *);
}

@property float alone;
//@property (nonatomic)  int (*functionPointerDefault)(char *);

@end

@implementation Lender
@synthesize alone;
//@synthesize functionPointerDefault;
//methods
- (id)init
{
    self = [super init];
    if (self) {
        //
        //[self setFunctionPointerDefault:function_PointerDefault];
        self->functionPointerDefault = function_PointerDefault;
    }
    return self;
}

int function_PointerDefault(char *Woah)
{
    printf("%s",__func__);
    return 0;
}


@end



