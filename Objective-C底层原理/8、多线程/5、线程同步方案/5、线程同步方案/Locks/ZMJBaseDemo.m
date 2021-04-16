//
//  ZMJBaseDemo.m
//  6、线程同步方案
//
//  Created by zmj on 2019/7/16.
//  Copyright © 2019 zmj. All rights reserved.
//

#import "ZMJBaseDemo.h"

@interface ZMJBaseDemo ()

@property (assign, nonatomic) int money;
@property (assign, nonatomic) int ticketsCount;

@end


@implementation ZMJBaseDemo

- (void)otherTest {}

#pragma mark -- 存钱、取钱操作
-(void)moneyTest{
    
    self.money = 100;
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    dispatch_async(queue, ^{
        for (int i = 0; i < 10; i++) {
              [self __saveMoney];
        }
    });
    dispatch_async(queue, ^{
        for (int i = 0; i < 10; i++) {
              [self __drawMoney];
        }
    });
    
}

/**存钱*/
-(void)__saveMoney{
    
    int oleMoney = self.money;
    sleep(.2);
    oleMoney += 50;
    self.money = oleMoney;
    NSLog(@"存50，还剩%d元 - %@",oleMoney,[NSThread currentThread]);

}

/**取钱*/
-(void)__drawMoney{
    
    int oldMoney = self.money;
    sleep(.2);
    oldMoney -= 20;
    self.money = oldMoney;
    
    NSLog(@"取20，还剩%d元 -%@",oldMoney,[NSThread currentThread]);

}





#pragma mark --- 卖票演示
-(void)ticketTest{
    
    self.ticketsCount = 15;
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    dispatch_async(queue, ^{
        for (int i = 0; i < 5; i++) {
            [self __saleTicket];
        }
    });
    dispatch_async(queue, ^{
        for (int i = 0; i < 5; i++) {
            [self __saleTicket];
        }
    });
    dispatch_async(queue, ^{
        for (int i = 0; i < 5; i++) {
            [self __saleTicket];
        }
    });
    
}



-(void)__saleTicket{
    
    int oldTicketsCount = self.ticketsCount;
    sleep(.2);
    oldTicketsCount--;
    self.ticketsCount = oldTicketsCount;
    NSLog(@"还剩%d张票 - %@",oldTicketsCount,[NSThread currentThread]);
    
}

















@end








