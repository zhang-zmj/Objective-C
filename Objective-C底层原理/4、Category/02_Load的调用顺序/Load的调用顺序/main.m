//
//  main.m
//  Load的调用顺序
//
//  Created by mingjun zhang on 2019/4/14.
//  Copyright © 2019 mingjun zhang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZMJPerson.h"
#import "ZMJStudent.h"
#import <objc/runtime.h>

void printMethodNamesOfClass(Class cls)
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
    NSLog(@"%@ %@", cls, methodNames);
}



int main(int argc, const char * argv[]) {
    @autoreleasepool {
   
        //继承关系：ZMJPerson、ZMJStudent
        //非继承关系：ZMJPerson、ZMJDog、ZMJCat
        
        
        [ZMJStudent load];
        //        objc_msgSend();
        // isa
        // superclass
        // superclass
        
        //        objc_msgSend([ZMJStudent class], @selector(load));
        
        // isa
        // superclass
        
        //        objc_msgSend([ZMJPerson class], @selector(test));
        
        //        printMethodNamesOfClass(object_getClass([ZMJPerson class]));
        
    
    }
    return 0;
}










