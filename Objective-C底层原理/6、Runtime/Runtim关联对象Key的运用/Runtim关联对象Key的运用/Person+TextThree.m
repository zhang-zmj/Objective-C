//
//  Person+TextThree.m
//  Runtim关联对象Key的运用
//
//  Created by mingjun zhang on 2018/7/7.
//  Copyright © 2018年 mingjun zhang. All rights reserved.
//

#import "Person+TextThree.h"
#import <objc/runtime.h>

#define ZMJRevelKey @"revel"

@implementation Person (TextThree)



-(void)setRevel:(int)revel{
    
    /**
     使用属性名作为key ： @"revel" 的内存地址是一直定值
     */
    objc_setAssociatedObject(self, ZMJRevelKey, @(revel), OBJC_ASSOCIATION_ASSIGN);
}

-(int)revel{
    
    return  [objc_getAssociatedObject(self, ZMJRevelKey) intValue];
}





@end


