//
//  Dispatch_barrier_async.m
//  9、读写安全方案
//
//  Created by zmj on 2019/7/22.
//  Copyright © 2019 zmj. All rights reserved.
//

#import "Dispatch_barrier_async.h"


@interface Dispatch_barrier_async ()

@property (strong, nonatomic) dispatch_queue_t queue;

@end

@implementation Dispatch_barrier_async

- (instancetype)init{
    if (self = [super init]) {
        
        [self createFunction];
        
    }
    return self;
}

-(void)createFunction{
    
    self.queue = dispatch_queue_create("rw_queue", DISPATCH_QUEUE_CONCURRENT);
    for (int i = 0; i<10; i++) {
        dispatch_async(self.queue, ^{
            [self read];
        });
        dispatch_async(self.queue, ^{
            [self write];
        });
    }
    
}


// 读文件
-(void)read{
    
    dispatch_async(self.queue, ^{
        
        sleep(1.0);
        NSLog(@"--读--");
    });
    
    
}

// 写文件
-(void)write{
    
    dispatch_barrier_async(self.queue, ^{
        
        sleep(1.0);
        
        NSLog(@"--写--");
        
    });
}

-(void)code{
    
    // 初始化自己定义的并发l队列
    dispatch_queue_t queue = dispatch_queue_create("rw_queue", DISPATCH_QUEUE_CONCURRENT);
    // 读
    dispatch_async(queue, ^{
        
    });
    // 写
    dispatch_barrier_async(queue, ^{
        
    });
    
}





@end
