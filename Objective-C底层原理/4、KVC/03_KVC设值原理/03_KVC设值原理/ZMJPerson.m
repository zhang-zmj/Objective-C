//
//  ZMJPerson.m
//  01_KVC基础
//
//  Created by zmj on 2021/3/29.
//

#import "ZMJPerson.h"

@implementation ZMJPerson

//- (void)setAge:(int)age
//{
//    NSLog(@"setAge: - %d", age);
//}


//- (void)_setAge:(int)age
//{
//    NSLog(@"_setAge: - %d", age);
//}


// 默认的返回值就是YES， 默认返回成员变量
+ (BOOL)accessInstanceVariablesDirectly
{
    return YES;
}



@end




