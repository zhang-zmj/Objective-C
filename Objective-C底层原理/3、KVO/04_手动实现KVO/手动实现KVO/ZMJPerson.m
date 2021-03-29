//
//  ZMJPerson.m
//  手动实现KVO
//
//  Created by mingjun zhang on 2019/4/5.
//  Copyright © 2019 mingjun zhang. All rights reserved.
//

#import "ZMJPerson.h"

@implementation ZMJPerson

@synthesize name = _name;
- (void)setName:(NSString *)name
{
    _name = name;
}
- (NSString *)name
{
    return _name;
}

// 手动设定KVO
- (void)setAge:(NSString *)age
{
    [self willChangeValueForKey:@"age"];
    _age = age;
    [self didChangeValueForKey:@"age"];
}

- (NSString *)age
{
    return _age;
}

+ (BOOL)automaticallyNotifiesObserversForKey:(NSString *)key
{
    // 如果监测到键值为age,则指定为非自动监听对象
    if ([key isEqualToString:@"age"])
    {
        return NO;
    }
    
    return [super automaticallyNotifiesObserversForKey:key];
}


@end

