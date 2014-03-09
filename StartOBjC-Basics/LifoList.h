//
//  LifoList.h
//  StartOBjC-Basics
//
//  Created by mar Jinn on 3/8/14.
//  Copyright (c) 2014 mar Jinn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LifoList : NSObject <NSFastEnumeration>

@property(readonly,nonatomic)NSUInteger count;

-(void)addString:(NSString *)string;
-(NSString *)stringatindex:(NSUInteger)index;

@end


/*
 * Implementing a linked list
 */
@interface Node : NSObject
{
    
}
@property(copy,nonatomic)NSString* string;
@property(strong,nonatomic)Node* next;

@end