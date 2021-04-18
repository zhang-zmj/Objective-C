
//
//  NoPerson.m
//  Runtime
//
//  Created by mingjun zhang on 2018/3/25.
//  Copyright © 2018年 mingjun zhang. All rights reserved.
//

#import "NoPerson.h"
#import "Sport.h"


/*
 快速消息转发
 - (id)forwardingTargetForSelector:(SEL)aSelector
 若果当前target实现了forwardingTargetForSelector:方法,则调用此方法。如果此方法返回除nil和self的其他对象，则向返回对象重新发送消息。
 
 标准消息转发
 - (void)forwardInvocation:(NSInvocation *)anInvocation  可以将消息同时转发给任意多个对象
 - (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector
 获得一个方法签名。如果获取不到，则直接调用doesNotRecognizeSelector抛出异常。如果能获取，则返回非nil：创建一个 NSlnvocation 并传给forwardInvocation:执行
 
 动态方法解析
 + (BOOL)resolveClassMethod:(SEL)sel  调用了没有实现的类方法时调用
 + (BOOL)resolveInstanceMethod:(SEL)sel 调用了未实现的实例方法时调用
 */

@implementation NoPerson

#pragma 快速消息转发，消息转发重定向
- (id)forwardingTargetForSelector:(SEL)aSelector {

    Sport *sport = [[Sport alloc] init];
    // 判断想要转发到的这个对象是否响应这个方法 - 可以在Sport 注释打开run方法
    if ([sport respondsToSelector:@selector(run)]) {
        // 如果代理对象能处理，则转接给代理对象
        return sport;
    }else {
        //不能处理进入转发流程(不能进行重定向)
        return [super forwardingTargetForSelector:aSelector];
    }

}

#pragma 不能进行重定向后  生成一个方法签名
- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {

    NSString *selStr = NSStringFromSelector(aSelector);
    // 判断转发是手动生成方法签名
    if ([selStr isEqualToString:@"run"]) {
        return [NSMethodSignature signatureWithObjCTypes:"v@:"];
        // v（void） 返回值    @（self）   ：（sel方法）
    }
    return [super methodSignatureForSelector:aSelector];
    /*
     如果 methodSignatureForSelector 返回是 nil 的话不会继续执行 返回是 self 会造成死循环
     */
}


#pragma 拿到方法签名，配发消息
- (void)forwardInvocation:(NSInvocation *)anInvocation {
    // 拿到方法消息
    SEL selector = [anInvocation selector];
    // 看一下目标对象是否响应方法
    Sport *sport = [[Sport alloc] init];
    if ([sport respondsToSelector:selector]) {
        NSLog(@"年后年后安");
        [anInvocation invokeWithTarget:sport];
    }else {
        [super forwardInvocation:anInvocation];
    }
}

#pragma 处理错误消息
- (void)doesNotRecognizeSelector:(SEL)aSelector {
    NSLog(@"未曾实现的方法----%@",NSStringFromSelector(aSelector));
}


@end
