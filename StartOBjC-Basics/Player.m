//
//  Player.m
//  StartOBjC-Basics
//
//  Created by mar Jinn on 12/7/13.
//  Copyright (c) 2013 mar Jinn. All rights reserved.
//

#import "Player.h"

@implementation Player

@synthesize model = _model;

/*
Class-Level Initialization
The initialize method is the class-level equivalent of init.
 It gives you a chance to set up the class before anyone uses it.
 For example, we can use this to populate the _defaultModel variable with a valid value, like so:
 */

/*
 The initialize class method is called once for every class before the class 
 is used. This includes all subclasses of Car, which means that 
 Car will get two initialize calls if one of its subclasses 
 didn’t re-implement it. As a result, 
 it’s good practice to use the self == [Car class] conditional 
 to ensure that the initialization code is only run once. 
 Also note that in class methods, 
 the self keyword refers to the class itself, not an instance.
 */

+(void)initialize
{
    if (self == [Player class]) {
        //Makes sure this isn't executed once
        NSLog(@"+(void)initialize");
    }
}

-(id)initWithModel:(NSString*)aModel
{
    NSLog(@"-(id)initWithModel:(NSString*)aModel");
    self = [super init];
    if (self) {
        //custom init
        
    }
    return self;
    
}

-(id)init
{
    NSLog(@"-(id)init");
    return [self initWithModel:_model];
}

//Copy Attribute explanation
/* http://rypress.com/tutorials/objective-c/properties.html
Car *honda = [[Car alloc] init];
NSMutableString *model = [NSMutableString stringWithString:@"Honda Civic"];
honda.model = model;

NSLog(@"%@", honda.model);
[model setString:@"Nissa Versa"];
NSLog(@"%@", honda.model);            // Still "Honda Civic"
*/

@end
