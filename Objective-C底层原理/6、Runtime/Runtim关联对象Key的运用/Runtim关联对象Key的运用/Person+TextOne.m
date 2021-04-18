//
//  Person+TextOne.m
//  Runtim关联对象Key的运用
//
//  Created by mingjun zhang on 2018/7/7.
//  Copyright © 2018年 mingjun zhang. All rights reserved.
//

#import "Person+TextOne.h"
#import <objc/runtime.h>

const void *ZMJNameKey = &ZMJNameKey;
const void *ZMJHeightKey= &ZMJHeightKey;
@implementation Person (TextOne)


- (void)setName:(NSString *)name{
    
    objc_setAssociatedObject(self, ZMJNameKey, name, OBJC_ASSOCIATION_COPY_NONATOMIC);
    
}

- (NSString *)name{
    
    return objc_getAssociatedObject(self, ZMJNameKey);
    
}



- (void)setHeight:(int)height{
    
    objc_setAssociatedObject(self, ZMJHeightKey, @(height), OBJC_ASSOCIATION_COPY_NONATOMIC);
    
}


- (int)height{
    
    return [objc_getAssociatedObject(self, ZMJHeightKey) intValue];
    
}










@end






































