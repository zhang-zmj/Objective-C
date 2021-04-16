//
//  ViewController.m
//  3、队列组的使用
//
//  Created by zmj on 2019/7/14.
//  Copyright © 2019 zmj. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //创建队列组
    dispatch_group_t group = dispatch_group_create();
    //创建并发队列
    dispatch_queue_t queue = dispatch_queue_create("my_queue", DISPATCH_QUEUE_CONCURRENT);
    //添加异步任务
    dispatch_group_async(group, queue, ^{
        for (int i = 0; i < 5; i++) {
            NSLog(@"任务1-%@",[NSThread currentThread]);
        }
    });
    dispatch_group_async(group, queue, ^{
        for (int i = 0; i < 1000; i++) {
            NSLog(@"任务2-%@",[NSThread currentThread]);
        }
    });
    
    
    // 等前面的任务执行完毕后，会在当前队列中执行任务
        dispatch_group_notify(group, queue, ^{
            dispatch_async(dispatch_get_main_queue(), ^{
                for (int i = 0; i < 5; i++) {
                    NSLog(@"任务3-%@", [NSThread currentThread]);
                }
            });
        });
    
    
    //在主队列中执行任务
        dispatch_group_notify(group, dispatch_get_main_queue(), ^{
            for (int i = 0; i < 5; i++) {
                NSLog(@"任务3-%@", [NSThread currentThread]);
            }
        });

    
    
    //执行完任务后，在并发执行其他任务
    dispatch_group_notify(group, queue, ^{
        for (int i = 0; i < 5; i++) {
            NSLog(@"任务3-%@", [NSThread currentThread]);
        }
    });
    
    dispatch_group_notify(group, queue, ^{
        for (int i = 0; i < 5; i++) {
            NSLog(@"任务4-%@", [NSThread currentThread]);
        }
    });
    
    
    
}










@end








