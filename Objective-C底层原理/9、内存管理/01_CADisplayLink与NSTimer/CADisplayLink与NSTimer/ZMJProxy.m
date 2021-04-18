//
//  ZMJProxy.m
//  01-定时器
//
//  Created by zmj on 2019/8/20.
//  Copyright © 2019 zmj. All rights reserved.
//

#import "ZMJProxy.h"

@implementation ZMJProxy

+ (instancetype)proxyWithTarget:(id)target
{
    ZMJProxy *proxy = [[ZMJProxy alloc] init];
    proxy.target = target;
    return proxy;
}

- (id)forwardingTargetForSelector:(SEL)aSelector
{
    return self.target;
}

@end
