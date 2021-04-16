//
//  ViewController.m
//  6、线程同步方案
//
//  Created by zmj on 2019/7/16.
//  Copyright © 2019 zmj. All rights reserved.
//

#import "ViewController.h"
#import "Locks/ZMJBaseDemo.h"
#import "Locks/OSSpinLockDemo.h"
#import "Locks/OSUnfairLockDemo.h"
#import "Locks/MutexDemo.h"
#import "Locks/MutexDemo2.h"
#import "Locks/MutexDemo3.h"
#import "Locks/NSLockDemo.h"
#import "Locks/NSConditionDemo.h"
#import "Locks/NSConditionLockDemo.h"
#import "Locks/SerialQueueDemo.h"
#import "Locks/SemaphoreDemo.h"
#import "Locks/SynchronizedDemo.h"


#define SemaphoreBegin \
static dispatch_semaphore_t semaphore; \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
semaphore = dispatch_semaphore_create(1); \
}); \
dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);

#define SemaphoreEnd \
dispatch_semaphore_signal(semaphore);


@interface ViewController ()

@property (strong, nonatomic) NSThread *thread;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

/*
    ZMJBaseDemo *baseDemo = [[SynchronizedDemo alloc] init];
    [baseDemo ticketTest]; //取票
    [baseDemo moneyTest]; //取钱
//    [baseDemo otherTest];
    
 
 

    //使对象保持只有一个
    ZMJBaseDemo *baseDemo2 = [[SynchronizedDemo alloc] init];
    [baseDemo2 ticketTest]; //取票
    [baseDemo2 moneyTest]; //取钱
  */
    
        self.thread = [[NSThread alloc] initWithBlock:^{
            NSLog(@"111111");
            
            [[NSRunLoop currentRunLoop] addPort:[[NSPort alloc] init] forMode:NSDefaultRunLoopMode];
            [[NSRunLoop currentRunLoop] run];
        }];
        [self.thread start];
    
}



- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    //    [self performSelector:@selector(test) onThread:self.thread withObject:nil waitUntilDone:NO];
    
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    dispatch_async(queue, ^{
        NSLog(@"1");
        
        [self performSelector:@selector(test) withObject:nil afterDelay:.0];
        
        NSLog(@"3");
    });
    
    // 主线程几乎所有的事情都是交给了runloop去做，比如UI界面的刷新、点击时间的处理、performSelector等等
}

- (void)test
{
    NSLog(@"2");
}



- (void)test1
{
    SemaphoreBegin;
    
    // .....
    
    SemaphoreEnd;
}

- (void)test2
{
    SemaphoreBegin;
    
    // .....
    
    SemaphoreEnd;
}

- (void)test3
{
    SemaphoreBegin;
    
    // .....
    
    SemaphoreEnd;
}

@end




