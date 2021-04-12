//
//  main.m
//  Block的copy
//
//  Created by mingjun zhang on 2019/4/26.
//  Copyright © 2019 mingjun zhang. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef void (^ZMJBlock)(void);

ZMJBlock zmjBlock(){
    
    int age = 10;
    return ^{
        NSLog(@"-------");
    };
};

int main(int argc, const char * argv[]) {
    @autoreleasepool {
   
        //1、block作为函数返回值时
//        ZMJBlock block = zmjBlock();
//        block();
//        NSLog(@"%@",[block class]);
        
        //2、将block赋值给__strong指针时
//        int number = 10;
//        ZMJBlock block = ^{
//            NSLog(@"-------%d",number);
//        };
//        NSLog(@"%@ ---- %@",[block class],[^{
//            NSLog(@"-------%d",number);
//        } class]);
        
        //3、 block作为Cocoa API中方法名含有usingBlock的方法参数时
//        NSArray *array = @[];
//        [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//
//        }];
        
        //4、 block作为GCD API的方法参数时
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
        });

        
    }
    return 0;
}






