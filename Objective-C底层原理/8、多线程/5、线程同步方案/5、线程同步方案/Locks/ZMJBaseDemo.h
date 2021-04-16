//
//  ZMJBaseDemo.h
//  6、线程同步方案
//
//  Created by zmj on 2019/7/16.
//  Copyright © 2019 zmj. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZMJBaseDemo : NSObject

- (void)moneyTest;
- (void)ticketTest;
- (void)otherTest;

#pragma mark - 暴露给子类去使用
- (void)__saveMoney;
- (void)__drawMoney;
- (void)__saleTicket;

@end

NS_ASSUME_NONNULL_END



