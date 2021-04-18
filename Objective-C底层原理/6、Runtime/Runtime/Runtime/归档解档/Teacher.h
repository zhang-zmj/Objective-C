//
//  Teacher.h
//  Runtime
//
//  Created by mingjun zhang on 2018/3/26.
//  Copyright © 2018年 mingjun zhang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

//1、文件 2、plist 3、SQlite 4、CoreData 5、NSCoding
@interface Teacher : NSObject<NSCoding>

@property (nonatomic, copy) NSString * name;
@property (nonatomic, copy) NSString * sex;
@property (nonatomic, copy) NSString * numPhone;
@property (nonatomic, assign) NSInteger age;
@property (nonatomic, assign)CGFloat height;
@property (nonatomic, assign)CGFloat weight;
@property (nonatomic, copy) NSString * hobby;
@property (nonatomic, copy) NSString * address;

- (instancetype)initWithName:(NSString*)name sex:(NSString*)sex numPhone:(NSString*)numPhone age:(NSInteger)age height:(CGFloat)height weight:(CGFloat)weight hobby:(NSString*)hobby address:(NSString*)address;

@end
