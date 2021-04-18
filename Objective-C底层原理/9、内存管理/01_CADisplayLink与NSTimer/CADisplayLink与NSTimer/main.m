//
//  main.m
//  01-定时器
//
//  Created by zmj on 2019/8/19.
//  Copyright © 2019 zmj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "ZMJProxy1.h"
#import "ZMJProxy.h"
#import "ViewController.h"


int main(int argc, char * argv[]) {
    @autoreleasepool {
        
        ViewController *vc = [[ViewController alloc] init];
        
        ZMJProxy *proxy = [ZMJProxy  proxyWithTarget:vc];
        ZMJProxy1 *proxy1 = [ZMJProxy1 proxyWithTarget:vc];
        
        //判断是否是这个类或者这个类的子类的实例
        NSLog(@"%d %d",[proxy isKindOfClass:[ViewController class]],[proxy1 isKindOfClass:[ViewController class]]);
        
        
        
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}



