//
//  main.m
//  Block的基本使用
//
//  Created by mingjun zhang on 2019/4/20.
//  Copyright © 2019 mingjun zhang. All rights reserved.
//

#import <Foundation/Foundation.h>

//block的实现流程介绍
struct __block_impl {
    void *isa;
    int Flags;
    int Reserved;
    void *FuncPtr;  //函数地址，通过函数地址调用方法
};

struct __main_block_desc_0 {
    size_t reserved;
    size_t Block_size; //储存大小
};

struct __main_block_impl_0 {
    struct __block_impl impl;  //block的实现
    struct __main_block_desc_0* Desc; //描述block信息
    int age;
};


int main(int argc, const char * argv[]) {
    @autoreleasepool {

        //基础的block
//        ^{
//            NSLog(@"this is a block");
//            NSLog(@"this is a block");
//            NSLog(@"this is a block");
//        }();
       
       
        //把block存起来
//        void (^block)(void) = ^{
//            NSLog(@"this is a block");
//            NSLog(@"this is a block");
//        };
//        block();
        
        
        int age = 20;
        
        void (^block)(int, int) =  ^(int a , int b){
            NSLog(@"this is a block! -- %d", age);
            NSLog(@"this is a block!");
            NSLog(@"this is a block!");
            NSLog(@"this is a block!");
        };
        block(10, 10);
        
        
        struct __main_block_impl_0 *blockStruct = (__bridge struct __main_block_impl_0 *)block;
        
        block(10, 10);
        
        
        
    }
    return 0;
}



