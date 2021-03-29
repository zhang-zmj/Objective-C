
//
//  ZMJPerson.m
//  category分类基本
//
//  Created by mingjun zhang on 2019/4/13.
//  Copyright © 2019 mingjun zhang. All rights reserved.
//

#import "ZMJPerson.h"
#import <objc/runtime.h>

@implementation ZMJPerson

- (void)run{
    
    NSLog(@"run");
    
}

+(void)run{
    
      NSLog(@"run");
    
}


//打印所有的方法进行证明
- (void)printMethodNamesOfClass:(Class)cls
{
    
    unsigned int count;
    // 获得方法数组
    Method *methodList = class_copyMethodList(cls, &count);
    // 存储方法名
    NSMutableString *methodNames = [NSMutableString string];
    
    // 遍历所有的方法
    for (int i = 0; i < count; i++) {
        // 获得方法
        Method method = methodList[i];
        // 获得方法名
        NSString *methodName = NSStringFromSelector(method_getName(method));
        // 拼接方法名
        [methodNames appendString:methodName];
        [methodNames appendString:@", "];
    }
    
    // 释放
    free(methodList);
    
    // 打印方法名
    NSLog(@"%@ - %@", cls, methodNames);
    
}




@end


