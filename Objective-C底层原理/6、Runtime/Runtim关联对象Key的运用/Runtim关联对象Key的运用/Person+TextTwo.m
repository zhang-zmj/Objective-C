//
//  Person+TextTwo.m
//  Runtim关联对象Key的运用
//
//  Created by mingjun zhang on 2018/7/7.
//  Copyright © 2018年 mingjun zhang. All rights reserved.
//

#import "Person+TextTwo.h"
#import <objc/runtime.h>

@implementation Person (TextTwo)

// static ： 代表只能在此文件内访问 static char ZMJWeightKey;  内存地址
static char ZMJWeightKey;

-(void)setWeight:(int)weight{
    
    objc_setAssociatedObject(self, &ZMJWeightKey, @(weight), OBJC_ASSOCIATION_ASSIGN);
}

-(int)weight{
    
    return [objc_getAssociatedObject(self, &ZMJWeightKey) intValue];
}


@end




