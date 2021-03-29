//
//  main.m
//  Objective-C对象的本质
//
//  Created by mingjun zhang on 2019/3/17.
//  Copyright © 2019 mingjun zhang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import <malloc/malloc.h>

//模拟器d（i386）  32bit (armv7)  64bit (arm64)

/*
 NSObject Implementation
  1、一个NSObject对象在内存中如下结构体
  2、Class：指向结构体的指针 typedef struct objc_class *Class;
 */
struct NSObject_IMPL {
    Class isa;  //指针8个字节
};

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSObject *obj = [[NSObject alloc] init];
        // 获得NSObject实例对象的成员变量所占用的大小 >> 8
        NSLog(@"%zd", class_getInstanceSize([NSObject class]));
        // 获得obj指针所指向内存的大小 >> 16
        NSLog(@"%zd", malloc_size((__bridge const void *)obj));

    }
    
    return 0;
}









