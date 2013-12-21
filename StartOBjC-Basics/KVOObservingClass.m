//
//  KVOObservingClass.m
//  KVODONERIGHT
//
//  Created by mar Jinn on 12/21/13.
//  Copyright (c) 2013 mar Jinn. All rights reserved.
//

#import "KVOObservingClass.h"
#import "KVOValueClass.h"


@implementation KVOObservingClass

static void *contxt = &contxt;

- (id)init
{
    self = [super init];
    if (self)
    {
        //initializations
//        KVOValueClass* nuValueClass;
//        nuValueClass = [[KVOValueClass alloc]init];
        
//        [NSTimer scheduledTimerWithTimeInterval:5.0
//                                         target:self
//                                       selector:@selector(toBeImplementd)
//                                       userInfo:nil
//                                        repeats:YES];
        
        nukvoKlass = [[ KVOValueClass alloc]init];
        
        [nukvoKlass addObserver:self
               forKeyPath:@"firstValue"
                  options:NSKeyValueObservingOptionNew
                  context:(void *)contxt];
        
        
        while (true) {
            [self toBeImplementd];
        }

        
    }
    return self;
}

-(void)toBeImplementd
{
   // @autoreleasepool {
//    KVOValueClass* nuValue_Class;
//    nuValue_Class = [[KVOValueClass alloc]init];
    [nukvoKlass setFirstValue:[NSString stringWithFormat:@"%u", arc4random()]];
        NSLog(@"%@",[nukvoKlass firstValue]);
    //}
}

-(void)observeValueForKeyPath:(NSString *)keyPath
                     ofObject:(id)object
                       change:(NSDictionary *)change
                      context:(void *)context
{
    if (context == contxt)
    {
        // do stuff
        if ([keyPath isEqualToString:@"firstValue"])
        {
            //statements
            if ([[change objectForKey:NSKeyValueChangeNewKey]
                 isKindOfClass:[NSString class]])
            {
                //statements
                NSString *changedValue;
                changedValue = (NSString *)[change objectForKey:NSKeyValueChangeNewKey];
                NSLog(@"changedValue%@",changedValue);
                
                 
            }
            
        }
        
    }
    else
    {
        [super observeValueForKeyPath:keyPath
                             ofObject:object
                               change:change
                              context:context];
    }
}


- (void)dealloc
{
    //deallocations
    [self removeObserver:self
              forKeyPath:@"firstValue"
                 context:(void *)contxt];
}
@end
