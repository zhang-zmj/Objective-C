//
//  zMJPermenantThread.m
//  4、常驻线程
//
//  Created by zmj on 2021/2/25.
//

#import "ZMJPermenantThread.h"


/** ZMJThread **/
@interface ZMJThread : NSThread
@end
@implementation ZMJThread
- (void)dealloc
{
    NSLog(@"%s", __func__);
}
@end



@interface ZMJPermenantThread()

@property (strong, nonatomic) ZMJThread *innerThread;
@property (assign, nonatomic, getter=isStopped) BOOL stopped;

@end

@implementation ZMJPermenantThread


/*
 1、保证控制器里面的属性全部释放
 2、保证控制器里面的的属性都释放了，控制器再释放
 3、保证runLoop也能释放，
- (BOOL)runMode:(NSRunLoopMode)mode beforeDate:(NSDate *)limitDate; 运行循环一次
 
 */


#pragma mark - public methods
- (instancetype)init
{
    if (self = [super init]) {
        
        self.stopped = NO;
        __weak typeof(self) weakSelf = self;
        
        self.innerThread = [[ZMJThread alloc] initWithBlock:^{
            
            //往RunLoop里面添加Source\Timer\Observer
            [[NSRunLoop currentRunLoop] addPort:[[NSPort alloc] init] forMode:NSDefaultRunLoopMode];
            
            while (weakSelf && !weakSelf.isStopped) {
                //运行循环一次，阻塞在指定模式下的输入，直到给定的日期到达
                [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
            }
            
            // NSRunLoop的run方法是无法停止的，它专门用于开启一个永不销毁的线程（NSRunLoop）
            //        [[NSRunLoop currentRunLoop] run];
            /*
             it runs the receiver in the NSDefaultRunLoopMode by repeatedly invoking runMode:beforeDate:.
             In other words, this method effectively begins an infinite loop that processes data from the run loop’s input sources and timers
             */
            
        }];
        
        [self.innerThread start];
    }
    return self;
}

- (void)run
{
    if (!self.innerThread) return;

    [self.innerThread start];
}

- (void)executeTask:(ZMJPermenantThreadTask)task
{
    if (!self.innerThread || !task) return;
    
    [self performSelector:@selector(__executeTask:) onThread:self.innerThread withObject:task waitUntilDone:NO];
}

- (void)stop
{
    if (!self.innerThread) return;
    
    [self performSelector:@selector(__stop) onThread:self.innerThread withObject:nil waitUntilDone:YES];
}

- (void)dealloc
{
    NSLog(@"%s", __func__);
    
    [self stop];
}

#pragma mark - private methods
- (void)__stop
{
    self.stopped = YES;
    CFRunLoopStop(CFRunLoopGetCurrent());
    self.innerThread = nil;
}

- (void)__executeTask:(ZMJPermenantThreadTask)task
{
    task();
}



@end



