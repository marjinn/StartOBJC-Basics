//
//  predef.h
//  StartOBjC-Basics
//
//  Created by mar Jinn on 12/21/13.
//  Copyright (c) 2013 mar Jinn. All rights reserved.
//

#import <Foundation/Foundation.h>


void someFunction(void);

/*
 @description
 We mic Obj C and Cpp code
 File name extention should be .mm
 */

//Call the CPP class
//because this is .mm file
void callCPP(void);

@interface SomeCalss : NSObject

+(void)someMethod;
+(void)someMethod:(int)num WithArgument:(NSString *)arg;

@end


