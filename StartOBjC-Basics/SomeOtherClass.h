//
//  SomeOtherClass.h
//  StartOBjC-Basics
//
//  Created by mar Jinn on 12/21/13.
//  Copyright (c) 2013 mar Jinn. All rights reserved.
//

#ifndef __StartOBjC_Basics__SomeOtherClass__
#define __StartOBjC_Basics__SomeOtherClass__

#include <iostream>

#endif /* defined(__StartOBjC_Basics__SomeOtherClass__) */

class SomeOtherClass
{
//private  variables
private:
    int aVAr;

    //private default constructor
    SomeOtherClass(){}

    //public Methods
public:
    //public constructor
    SomeOtherClass(int _aVar);
    
    //method
    void SomeMemberFunction (int arg1, const char *arg2);
    
    //getter for aVAr
    int GetaVar(void)
    {
        return aVAr;
    }
    //setter for aVAr
    void SetaVar(int a_VAr)
    {
        aVAr = a_VAr;
    }
};