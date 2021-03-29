//
//  main.m
//  01_KVC基础
//
//  Created by zmj on 2021/3/29.
//

#import <Foundation/Foundation.h>
#import "ZMJPerson.h"
#import "ZMJObserver.h"


int main(int argc, const char * argv[]) {
    @autoreleasepool {
       
        ZMJObserver *observer = [[ZMJObserver alloc] init];
        ZMJPerson *person = [[ZMJPerson alloc] init];
     
        // 添加KVO监听
        [person addObserver:observer forKeyPath:@"age" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:NULL];
        
        // 通过KVC修改age属性
        [person setValue:@10 forKey:@"age"];
        
        // setAge:
        
        // 移除KVO监听
        [person removeObserver:observer forKeyPath:@"age"];
        
        
        
    }
    return 0;
}
