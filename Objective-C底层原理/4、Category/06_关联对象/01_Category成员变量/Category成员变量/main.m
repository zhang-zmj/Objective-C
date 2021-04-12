//
//  main.m
//  Category成员变量
//
//  Created by mingjun zhang on 2019/4/20.
//  Copyright © 2019 mingjun zhang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZMJPerson.h"
#import "ZMJPerson+Attribute.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {

        ZMJPerson *person1 = [[ZMJPerson alloc] init];
        person1.age = 10;
        person1.weight = 20;
        NSLog(@"person1 age is %d, person1 weight is %d",person1.age,person1.weight);
       
        ZMJPerson *person2 = [[ZMJPerson alloc] init];
        person2.age = 30;
        person2.weight = 50;
        NSLog(@"person2 age is %d, person2 weight is %d",person2.age,person2.weight);
        
    }
    return 0;
}
