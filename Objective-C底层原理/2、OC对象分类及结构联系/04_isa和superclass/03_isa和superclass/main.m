//
//  main.m
//  03_isa和superclass
//
//  Created by zmj on 2021/3/28.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import "NSObject+Test.h"

@interface ZMJPerson : NSObject

+ (void)test;

@end

@implementation ZMJPerson

//+ (void)test
//{
//    NSLog(@"+[ZMJPerson test] - %p", self);
//}

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
   
        //1、打印对象地址
        NSLog(@"[ZMJPerson class] - %p", [ZMJPerson class]);
        NSLog(@"[NSObject class] - %p", [NSObject class]);
        
    
        [ZMJPerson test];
//        objc_msgSend([ZMJPerson class], @selector(test))
        
        // isa -> superclass -> suerpclass -> superclass -> .... superclass == nil
        
        [NSObject test];
//        objc_msgSend([NSObject class], @selector(test))
        
    
        
        
    }
    return 0;
}



