//
//  ZMJPerson.h
//  category分类基本
//
//  Created by mingjun zhang on 2019/4/13.
//  Copyright © 2019 mingjun zhang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZMJPerson : NSObject

-(void)run;

+(void)run;

- (void)printMethodNamesOfClass:(Class)cls;

@end

NS_ASSUME_NONNULL_END
