//
//  NSObject+Model.h
//  Runtime
//
//  Created by mc on 2018/3/27.
//  Copyright © 2018年 mingjun zhang. All rights reserved.
//

#import <Foundation/Foundation.h>

//使用runtime字典转模型
@interface NSObject (Model)

+(instancetype)modelWithDict:(NSDictionary*)dict;

@end
