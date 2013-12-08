//
//  MyClass.h
//  StartOBjC-Basics
//
//  Created by mar Jinn on 12/8/13.
//  Copyright (c) 2013 mar Jinn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyClass : NSObject
{
//instance variable -private by default
int score;
int privateNumber;
    
    NSDate* startDate;
    
}


//accessor methods
//getters and setters
-(int)score;
-(void)setScore:(int)S;

//OR
@property(nonatomic,assign)int privateNumber;

//methods - public
-(void)logMessage;

-(id)initWithScore:(int)s;


@end
