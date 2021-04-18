//
//  ViewController.m
//  02-GCD定时器
//
//  Created by zmj on 2019/8/24.
//  Copyright © 2019 zmj. All rights reserved.
//

#import "ViewController.h"
#import "ZMJTimer.h"

@interface ViewController ()

@property (strong, nonatomic) dispatch_source_t timer;
@property (copy, nonatomic) NSString *task;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 接口设计
    self.task = [ZMJTimer execTask:self
                         selector:@selector(doTask)
                            start:2.0
                         interval:1.0
                          repeats:YES
                            async:NO];
    
    //    self.task = [ZMJTimer execTask:^{
    //        NSLog(@"111111 - %@", [NSThread currentThread]);
    //    } start:2.0 interval:-10 repeats:NO async:NO];
    
    
}


- (void)doTask
{
    NSLog(@"doTask - %@", [NSThread currentThread]);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [ZMJTimer cancelTask:self.task];
}


#pragma mark -- 创建队列
-(void)createGCDTimer{
    
    //创建队列
    //    dispatch_queue_t queue = dispatch_get_main_queue();
    dispatch_queue_t queue = dispatch_queue_create("timer", DISPATCH_QUEUE_SERIAL);
    
    /*
     创建定时器
     1、 intervalInSeconds 时间值 多少秒后开始执行
     2、 leewayInSeconds   时间间隔 多长时间开始执行
     */
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    dispatch_source_set_timer(timer, DISPATCH_TIME_NOW, 2.0 * NSEC_PER_SEC, 1.0 * NSEC_PER_SEC);
    //第一种方法：
    //    dispatch_source_set_event_handler(timer, ^{
    //        NSLog(@"111111111");
    //    });
    
    //第二种方法：
    dispatch_source_set_event_handler_f(timer, timerFire);
    dispatch_resume(timer);
    
    self.timer = timer;
    
}


void timerFire(void *param)
{
    NSLog(@"2222 - %@", [NSThread currentThread]);
}











@end








