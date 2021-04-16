//
//  ViewController.m
//  1、GCD
//
//  Created by zmj on 2019/7/14.
//  Copyright © 2019 zmj. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController


#pragma mark 同步异步的区别：dispatch_sync和dispatch_async用来控制是否要开启新的线程
-(void)interview01{
    
    dispatch_queue_t queue = dispatch_queue_create(0, 0);
    
    NSLog(@"%@",[NSThread currentThread]); //主线程
    
    //同步：在当前线程中执行任务，不具备开启新线程的能力
    dispatch_sync(queue, ^{
        NSLog(@"执行任务1 ---%@",[NSThread currentThread]);
    });
    
    //异步：在新的线程中执行任务，具备开启新线程的能力
    dispatch_async(queue, ^{
        NSLog(@"执行任务2 ---%@",[NSThread currentThread]);
    });
    
}


#pragma mark GCD的队列：并发 和 串行
-(void)interview02{
    
//队列的创建
    /*
         第一个参数const char *label : C语言字符串，用来标识
         第二个参数dispatch_queue_attr_t attr : 队列的类型
         第一个参数const char *label : C语言字符串，用来标识
         并发队列:DISPATCH_QUEUE_CONCURRENT  串行队列:DISPATCH_QUEUE_SERIAL 或者 NULL
         dispatch_queue_t queue = dispatch_queue_create(const char *label, dispatch_queue_attr_t attr);
     */
    //创建并发队列
//      dispatch_queue_t queue = dispatch_queue_create("com.xxcc", DISPATCH_QUEUE_CONCURRENT);
    //创建串行队列
//      dispatch_queue_t queue = dispatch_queue_create("com.xxcc", DISPATCH_QUEUE_SERIAL);
    

    /**
     第一个参数:优先级 也可直接填后面的数字
     #define DISPATCH_QUEUE_PRIORITY_HIGH 2 // 高
     #define DISPATCH_QUEUE_PRIORITY_DEFAULT 0 // 默认
     #define DISPATCH_QUEUE_PRIORITY_LOW (-2) // 低
     #define DISPATCH_QUEUE_PRIORITY_BACKGROUND INT16_MIN // 后台
     第二个参数: 预留参数  0
     */
//    dispatch_queue_t quque =  dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    //获取主队列
//     dispatch_queue_t  queue = dispatch_get_main_queue();
    
//    dispatch_queue_t queue = dispatch_queue_create("myqueue", DISPATCH_QUEUE_SERIAL);
     dispatch_queue_t queue = dispatch_queue_create("myqueue", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(queue, ^{
        for (int i = 0; i < 10; i++) {
             NSLog(@"执行任务1 ---%@",[NSThread currentThread]);
        }
    });
    
    dispatch_async(queue, ^{
        for (int i = 0; i < 10; i++) {
            NSLog(@"执行任务2 ---%@",[NSThread currentThread]);
        }
        
    });
    

    /*
        
        dispatch_queue_t queue = dispatch_get_main_queue();
        dispatch_async(queue, ^{
                NSLog(@"执行任务 ---%@",[NSThread currentThread]);
        });
        
    */
    
    
    
}



- (void)viewDidLoad {
    [super viewDidLoad];
//    [self interview01];
    [self interview02];
    
}








@end

