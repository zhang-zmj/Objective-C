
//
//  ZMJPerson+Attribute.m
//  Category关联对象底层
//
//  Created by mingjun zhang on 2019/4/20.
//  Copyright © 2019 mingjun zhang. All rights reserved.
//

#import "ZMJPerson+Attribute.h"
#import <objc/runtime.h>

@implementation ZMJPerson (Attribute)



- (void)setName:(NSString *)name{
    objc_setAssociatedObject(self, @selector(name), name, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

-(NSString*)name{
    // 隐式参数
    // _cmd == @selector(name)
    return objc_getAssociatedObject(self, @selector(name));
    return objc_getAssociatedObject(self, @selector(name));
}



@end


