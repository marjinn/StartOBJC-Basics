//
//  F_astEnumerator.h
//  StartOBjC-Basics
//
//  Created by mar Jinn on 2/26/14.
//  Copyright (c) 2014 mar Jinn. All rights reserved.
//

#import <Foundation/Foundation.h>

//@interface F_astEnumerator : NSObject
//
//@end


//WORKING EXAMPLE in  main.m

#pragma mark
#pragma NSFastEnumeration example

@interface CArray : NSObject <NSFastEnumeration>
{
    NSString* __unsafe_unretained * _strings;
    int                             _stringCount;
    unsigned long                   _mutaions;
}

-(void)setStrings:(NSString *)string,... __attribute__((sentinel));
//-(void)set_Strings:(NSString *)string,... NS_REQUIRES_NIL_TERMINATION;


@end


