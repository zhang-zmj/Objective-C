//
//  main.m
//  Class(类)对象
//
//  Created by mingjun zhang on 2019/3/24.
//  Copyright © 2019 mingjun zhang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>


int main(int argc, const char * argv[]) {
    @autoreleasepool {
    
        NSObject *object1 = [[NSObject alloc] init];
        NSObject *object2 = [[NSObject alloc] init];
        
        Class objectClass1 = [object1 class];
        Class objectClass2 = [object2 class];
        Class objectClass3 = [NSObject class];
        Class objectClass4 = object_getClass(object1); //Runtime API
        Class objectClass5 = object_getClass(object2); //Runtime API
       
        //objectClass1 ~ objectClass5都是NSObject的class对象（类对象）
        
        NSLog(@"%p %p",object1,object2);
        
        NSLog(@"%p %p %p %p %p",
              objectClass1,
              objectClass2,
              objectClass3,
              objectClass4,
              objectClass5);

    }
    return 0;
}


