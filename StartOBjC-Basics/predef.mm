//
//  predef.mm
//  StartOBjC-Basics
//
//  Created by mar Jinn on 12/21/13.
//  Copyright (c) 2013 mar Jinn. All rights reserved.
//

#import "predef.h"

void someFunction(void)
{
    printf("file %s, line %d\n",__FILE__,__LINE__);
    printf(" function: %s\n",__FUNCTION__);
    printf(" pretty function:%s\n",__PRETTY_FUNCTION__);
}//someFunc

#pragma mark -
#pragma mark OBJ C
@implementation SomeCalss

+(void)someMethod
{
    printf("file %s, line %d\n",__FILE__,__LINE__);
    printf(" function: %s\n",__FUNCTION__);
    printf(" pretty function:%s\n",__PRETTY_FUNCTION__);
}//someMethod

+(void)someMethod:(int)num WithArgument:(NSString *)arg
{
    printf("file %s, line %d\n",__FILE__,__LINE__);
    printf(" function: %s\n",__FUNCTION__);
    printf(" pretty function:%s\n",__PRETTY_FUNCTION__);
}//someMethod:WithArgument:

@end

#pragma mark -
#pragma mark C++
//WE can Mix CPP CODE
//THE FILE EXTENTION SHOULD BE .mm
//C++ YO!
class SomeOtherClass
{
public:
    void SomeMemberFunction(int arg1,const char *arg2){
        printf("file %s, line %d\n",__FILE__,__LINE__);
        printf(" function: %s\n",__FUNCTION__);
        printf(" pretty function:%s\n",__PRETTY_FUNCTION__);
    }//SomeMemberFunction
    
};


//Call the CPP class
//because this is .mm file and my main is main.m
void callCPP(void)
{
    SomeOtherClass something;
    something.SomeMemberFunction(23, "hi");
}//callCPP



