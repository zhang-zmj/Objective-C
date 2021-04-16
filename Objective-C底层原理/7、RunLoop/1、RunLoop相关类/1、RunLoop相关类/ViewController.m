//
//  ViewController.m
//  2、RunLoop相关类
//
//  Created by zmj on 2019/7/4.
//  Copyright © 2019 zmj. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

//获取RunLoop对象
-(void)getRunLoopWithObject{
    
    NSRunLoop *runloop = [NSRunLoop currentRunLoop];
    CFRunLoopRef runloop2 = CFRunLoopGetCurrent();
    
    NSLog(@"%p %p", [NSRunLoop currentRunLoop], [NSRunLoop mainRunLoop]);
    NSLog(@"%p %p", CFRunLoopGetCurrent(), CFRunLoopGetMain());
    
    //NSRunLoop 包含CFRunLoopGetCurrent 对象的地址
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    //获取RunLoop对象
    [self getRunLoopWithObject];
    
    
    
    
}






@end




