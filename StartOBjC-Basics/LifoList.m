//
//  LifoList.m
//  StartOBjC-Basics
//
//  Created by mar Jinn on 3/8/14.
//  Copyright (c) 2014 mar Jinn. All rights reserved.
//

#import "LifoList.h"

@interface LifoList()
{
    Node* _head;
    /*
     * This variable basically is our linked list
     * 1)For one instance of LifoList 
            has an instance of Node 
            which has two variables
                    1)NSString* string
                    2)Node* next
            The second variable of the type Node is of
            the same type as the class(Node) itself
            therby making any  variable which is of type Node
            getting an unending (linked ) list of variables that belong to Node class
     
     eg:
     _head	Node *	nil	
         NSObject	NSObject
        _string	NSString *	nil
        _next	Node *	nil
            NSObject	NSObject
            _string	NSString *	nil
            _next	Node *	nil
                NSObject	NSObject
                _string	NSString *	nil
                _next	Node *	nil
                    NSObject	NSObject
                    _string	NSString *	nil
                    _next	Node *	nil
                        NSObject	NSObject
                        _string	NSString *	nil
                        _next	Node *	nil
                            NSObject	NSObject
                            _string	NSString *	nil
                            _next	Node *	nil
                                NSObject	NSObject
                                _string	NSString *	nil
                                _next	Node *	nil
                                ... and on and on and on
     
              So To store a value we use the 1st 1) variable "string" of Node
                    and the second 2) variable of type Node will be set everytime
                                we add a new member to the list
                
              i.e,
     
                   step (1) [node setString:string];
                            this sets the "string variable of" node -
                            which is  a local instance of "Node" hence gets both 
                            "string" and "next"(which is of type node) from Node
                   step (2) [node setNext:_head]
                            get LifoList's _head(Node) and assign it to "next"
                            thereby making its "string" and "_next" same as 
                            that of _head
                   Step (3) _head = node;
                            Set _head of LifoList to node
                            i.e everytime  you add a new object the exiting 
                            _head will be set to _next (Node) variable
                            and then the new Node object with it's modified _next
                            which houses all previous modifications to _head
                            will be set to _head
                            Hence we get all modification ,no matter how many of them
                            are there
                            Same trick can be repeated with structs
    */
    NSUInteger _count;
    unsigned long _mutations;
}

@end

@implementation LifoList

-(void)addString:(NSString *)string
{
    /*
     * Add a new node to the head of the list
     */
     Node* __strong node;
    node = [Node new];  //marks the beginning of the list
    
    /**
     * Put it at the start of the list
     */
    [node setString:string];
    
    [node setNext:_head];//add it to InfoLists variable _head
    
   // so now _head which is of type Node which has an object "next" fo type  itself
    //also set the newly created new node object to the LifoList's variable _head
   // ie
   // Now both _head of InfoList and _next of Node points to the same object
    
    //set the next variable of the newly creted object to the contents
    //of the _head variable of LifoList
    //
    // now set the _head of infolist to the new object
    _head = node;
    node = nil;
    
    /*
     * Book keeping
     */
    _count++;
    /*
     * You can see the mutations pointer being incremented at the end.
     * That’s fast enumeration bookkeeping so the iterating machinery 
     * can catch collections being changed while iteration happens.
     */
    _mutations++;

}//addString

-(NSString *)stringatindex:(NSUInteger)index
{
    Node* scan;
    scan = _head;
    
    for (NSUInteger i = 0; i < index ; i++)
    {
        scan = scan.next;
    }
    
    return scan.string;
    
}

//typedef struct {
//    unsigned long state;
//    id __unsafe_unretained *itemsPtr;
//    unsigned long *mutationsPtr;
//    unsigned long extra[5];
//}
-(NSUInteger)countByEnumeratingWithState:(NSFastEnumerationState *)state
                                 objects:(__unsafe_unretained id [])buffer
                                   count:(NSUInteger)len
{
    // Sanity check.  I know sizeof(unsigned long) >= sizeof(pointer), but be
    // a little paranoid.
    assert(sizeof(Node *) <= sizeof(unsigned long));
    
    //using NSFastEnumerationState's extra[0] as the scan pointer
    
    if (state->state ==0)/* First time */
    {
        /* Set it to 1 */
        state->state = 1;
        
        /* Set mutationPtr of  NSFastEnumerationState */
        state->mutationsPtr = &_mutations; /* Can't be null */
        
        state->extra[0] = (unsigned long)_head;

    }
    
    Node* scan = 0;
    scan = (__bridge Node *)((void *)state->extra[0]);
    
    //Fill up as much of the stack buffer as we can
    NSUInteger i;
    for (i = 0; (i < len) && (scan != nil); i++)
    {
        buffer[i] = [scan string];
        scan = [scan next];
    }
    
    state->extra[0] = (unsigned long)scan;
    
    /* Point the returns item pointer to the stack buffer */
    state->itemsPtr = buffer;
    
    return i;

}//countByEnumeratingWithState

@end


@implementation Node
 extern const NSString* const WTF;
 NSString* const WTF = @"string";
//

@end