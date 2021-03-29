//
//  MJPerson.m
//  Interview01-KVC
//
//  Created by MJ Lee on 2018/5/3.
//  Copyright © 2018年 MJ Lee. All rights reserved.
//

#import "MJPerson.h"

@implementation MJPerson

//- (int)getAge
//{
//    return 11;
//}

//- (int)age
//{
//    return 12;
//}

//- (int)isAge
//{
//    return 13;
//}

//- (int)_age
//{
//    return 14;
//}



//如果Key不存在，且没有KVC无法搜索到任何和Key有关的字段或者属性，则会调用这个方法，默认是抛出异常。
- (id)valueForUndefinedKey:(NSString *)key{
    return @"你好";
}

/*
 
 + (BOOL)accessInstanceVariablesDirectly;
 //默认返回YES，表示如果没有找到Set<Key>方法的话，会按照_key，_iskey，key，iskey的顺序搜索成员，设置成NO就不这样搜索

 - (BOOL)validateValue:(inout id __nullable * __nonnull)ioValue forKey:(NSString *)inKey error:(out NSError **)outError;
 //KVC提供属性值正确性验证的API，它可以用来检查set的值是否正确、为不正确的值做一个替换值或者拒绝设置新值并返回错误原因。

 - (NSMutableArray *)mutableArrayValueForKey:(NSString *)key;
 //这是集合操作的API，里面还有一系列这样的API，如果属性是一个NSMutableArray，那么可以用这个方法来返回。

 - (nullable id)valueForUndefinedKey:(NSString *)key;
 //如果Key不存在，且没有KVC无法搜索到任何和Key有关的字段或者属性，则会调用这个方法，默认是抛出异常。

 - (void)setValue:(nullable id)value forUndefinedKey:(NSString *)key;
 //和上一个方法一样，但这个方法是设值。

 - (void)setNilValueForKey:(NSString *)key;
 //如果你在SetValue方法时面给Value传nil，则会调用这个方法

 - (NSDictionary<NSString *, id> *)dictionaryWithValuesForKeys:(NSArray<NSString *> *)keys;
 //输入一组key,返回该组key对应的Value，再转成字典返回，用于将Model转到字典。
 
*/



@end
