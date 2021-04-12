//
//  NSKVONotifying_MJPerson.m
//  KVO的本质
//
//  Created by mingjun zhang on 2019/4/5.
//  Copyright © 2019 mingjun zhang. All rights reserved.
//

#import "NSKVONotifying_MJPerson.h"

@implementation NSKVONotifying_MJPerson

- (void)setAge:(int)age
{
    _NSSetIntValueAndNotify();
}

// 伪代码
void _NSSetIntValueAndNotify()
{
    [self willChangeValueForKey:@"age"];
    [super setAge:age];
    [self didChangeValueForKey:@"age"];
}

- (void)didChangeValueForKey:(NSString *)key
{
    // 通知监听器，某某属性值发生了改变
    [oberser observeValueForKeyPath:key ofObject:self change:nil context:nil];
}


@end


