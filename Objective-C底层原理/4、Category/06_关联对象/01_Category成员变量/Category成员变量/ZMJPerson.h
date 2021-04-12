//
//  ZMJPerson.h
//  Category成员变量
//
//  Created by mingjun zhang on 2019/4/20.
//  Copyright © 2019 mingjun zhang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZMJPerson : NSObject
//{
//    int _age;
//}


//-(void)setAge:(int)age;
//-(int)age;

/*
 1、生成带下划线的成员变量
 2、setter方法的声明与实现
 3、getter方法的声明与实现
 */
@property (nonatomic, assign) int age;




@end

NS_ASSUME_NONNULL_END



