//
//  main.m
//  2、RunLoop相关类
//
//  Created by zmj on 2019/7/4.
//  Copyright © 2019 zmj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char * argv[]) {
    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}

/*
 做了三件事：
    1、创建一个自动释放池
    2、调用UIApplicationMain函数
    3、释放自动释放池
 */


