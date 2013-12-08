//
//  MyClass.m
//  StartOBjC-Basics
//
//  Created by mar Jinn on 12/8/13.
//  Copyright (c) 2013 mar Jinn. All rights reserved.
//

#import "MyClass.h"

@implementation MyClass

@synthesize privateNumber;

//accessor methods
//getters and setters


-(int)score
{
#if DEBUG
    NSLog(@"-(int)score");
#endif
    return score;
}

-(void)setScore:(int)S
{
#if DEBUG
    NSLog(@"-(void)setScore:(int)S");
#endif
    score =  S;
}



-(void)logMessage
{
#if DEBUG
    NSLog(@"-(void)logMessage");
#endif
    NSLog(@"The score is %i",[self score]);
}

+(void)initialize
{
    if (self == [MyClass class]) {
        //Makes sure this isn't executed once
#if DEBUG
        NSLog(@"+(void)initialize");
#endif
    }
}

-(id)init
{
#if DEBUG
    NSLog(@"-(id)init");
#endif
    self = [super init];
    if (self) {
        //code
        startDate = [[NSDate alloc]init];
    }
    return self;
    
    //If I want my Custom init to be the designated Initilaizer
    //return [self initWithScore:[self score]];
}


-(id)initWithScore:(int)s
{
    self = [super init];
    if (self) {
        //code
    }
    return self;
}


-(void)dealloc
{
#if DEBUG
    NSLog(@"-(void)dealloc");
#endif
    
    
    //[startDate release];;non ARC
    startDate = nil;
    
    
    //[super dealloc];non ARC
}

@end
