//
//  main.m
//  Block对象类型的变量
//
//  Created by mingjun zhang on 2019/4/26.
//  Copyright © 2019 mingjun zhang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZMJPerson.h"

typedef void(^ZMJBlock)(void);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
      
       //person什么时候释放
        ZMJPerson *person = [[ZMJPerson alloc] init];
        person.age = 10;
        
        ZMJBlock block = ^{
            NSLog(@"--------%d",person.age);
        };
        block();
        NSLog(@"%@",[block class]);
        
    }
    return 0;
}



