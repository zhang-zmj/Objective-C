//
//  ZMJPerson.h
//  7、atomic和nonatomic
//
//  Created by zmj on 2019/7/22.
//  Copyright © 2019 zmj. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZMJPerson : NSObject

@property (nonatomic,assign) int age;
@property (atomic,copy) NSString *name;
@property (atomic,strong) NSMutableArray *dataArray;
/*
 atomic用于保证属性setter、getter的原子性操作，相当于在getter和setter内部加了线程同步的锁
 它并不能保证使用属性的过程是线程安全的
 不用的原因：消耗性能
 */

@end

NS_ASSUME_NONNULL_END
