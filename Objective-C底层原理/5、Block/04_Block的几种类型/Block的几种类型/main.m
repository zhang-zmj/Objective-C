//
//  main.m
//  Block的集中类型
//
//  Created by mingjun zhang on 2019/4/21.
//  Copyright © 2019 mingjun zhang. All rights reserved.
//

#import <Foundation/Foundation.h>

//继承关系
void test (){
    
    void(^block)(void) = ^{
        NSLog(@"Hello");
    };
    NSLog(@"%@",[block class]);      //  __NSGlobalBlock__
    NSLog(@"%@",[[block class] superclass]);   //  __NSGlobalBlock
    NSLog(@"%@",[[[block class] superclass] superclass]);  //  NSBlock
    NSLog(@"%@",[[[[block class] superclass] superclass] superclass]); //NSObject
    
}


/*
 一切以运行时的结果为准，以clang c++生成的会有差别
 */
int main(int argc, const char * argv[]) {
    @autoreleasepool {

        
        void(^block1)(void) = ^{
            NSLog(@"Hello");
        };

        int age = 10;
        void(^block2)(void) = ^{
            NSLog(@"Hello - %d",age);
        };

        NSLog(@"\n%@ \n %@ \n %@\n",[block1 class],[block2 class],[^{

            NSLog(@"Hello - %d",age);
        } class]);
        
        

    }
    return 0;
}




