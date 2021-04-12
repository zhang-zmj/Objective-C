//
//  ZMJPerson+Attribute.h
//  Category成员变量
//
//  Created by mingjun zhang on 2019/4/20.
//  Copyright © 2019 mingjun zhang. All rights reserved.
//

#import "ZMJPerson.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZMJPerson (Attribute)


//weight属性
@property (nonatomic, assign) int weight;
-(void)setWeight:(int)weight;
-(int)weight;


//name属性
@property (nonatomic, strong) NSString *name;
-(void)setName:(NSString *)name;
-(NSString*)name;


@end

NS_ASSUME_NONNULL_END
