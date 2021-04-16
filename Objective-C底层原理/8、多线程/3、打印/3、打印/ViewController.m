//
//  ViewController.m
//  03、打印
//
//  Created by zmj on 2019/7/13.
//  Copyright © 2019 zmj. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

#pragma mark -- 第一种情况：
    //第一种情况： 打印结果 1 3 2
//    NSLog(@"1");
//    [self performSelector:@selector(test) withObject:nil afterDelay:0];
//    NSLog(@"3");
    
}


-(void)test{
    NSLog(@"2");
}




//第二种情况：内部是个定时器，子线程默认没有启动Runloop， 不添加Runloop打印结果： 1，3
//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//
//    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
//    dispatch_async(queue, ^{
//        NSLog(@"1");
//        [self performSelector:@selector(test) withObject:nil afterDelay:0];
//        NSLog(@"3");
//
////        [[NSRunLoop currentRunLoop] addPort:[[NSPort alloc] init] forMode:NSDefaultRunLoopMode]; 可有可无，source 和 timer 有一即可
//     [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
//
//    });
//
//}






/*
 第一种执行顺序：
         2019-07-13 22:59:52.511290+0800 03、打印[875:24216] 1
         2019-07-13 22:59:52.511503+0800 03、打印[875:24216] 3
         2019-07-13 22:59:52.520884+0800 03、打印[875:24216] 2
    performSelector方法是在：RunLoop中添加定时器，当主线程中的任务执行完之后，唤醒runloop进行执行
 
 第二种执行顺序：
         2019-07-13 23:07:55.462122+0800 03、打印[964:29669] 1
         2019-07-13 23:07:55.462341+0800 03、打印[964:29669] 3
    test方法中的 2 未打印，主要是，子线程创建的时候，是没有默认的runloop的
 
*/



#pragma mark -- 第三种情况：
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    NSThread *thread = [[NSThread alloc] initWithBlock:^{
        NSLog(@"1");
        
//        [[NSRunLoop currentRunLoop] addPort:[[NSPort alloc] init] forMode:NSDefaultRunLoopMode];
//        [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
        
    }];
    [thread start];
    
    //waitUntilDone：这个是YES的时候，等待线程执行完成之后，在执行函数中的方法，会因为线程的释放而崩溃，为NO时，就是并发执行,无崩溃
    [self performSelector:@selector(test) onThread:thread withObject:nil waitUntilDone:YES];
    
    
    
    
}








@end






