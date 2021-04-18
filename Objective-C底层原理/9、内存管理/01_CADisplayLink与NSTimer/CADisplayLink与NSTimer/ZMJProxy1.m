
//
//  ZMJProxy1.m
//  01-定时器
//
//  Created by zmj on 2019/8/20.
//  Copyright © 2019 zmj. All rights reserved.
//

#import "ZMJProxy1.h"

@implementation ZMJProxy1

+ (instancetype)proxyWithTarget:(id)target
{
    // NSProxy对象不需要调用init，因为它本来就没有init方法
    ZMJProxy1 *proxy = [ZMJProxy1 alloc];
    proxy.target = target;
    return proxy;
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel
{
    return [self.target methodSignatureForSelector:sel];
}

- (void)forwardInvocation:(NSInvocation *)invocation
{
    [invocation invokeWithTarget:self.target];
}


@end
