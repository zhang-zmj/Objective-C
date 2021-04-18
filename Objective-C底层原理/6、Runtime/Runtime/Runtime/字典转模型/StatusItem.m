//
//  StatusItem.m
//  Runtime
//
//  Created by mc on 2018/3/27.
//  Copyright © 2018年 mingjun zhang. All rights reserved.
//

#import "StatusItem.h"

@implementation StatusItem

+ (instancetype)itemWithDict:(NSDictionary *)dict{

    StatusItem *item = [[self alloc] init];
    //KVC：把字典中所有值给模型的属性赋值
    [item setValuesForKeysWithDictionary:dict];
    
    //KVC原理：1、遍历字典中所有key, 去模型中查找有没有对应的属性
    [dict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        //2、去模型中查找有没有对应属性 KVC
        [item setValue:obj forKey:key];
    }];
    return item;
}



/*
   重写系统方法? 1.想给系统方法添加额外功能 2.不想要系统方法实现
   防止系统找不到就会调用这个方法,报错
 */
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}



@end

