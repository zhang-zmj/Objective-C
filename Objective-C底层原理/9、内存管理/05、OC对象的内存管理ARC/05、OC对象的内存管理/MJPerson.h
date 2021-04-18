//
//  MJPerson.h
//  Interview01-内存管理
//
//  Created by MJ Lee on 2018/6/27.
//  Copyright © 2018年 MJ Lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MJDog.h"
#import "MJCar.h"

@interface MJPerson : NSObject

@property (nonatomic, assign) int age;
@property (nonatomic, retain) MJDog *dog;
@property (nonatomic, retain) MJCar *car;

+ (instancetype)person;

@end




