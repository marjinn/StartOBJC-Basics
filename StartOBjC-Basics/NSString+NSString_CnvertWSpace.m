//
//  NSString+NSString_CnvertWSpace.m
//  StartOBjC-Basics
//
//  Created by mar Jinn on 12/8/13.
//  Copyright (c) 2013 mar Jinn. All rights reserved.
//

#import "NSString+NSString_CnvertWSpace.h"
#import <objc/runtime.h>

@implementation NSString (NSString_CnvertWSpace)

#pragma mark
#pragma mark adding instance Variable -With RunTime MAgic

//#############################################
//adding instance Variable -With RunTime MAgic
//#############################################

//static char const * const defaultKey = "defltVar";
static const char defltVarKey;

-(void)setDeflt:(NSString *)deflt
{
    //OBJC_EXPORT void objc_setAssociatedObject(id object, const void *key, id value, objc_AssociationPolicy policy)
    //__OSX_AVAILABLE_STARTING(__MAC_10_6, __IPHONE_3_1);
    
    /*
    Associative Object Behaviors
    Policies related to associative references.
    
    enum {
        OBJC_ASSOCIATION_ASSIGN = 0,
        OBJC_ASSOCIATION_RETAIN_NONATOMIC = 1,
        OBJC_ASSOCIATION_COPY_NONATOMIC = 3,
        OBJC_ASSOCIATION_RETAIN = 01401,
        OBJC_ASSOCIATION_COPY = 01403
    };
     */
    
    
    objc_setAssociatedObject(self,(void *)&defltVarKey, deflt, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    //objc_setAssociatedObject(self, defaultKey, deflt, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    
}


-(NSString *)deflt
{
    
    //OBJC_EXPORT id objc_getAssociatedObject(id object, const void *key)
    //__OSX_AVAILABLE_STARTING(__MAC_10_6, __IPHONE_3_1);
    return objc_getAssociatedObject(self,(void *) &defltVarKey);
    
    //return objc_getAssociatedObject(self,(void *) defaultKey);
}

//#############################################
//adding instance Variable -With RunTime MAgic
//#############################################


#pragma mark

-(NSString*)convertWhiteSpace;
{
    return [self stringByReplacingOccurrencesOfString:@" "
                                           withString:@"_"];
}

@end
