//
//  ViewController.m
//  2、GCD的死锁
//
//  Created by zmj on 2019/7/14.
//  Copyright © 2019 zmj. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

#pragma mark -- 主线程 + 同步  会产生死锁
- (void)interview01
{
    NSLog(@"执行任务1");
    
    //队列P：任务需要排队，FIFO
    //同步要等主线程执行完成之后，再执行blockd里面的任务，相互等待，造成死锁
    dispatch_queue_t queue = dispatch_get_main_queue();
    dispatch_sync(queue, ^{
        NSLog(@"执行任务2");
    });
    NSLog(@"执行任务3");
    
}

#pragma mark -- 主线程 + 异步  不会产生死锁
- (void)interview02
{
    // 问题：以下代码是在主线程执行的，会不会产生死锁？不会！
    NSLog(@"执行任务1");
    
    dispatch_queue_t queue = dispatch_get_main_queue();
    dispatch_async(queue, ^{
        NSLog(@"执行任务2");
    });
    
    NSLog(@"执行任务3");
    
    // dispatch_async不要求立马在当前线程同步执行任务
}


#pragma mark -- 串行队列 + 异步  + 同步  会产生死锁
- (void)interview03
{
  
    NSLog(@"执行任务1");
    
    dispatch_queue_t queue = dispatch_queue_create("myqueu", DISPATCH_QUEUE_SERIAL);
    dispatch_async(queue, ^{ // 0
        NSLog(@"执行任务2");
        
        dispatch_sync(queue, ^{ // 1
            NSLog(@"执行任务3");
        });
        
        NSLog(@"执行任务4");
    });
    
    NSLog(@"执行任务5");
}


#pragma mark -- 不同队列 + 异步  + 同步  不会产生死锁
- (void)interview04
{
    // 问题：以下代码是在主线程执行的，会不会产生死锁？不会！
    NSLog(@"执行任务1");
    
    dispatch_queue_t queue = dispatch_queue_create("myqueu", DISPATCH_QUEUE_SERIAL);
        dispatch_queue_t queue2 = dispatch_queue_create("myqueu2", DISPATCH_QUEUE_CONCURRENT);
//    dispatch_queue_t queue2 = dispatch_queue_create("myqueu2", DISPATCH_QUEUE_SERIAL);
    
    dispatch_async(queue, ^{ // 0
        NSLog(@"执行任务2");
        
        dispatch_sync(queue2, ^{ // 1
            NSLog(@"执行任务3");
        });
        
        NSLog(@"执行任务4");
    });
    
    NSLog(@"执行任务5");
}


#pragma mark -- 并发队列 + 异步  + 同步  不会产生死锁
- (void)interview05
{
    // 问题：以下代码是在主线程执行的，会不会产生死锁？不会！
    NSLog(@"执行任务1");
    
    dispatch_queue_t queue = dispatch_queue_create("myqueu", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_async(queue, ^{ // 0
        NSLog(@"执行任务2");
        
        dispatch_sync(queue, ^{ // 1
            NSLog(@"执行任务3");
        });
        
        NSLog(@"执行任务4");
    });
    
    NSLog(@"执行任务5");
}






- (void)viewDidLoad {
    [super viewDidLoad];
    
#warning 使用sync函数往当前串行队列中添加任务，会卡住当前的串行队列（产生死锁）
    
//    [self interview01]; //主线程 + 同步  产生死锁
//    [self interview02]; //主线程 + 异步  不会产生死锁
//    [self interview03]; //串行队列 + 异步  + 同步  会产生死锁
//    [self interview04];  //不同队列 + 异步  + 同步  不会产生死锁
//    [self interview05]; //并发队列 + 异步  + 同步  不会产生死锁
    
    dispatch_queue_t queue1 = dispatch_get_global_queue(0, 0);
    dispatch_queue_t queue2 = dispatch_get_global_queue(0, 0);
    dispatch_queue_t queue3 = dispatch_queue_create("queu3", DISPATCH_QUEUE_CONCURRENT);
    dispatch_queue_t queue4 = dispatch_queue_create("queu4", DISPATCH_QUEUE_CONCURRENT);
    dispatch_queue_t queue5 = dispatch_queue_create("queu5", DISPATCH_QUEUE_CONCURRENT);
    
    NSLog(@"%p %p %p %p %p", queue1, queue2, queue3, queue4, queue5);
    
    
}





@end




