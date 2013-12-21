//
//  SomeOtherClass.cpp
//  StartOBjC-Basics
//
//  Created by mar Jinn on 12/21/13.
//  Copyright (c) 2013 mar Jinn. All rights reserved.
//

#include "SomeOtherClass.h"

//Default constructor implementation
//This Returns same object as that of the class
SomeOtherClass::SomeOtherClass(int _aVar)
{
    //To be decided
    //Can be used to initialize variables
}

//method implementtaion
void SomeOtherClass::SomeMemberFunction(int arg1, const char *arg2)
{
    printf("file %s, line %d\n",__FILE__,__LINE__);
    printf(" function: %s\n",__FUNCTION__);
    printf(" pretty function:%s\n",__PRETTY_FUNCTION__);
}//SomeMemberFunction