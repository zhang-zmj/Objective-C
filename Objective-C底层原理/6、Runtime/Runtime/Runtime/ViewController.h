//
//  ViewController.h
//  Runtime
//
//  Created by mingjun zhang on 2018/3/25.
//  Copyright © 2018年 mingjun zhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController


/*
 
 导入runtime：
    1、查找build setting -> 搜索msg  设置为NO
 
 类方法本质：类对象调用[NSObject class]
 id：谁发送消息
 SEL：发送什么消息
 ((NSObject *(*)(id, SEL))(void *)objc_msgSend)([NSObject class], @selector(alloc));
 */


@end

