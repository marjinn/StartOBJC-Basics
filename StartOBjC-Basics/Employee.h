//
//  Employee.h
//  StartOBjC-Basics
//
//  Created by mar Jinn on 12/8/13.
//  Copyright (c) 2013 mar Jinn. All rights reserved.
//

#import <Foundation/Foundation.h>
/*
 Supports Encoding
 Using NSKeyedArchiver
 */

@interface Employee : NSObject
{
    @private
    NSString* name;
    int grade;
}

@property(nonatomic,retain)NSString*name;
@property(nonatomic,assign)int grade;

@end
