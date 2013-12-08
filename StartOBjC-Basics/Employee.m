//
//  Employee.m
//  StartOBjC-Basics
//
//  Created by mar Jinn on 12/8/13.
//  Copyright (c) 2013 mar Jinn. All rights reserved.
//

#import "Employee.h"



@implementation Employee

@synthesize name,grade;


- (id)init
{
    self = [super init];
    if (self) {
        //initializations
    }
    return self;
}


- (void)dealloc
{
    //deallocations
    //[name release];non ARC
    name = nil;
}


-(NSString *)description
{
    NSString* desc;
    desc = [NSString stringWithFormat:@"Employee: %@, Grade: %i",
            [self name],[self grade]];
    return desc;
}


#pragma mark 
#pragma mark ENCODING

-(void)encodeWithCoder:(NSCoder *)coder
{
#if DEBUG
    NSLog(@"-(void)encodeWithCoder:(NSCoder *)coder");
#endif
    
    [coder encodeObject:[self name]
                 forKey:@"EMPName"];
    [coder encodeObject:[NSNumber numberWithInt:[self grade]]
                 forKey:@"EMPGrade"];
    
}

#pragma mark
#pragma mark DECODING
-(id)initWithCoder:(NSCoder *)coder
{
#if DEBUG
    NSLog(@"-(id)initWithCoder:(NSCoder *)coder");
#endif
    
    [self setName:[coder decodeObjectForKey:@"EMPName"]];
    
    NSNumber *gradeBox;
    gradeBox = (NSNumber *)[coder decodeObjectForKey:@"EMPGrade"];
    [self setGrade:(int)[gradeBox integerValue]];
    
    return self;
    
}


@end
