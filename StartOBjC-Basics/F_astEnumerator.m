//
//  F_astEnumerator.m
//  StartOBjC-Basics
//
//  Created by mar Jinn on 2/26/14.
//  Copyright (c) 2014 mar Jinn. All rights reserved.
//

//https://www.mikeash.com/pyblog/friday-qa-2010-04-16-implementing-fast-enumeration.html

#import "F_astEnumerator.h"
//
//@interface F_astEnumerator () 
//{
//     struct Node *listHead;
//}
//@end

//@implementation F_astEnumerator

//typedef struct {
//    unsigned long state;
//    id __unsafe_unretained *itemsPtr;
//    unsigned long *mutationsPtr;
//    unsigned long extra[5];
//} NSFastEnumerationState;

//- (NSUInteger)countByEnumeratingWithState:(NSFastEnumerationState *)state
//                                  objects:(id __unsafe_unretained [])buffer
//                                    count:(NSUInteger)len
//{
////    The objective of this method is to return a series of arrays of objects. Each call returns one array, which allows objects to be returned in bulk. For speed, this uses a C array, which means that it needs a pointer and a length
//    //len - length of the array that this method returns
//    //*itemsPtr from NSFastEnumerationState is the actual array
//    
////    NSFastEnumeration is designed to allow returning a pointer to internal storage. However, not all data structures fit well with that, so it's also designed to allow copying objects into an array provided by the caller. That caller-provided array is stackbuf, and its size is given by len.
//    
////    NSFastEnumeration is also designed to detect when a collection is mutated while being enumerated, and throw an exception if this occurs. mutationsPtr is indended to be pointed to a value which changes if the collection is mutated.
////        
////        That's just about everything. The only fields I haven't covered yet are the state and extra fields of NSFastEnumerationState. These are just freeform fields which the callee can use to store whatever values it finds useful.
//    
//    
//    // plan of action: extra[0] will contain pointer to node
//    // that contains next object to iterate
//    // because extra[0] is a long, this involves ugly casting
//    if(state->state == 0)
//    {
//        // state 0 means it's the first call, so get things set up
//        // we won't try to detect mutations, so make mutationsPtr
//        // point somewhere that's guaranteed not to change
//        void* tmp = NULL;
//        tmp = (__bridge void*)self;
//        
//        state->mutationsPtr = (unsigned long *)tmp;
//        
//        // set up extra[0] to point to the head to start in the right place
//        state->extra[0] = (long)listHead;
//        
//        // and update state to indicate that enumeration has started
//        state->state = 1;
//    }
//    
//    // pull the node out of extra[0]
//    struct Node *currentNode = (struct Node *)state->extra[0];
//    
//    // if it's NULL then we're done enumerating, return 0 to end
//    if(!currentNode)
//        return 0;
//        
//        // otherwise, point itemsPtr at the node's value
//    //state->itemsPtr = &(currentNode->value);
//    
//        // update extra[0]
//    if(currentNode){}
//            //state->extra[0] = (long)currentNode->next;
//    
//    // we're returning exactly one item
//    return 1;
//}
//



//
//-(void)letsEnumerate
//{
//    NSArray* enumArray;
//    enumArray = @[@1,@2,@3];
//    
//    NSEnumerator* enumerat0r;
//    enumerat0r = [enumArray objectEnumerator];
//    
//    NSNumber* number;
//    unsigned int count = 0;
//    
//    @autoreleasepool
//    {
//        while ((number = [enumerat0r nextObject]))
//        {
//            count++;
//            NSLog(@"string -> %@",number);
//        }
//    }
//    
//    NSLog(@"array Count -> %ud",count);//[enumArray count]
//    
//}
//
//
//
//@end


@implementation CArray

-(void)setStrings:(NSString *)string,...
{
    /*
     * Let's use the Va_list
     */
    /* Declare */
    va_list args;
    
    /* Initialize */
    va_start(args, string);
    
    //hold first var
    id tmpHolder = nil;
    tmpHolder = string;
    
   
        
        __unsafe_unretained NSString* tmp = nil;
    
    __strong NSString* str;
    
    str = [[NSString alloc]initWithFormat:string arguments:args];
    
    tmp = str;
    
    _strings = &tmp;
    
        
        NSLog(@"%@ - holderObj ",tmp);
    tmp = nil;
        
      //end
    va_end(args);
        
    
    
}


-(NSUInteger)countByEnumeratingWithState:(NSFastEnumerationState *)state
                                 objects:(__unsafe_unretained id [])buffer
                                   count:(NSUInteger)len
{
    
    if (state->state == 0) {
        /*
         * First call
         * We should set this to 1 so that we know this is not the first
         * iteration
         */
        state->state = 1;
        /*
         * You return objects for iteration in the array pointed to by itemsPtr. You can point this into the collection’s data structures if the collection stores object pointers linearly in memory. Otherwise, you can put as many as len object pointers into the stackbuf parameter and point itemsPtr there
         */
        state->mutationsPtr = &_mutaions;
        state->itemsPtr = _strings;
        
        return (self->_stringCount);
        
        /*
         * What It does.
         * The first call to this method finds the state’s state value to be zero, so it does first time initialization. It changes the state to a non-zero value so we know not to do the initialization work again. Then
         it sets the state’s mutationsPtr to point to the mutations instance variable and points the
         ￼￼￼itemsPtr to the C array instance variable. CArray stores all of its string pointers sequentially in memory, so we can tell the caller the total collection count. The for-in loop will then iterate over all of them. When this method is called a second time, it returns zero signifying that all iteration has been completed, and the for-in loop terminates. No matter how big our collection is, this -countByEnumeratingWithState:objects:count: method is only called twice
         */
        
    }
    else
    {
        /*
         * We have returned Everything
         */
        return 0;
    }//countByEnumeratingWithState
    
    
}


/*
 * Lookup table for displaying human readable translations of flags
 */
@end


