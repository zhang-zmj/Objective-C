//
//  NSObject+Category.h
//  Runtime
//
//  Created by mc on 2018/3/26.
//  Copyright © 2018年 mingjun zhang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Category)

// @property分类:只会生成get,set方法声明,不会生成实现,也不会生成下划线成员属性
@property (nonatomic, strong) NSString *name;

@property (nonatomic,assign) int  soccer;

@end
