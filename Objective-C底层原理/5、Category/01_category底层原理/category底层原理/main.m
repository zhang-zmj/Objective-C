//
//  main.m
//  category分类基本
//
//  Created by mingjun zhang on 2019/4/13.
//  Copyright © 2019 mingjun zhang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZMJPerson.h"
#import "ZMJPerson+Eat.h"
#import "ZMJPerson+text.h"




int main(int argc, const char * argv[]) {
    @autoreleasepool {

        ZMJPerson *person = [[ZMJPerson alloc] init];
        [person run];
        [person test];
        [person eat];
        
        
        ZMJPerson *p = [[ZMJPerson alloc] init];
    //    [p run];
    //    [p addTest];
        [p printMethodNamesOfClass:[ZMJPerson class]];
        
        
    }
    
    
    
    return 0;
}

/*
1、分类中相同的方法名，哪个先调用？
    *根据编译顺序决定的，谁在前就先调用谁
*/






