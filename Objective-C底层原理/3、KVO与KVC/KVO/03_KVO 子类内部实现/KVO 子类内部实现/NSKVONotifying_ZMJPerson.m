//
//  NSKVONotifying_ZMJPerson.m
//  KVO 子类内部实现
//
//  Created by mingjun zhang on 2019/4/5.
//  Copyright © 2019 mingjun zhang. All rights reserved.
//

#import "NSKVONotifying_ZMJPerson.h"

@implementation NSKVONotifying_ZMJPerson


- (void)setAge:(int)age
{
    _NSSetIntValueAndNotify();
}

/*
 屏幕内部实现，隐藏了NSKVONotifying_MJPerson类的存在 使用[self.person class]的时候
 苹果并不希望把NSKVONotifying_Person这个类暴露出来，屏蔽内部实现，隐藏这个类的存在。
 */
- (Class)class
{
    return [ZMJPerson class];
}

- (void)dealloc
{
    // 收尾工作
}

- (BOOL)_isKVOA
{
    return YES;
}


@end

