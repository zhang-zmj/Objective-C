//
//  ZMJPerson.h
//  Block本质
//
//  Created by mingjun zhang on 2019/4/20.
//  Copyright © 2019 mingjun zhang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZMJPerson : NSObject

-(void)test;

@property (nonatomic, copy)  NSString *name;

-(instancetype)initWithName:(NSString*)name;



@end

NS_ASSUME_NONNULL_END
