//
//  ZMJPerson.h
//  01_KVC基础
//
//  Created by zmj on 2021/3/29.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZMJCat : NSObject
@property (assign, nonatomic) int weight;
@end


@interface ZMJPerson : NSObject

@property (assign, nonatomic) int age;
@property (strong, nonatomic) ZMJCat *cat;

@end

NS_ASSUME_NONNULL_END
