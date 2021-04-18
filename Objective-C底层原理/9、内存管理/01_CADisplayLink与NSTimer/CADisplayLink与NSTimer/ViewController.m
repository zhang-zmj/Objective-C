//
//  ViewController.m
//  01-定时器
//
//  Created by zmj on 2019/8/19.
//  Copyright © 2019 zmj. All rights reserved.
//

#import "ViewController.h"
#import "ZMJProxy.h"
#import "ZMJProxy1.h"

@interface ViewController ()

@property (strong, nonatomic) NSTimer *timer;
@property (strong, nonatomic) CADisplayLink *link;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    
    //1、timer的循环引用
    __weak typeof(self) weakSelf = self;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:2.0 repeats:YES block:^(NSTimer * _Nonnull timer) {
        [weakSelf timerTest];
    }];
    

    //2、timer的循环引用
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:[ZMJProxy1 proxyWithTarget:self] selector:@selector(timerTest) userInfo:nil repeats:YES];
    
    
    //3、CADisplayLink、NSTimer产生强引用和内部原理相关相关
//    self.link = [CADisplayLink displayLinkWithTarget:self selector:@selector(timerTest)];
//    [self.link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
    

    
    
    
    
}



- (void)timerTest
{
    NSLog(@"%s", __func__);
}



- (void)dealloc
{
    NSLog(@"%s", __func__);
    [self.timer invalidate];
}


@end







