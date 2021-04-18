

//
//  Student.m
//  Runtime
//
//  Created by mc on 2018/3/26.
//  Copyright © 2018年 mingjun zhang. All rights reserved.
//

#import "Student.h"

@interface Student ()

//私有属性
@property (nonatomic, assign) NSNumber *age;

//私有方法
-(void)sleep;

@end

@implementation Student


- (instancetype)init{
    if (self = [super init]) {
        _studentName = @"张三";
        _age = @18;
    }
    return self;
}

- (void)study{
    NSLog(@"%ld 岁的 %@正在努力的学习",[self.age integerValue],self.studentName);
}
- (void)sleep{
    NSLog(@"%@ 正在睡觉请勿打扰",self.studentName);
}

#pragma description方法的默认实现是返回类名和对象的内存地址 重写后返回的事成员变量的值
-(NSString*)description{
   return [NSString stringWithFormat:@"学生姓名:%@  学生年龄:%ld",self.studentName,[self.age integerValue] ];
}












@end



