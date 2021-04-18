//
//  UIButton+Swizze.h
//  Runtime的案例应用
//
//  Created by mc on 2018/3/27.
//  Copyright © 2018年 mc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Swizze)

//是否收集点击信息
@property (nonatomic,assign) BOOL collectionTarget;

//设置点击间隔时间
@property (nonatomic,assign) NSTimeInterval acceptInterval;

@end
