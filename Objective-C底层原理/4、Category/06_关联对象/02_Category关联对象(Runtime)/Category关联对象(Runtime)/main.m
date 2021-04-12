//
//  main.m
//  Category关联对象(Runtime)
//
//  Created by mingjun zhang on 2019/4/20.
//  Copyright © 2019 mingjun zhang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZMJPerson.h"
#import "ZMJPerson+Attribute.h"


extern const void *ZMJName_key;

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
//        NSLog(@"%p",ZMJName_key);
        
        ZMJPerson *person = [[ZMJPerson alloc] init];
        person.name = @"张明军";
        NSLog(@"%@",person.name);
        
        
    }
    return 0;
}


