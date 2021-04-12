//
//  main.m
//  Category关联对象底层
//
//  Created by mingjun zhang on 2019/4/20.
//  Copyright © 2019 mingjun zhang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZMJPerson.h"
#import "ZMJPerson+Attribute.h"
#import <objc/runtime.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {

        ZMJPerson *person = [[ZMJPerson alloc] init];
        person.name = @"张明军";
        NSLog(@"%@",person.name);
        
        
        {
            ZMJPerson *temp = [[ZMJPerson alloc] init];
            objc_setAssociatedObject(person, @"temp", temp, OBJC_ASSOCIATION_ASSIGN);
        }
        NSLog(@"%@", objc_getAssociatedObject(person, @"temp"));

        
        
    }
    return 0;
}



