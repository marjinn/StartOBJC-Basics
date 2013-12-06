//
//  main.m
//  StartOBjC-Basics
//
//  Created by mar Jinn on 12/7/13.
//  Copyright (c) 2013 mar Jinn. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // insert code here...
        NSLog(@"Hello, World!");
        
        int  hours = 24;
        int minutes = 60;
        int seconds = 60;
        
        int product = 0;
        product = hours * minutes * seconds;
        NSLog(@"The Product is %d",product);
        
        
    }
    return 0;
}

