//
//  AddPerson.m
//  Runtime
//
//  Created by mingjun zhang on 2018/3/25.
//  Copyright © 2018年 mingjun zhang. All rights reserved.
//

#import "AddPerson.h"

@implementation AddPerson

//没有返回值，没有参数  _cmd:当前方法的方法编号
void aaa(id self, SEL _cmd, NSNumber *meter) {
    NSLog(@"跑了%@", meter);
}

/*
 何方法默认都有两个隐式参数,self,_cmd
 什么时候调用:只要一个对象调用了一个未实现的方法就会调用这个方法,进行处理
 作用:动态添加方法,处理未实现
 */
+ (BOOL)resolveInstanceMethod:(SEL)sel{
    
    if (sel == NSSelectorFromString(@"run:")) {
        
        class_addMethod(self,sel, (IMP)aaa, "v@:@");
        
    }
    return [super resolveInstanceMethod:sel];
    
}

 /*
    class: 给哪个类添加方法
    SEL: 添加哪个方法
    IMP: 方法实现 => 函数 => 函数入口 => 函数名
    type: 方法类型
 */



@end
