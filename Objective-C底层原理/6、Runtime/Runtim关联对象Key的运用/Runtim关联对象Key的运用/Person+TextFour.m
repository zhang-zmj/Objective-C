//
//  Person+TextFour.m
//  Runtim关联对象Key的运用
//
//  Created by mingjun zhang on 2018/7/7.
//  Copyright © 2018年 mingjun zhang. All rights reserved.
//

#import "Person+TextFour.h"
#import <objc/runtime.h>


@implementation Person (TextFour)


-(void)setDegree:(NSString *)degree{
    
    objc_setAssociatedObject(self, @selector(degree), degree, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

/**
 _cmd在这里等于 @selector(degree)： 只能在下面的方法里面使用
 */
-(NSString *)degree{
    
    return objc_getAssociatedObject(self, _cmd);
}


@end


