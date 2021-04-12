//
//  main.m
//  如何确定Block的类型
//
//  Created by mingjun zhang on 2019/4/23.
//  Copyright © 2019 mingjun zhang. All rights reserved.
//

#import <Foundation/Foundation.h>

#pragma mark -- block类型的验证 ---
void test (){
    
    //Global 没有访问 auto 变量  __NSGlobalBlock__
    void (^block1)(void) = ^{
        NSLog(@"-----------");
    };
    NSLog(@"%@",[block1 class]);
    
    
    //Stack 没有访问 auto 变量  __NSStackBlock__  超出作用域后会自动销毁
    int age = 10;
    void (^block2)(void) = ^{
        NSLog(@"-----------%d",age);
    };
    NSLog(@"%@",[block2 class]);
    
}


#pragma mark -- stack 转 malloc ---
void (^block)(void);
void test1 ()
{
    //NSStackBlock  出了test1会自动销毁，得到的值不正确，只有让它转为malloc类型(堆上)，才能不变,使用copy
    int age = 10;
    block = [^{
        NSLog(@"block ------- %d",age);
    } copy];
    
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
    
        test1();
        block();
        
    }
    return 0;
}










