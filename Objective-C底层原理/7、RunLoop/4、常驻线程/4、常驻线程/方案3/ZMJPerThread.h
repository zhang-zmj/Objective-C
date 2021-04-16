//
//  ZMJPerThread.h
//  4、常驻线程
//
//  Created by zmj on 2021/2/25.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^ZMJPerThreadTask)(void);

@interface ZMJPerThread : NSObject

/**
 开启线程
 */
- (void)run;

/**
 在当前子线程执行一个任务
 */
- (void)executeTask:(ZMJPerThreadTask)task;

/**
 结束线程
 */
- (void)stop;

@end

NS_ASSUME_NONNULL_END
