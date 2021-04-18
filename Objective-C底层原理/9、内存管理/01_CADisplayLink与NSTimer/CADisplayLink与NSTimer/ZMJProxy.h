//
//  ZMJProxy.h
//  01-定时器
//
//  Created by zmj on 2019/8/20.
//  Copyright © 2019 zmj. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZMJProxy : NSObject

+(instancetype)proxyWithTarget:(id)target;
@property (weak,nonatomic) id target;

@end

NS_ASSUME_NONNULL_END






