//
//  Pthread_rwlock.m
//  9、读写安全方案
//
//  Created by zmj on 2019/7/22.
//  Copyright © 2019 zmj. All rights reserved.
//

#import "Pthread_rwlock.h"
#import <pthread.h>

@interface Pthread_rwlock ()

@property (assign, nonatomic) pthread_rwlock_t lock;

@end


@implementation Pthread_rwlock


- (instancetype)init{
    if (self = [super init]) {
        
        [self createFunction];
        
    }
    return self;
}

-(void)createFunction{
    
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    pthread_rwlock_init(&_lock, NULL);
    
    for (int i = 0; i<10; i++) {
        
        dispatch_async(queue, ^{
            
            [self read];
        });
        
        dispatch_async(queue, ^{
            
            [self write];
        });
        
    }
    
}


// 读文件
-(void)read{
    
    // 读可以多条线程进行
    pthread_rwlock_rdlock(&_lock);
    
    sleep(1.0);
    
    NSLog(@"--读--");
    
    pthread_rwlock_unlock(&_lock);
    
}

// 写文件
-(void)write{
    
    // 在写的时候没有读的操作 且 写只能有一条线程进行
    pthread_rwlock_wrlock(&_lock);
    
    sleep(1.0);
    
    NSLog(@"--写--");
    
    pthread_rwlock_unlock(&_lock);
    
}

-(void)dd{
    
    // 初始化锁
    pthread_rwlock_t lock;
    pthread_rwlock_init(&lock, NULL);
    // 读—加锁
    pthread_rwlock_rdlock(&lock);
    // 读-尝试加锁
    pthread_rwlock_tryrdlock(&lock);
    // 写加锁
    pthread_rwlock_wrlock(&lock);
    // 写-尝试加锁
    pthread_rwlock_trywrlock(&lock);
    // 解锁
    pthread_rwlock_unlock(&lock);
    // 销毁锁
    pthread_rwlock_destroy(&lock);
    
}



@end




