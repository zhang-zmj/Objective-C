
//
//  NSObject+Category.m
//  Runtime
//
//  Created by mc on 2018/3/26.
//  Copyright © 2018年 mingjun zhang. All rights reserved.
//

#import "NSObject+Category.h"

static const int  psoccer;
@implementation NSObject (Category)

- (void)setName:(NSString *)name{
    
    /* 让这个字符串和当前对象产生联系
     object:给哪个对象添加属性
     key:属性名称
     value:属性值
     policy:保存策略
     */
    objc_setAssociatedObject(self, @"name", name, OBJC_ASSOCIATION_COPY_NONATOMIC);
    
}

- (NSString *)name{
    return objc_getAssociatedObject(self, @"name");
}


-(void)setSoccer:(int)soccer{
    NSString * a = [NSString stringWithFormat:@"%d",soccer];
    objc_setAssociatedObject(self , &psoccer, a , OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (int )soccer{
    return [objc_getAssociatedObject(self , &psoccer) intValue];
}


/*
 OBJC_ASSOCIATION_ASSIGN 等价于 @property(assign)。
 OBJC_ASSOCIATION_RETAIN_NONATOMIC等价于 @property(strong, nonatomic)。
 OBJC_ASSOCIATION_COPY_NONATOMIC等价于@property(copy, nonatomic)。
 OBJC_ASSOCIATION_RETAIN等价于@property(strong,atomic)。
 OBJC_ASSOCIATION_COPY等价于@property(copy, atomic)。
 */







@end
