//
//  NSObject+Model.m
//  Runtime
//
//  Created by mc on 2018/3/27.
//  Copyright © 2018年 mingjun zhang. All rights reserved.
//

#import "NSObject+Model.h"

/*
 int a = 2;
 int b = 3;
 int c = 4;
 int arr[] = {a,b,c};
 int *p = arr;
 p[0];
 NSLog(@"%d %d",p[0],p[1]);
 */

/*
 获取类里面所有方法 ---  本质:创建谁的对象
  class_copyMethodList(<#__unsafe_unretained Class cls#>, <#unsigned int *outCount#>)
 获取类里面属性
  class_copyPropertyList(<#__unsafe_unretained Class cls#>, <#unsigned int *outCount#>)
*/

/*
 Ivar:成员变量 以下划线开头
 Property:属性
*/


@implementation NSObject (Model)

#pragma runtime:根据模型中属性,去字典中取出对应的value给模型属性赋值
+ (instancetype)modelWithDict:(NSDictionary *)dict{
    
    id objc = [[self alloc] init];
    //count：成员变量个数
    unsigned int count = 0;
    //获取成员变量数组
    Ivar *ivarList = class_copyIvarList(self, &count);
    //遍历所有成员变量
    for (int i = 0; i < count; i++) {
        //获取成员变量
        Ivar ivar = ivarList[i];
        //获取成员变量名字
        NSString *ivarName = [NSString stringWithUTF8String:ivar_getName(ivar)];
        //获取成员变量类型
        NSString *ivarType = [NSString stringWithUTF8String:ivar_getTypeEncoding(ivar)];
        //@\"User\" -> User
        ivarType = [ivarType stringByReplacingOccurrencesOfString:@"\"" withString:@""];
        ivarType = [ivarType stringByReplacingOccurrencesOfString:@"@" withString:@""];
        //获取key
        NSString *key = [ivarName substringFromIndex:1];
        id value = dict[key];
        
        //二级转换：判断value是否是字典，如果是，字典转换成对应的模型
        if ([value isKindOfClass:[NSDictionary class]] && (![ivarType hasPrefix:@"NS"])) {
            //字典转模型  userDict => User模型
            Class modelClass = NSClassFromString(ivarType);
            value = [modelClass modelWithDict:value];
        }
        //给模型中属性赋值
        if (value) {
            [objc setValue:value forKey:key];
        }
    }
    return objc;
}



@end

