//
//  main.m
//  Block变量
//
//  Created by mingjun zhang on 2019/4/21.
//  Copyright © 2019 mingjun zhang. All rights reserved.
//

#import <Foundation/Foundation.h>

//全局变量
int age_ = 10;
static int weight_ = 10;

int main(int argc, const char * argv[]) {
    @autoreleasepool {

        
        
        
//        void (^block)(void) = ^{
//            //age的值捕获进来（capture）
//            NSLog(@"age is %d weight is %d",age_,weight_);
//        };
//        age_ = 20;
//        weight_ = 20;
//        block();
       

    
        
//        //局部变量
//        //auto：自动变量，离开作用域就销毁
//        auto int age = 10;      //值传递
//        static int weight = 10; // 指针传递，取出的是最新的值
//
//        void (^block)(void) = ^{
//            //age的值捕获进来（capture）
//            NSLog(@"age is %d weight is %d",age,weight);
//        };
//
//        age = 20;
//        weight = 20;
//        block();
//
    
        
        
        
        
//        int age = 10;
//        void (^block)(void) = ^{
//            NSLog(@"age is %d",age);
//        };
//        age = 20;
//        block();
    
        
        
        
    }
    return 0;
}
