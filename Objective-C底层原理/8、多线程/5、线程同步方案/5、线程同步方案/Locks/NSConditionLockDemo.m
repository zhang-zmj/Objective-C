
//
//  NSConditionLockDemo.m
//  6、线程同步方案
//
//  Created by zmj on 2019/7/21.
//  Copyright © 2019 zmj. All rights reserved.
//

#import "NSConditionLockDemo.h"

@interface NSConditionLockDemo()

@property (strong, nonatomic) NSConditionLock *conditionLock;

@end

@implementation NSConditionLockDemo

- (instancetype)init
{
    if (self = [super init]) {
//        self.conditionLock = [[NSConditionLock alloc] init];
        self.conditionLock = [[NSConditionLock alloc] initWithCondition:1];
    }
    return self;
}

- (void)otherTest
{
    [[[NSThread alloc] initWithTarget:self selector:@selector(__one) object:nil] start];
    
    [[[NSThread alloc] initWithTarget:self selector:@selector(__two) object:nil] start];
    
    [[[NSThread alloc] initWithTarget:self selector:@selector(__three) object:nil] start];
}

- (void)__one
{
//    [self.conditionLock lock];
    [self.conditionLock lockWhenCondition:1];
    
    NSLog(@"__one");
    [self.conditionLock unlockWithCondition:2];
}

- (void)__two
{
    [self.conditionLock lockWhenCondition:2];
     sleep(2);
    NSLog(@"__two");
    
    [self.conditionLock unlockWithCondition:3];
}

- (void)__three
{
    [self.conditionLock lockWhenCondition:3];
     sleep(4);
    NSLog(@"__three");
    
    [self.conditionLock unlock];
}


@end




