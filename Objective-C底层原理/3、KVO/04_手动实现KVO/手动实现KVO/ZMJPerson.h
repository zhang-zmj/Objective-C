//
//  ZMJPerson.h
//  手动实现KVO
//
//  Created by mingjun zhang on 2019/4/5.
//  Copyright © 2019 mingjun zhang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZMJPerson : NSObject
{
    NSString  *_age;
}
- (void)setAge:(NSString *)age;
- (NSString *)age;

@property (nonatomic, strong) NSString  *name;



@end

NS_ASSUME_NONNULL_END



