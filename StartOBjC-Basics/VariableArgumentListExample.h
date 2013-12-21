//
//  VariableArgumentListExample.h
//  StartOBjC-Basics
//
//  Created by mar Jinn on 12/22/13.
//  Copyright (c) 2013 mar Jinn. All rights reserved.
//

#import <Foundation/Foundation.h>

void QuietLog(NSString* format,... );

@interface VariableArgumentListExample : NSObject

-(void)describeObjects:(id)firstObject,... __attribute__((sentinel));


@end
