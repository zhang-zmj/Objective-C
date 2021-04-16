
//
//  SerialQueueDemo.m
//  6、线程同步方案
//
//  Created by zmj on 2019/7/21.
//  Copyright © 2019 zmj. All rights reserved.
//

#import "SerialQueueDemo.h"

#pragma mark -- 不同线程调用同一个资源,造成资源被抢夺

@interface SerialQueueDemo()

@property (strong, nonatomic) dispatch_queue_t ticketQueue;
@property (strong, nonatomic) dispatch_queue_t moneyQueue;

@end

@implementation SerialQueueDemo

- (instancetype)init
{
    if (self = [super init]) {
        self.ticketQueue = dispatch_queue_create("ticketQueue", DISPATCH_QUEUE_SERIAL);
        self.moneyQueue = dispatch_queue_create("moneyQueue", DISPATCH_QUEUE_SERIAL);
    }
    return self;
}

- (void)__drawMoney
{
    dispatch_sync(self.moneyQueue, ^{
        [super __drawMoney];
    });
}

- (void)__saveMoney
{
    dispatch_sync(self.moneyQueue, ^{
        [super __saveMoney];
    });
}

- (void)__saleTicket
{
    dispatch_sync(self.ticketQueue, ^{
        [super __saleTicket];
    });
}



@end




