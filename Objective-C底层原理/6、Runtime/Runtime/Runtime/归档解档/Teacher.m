//
//  Teacher.m
//  Runtime
//
//  Created by mingjun zhang on 2018/3/26.
//  Copyright © 2018年 mingjun zhang. All rights reserved.
//

#import "Teacher.h"

@implementation Teacher

//编码
- (void)encodeWithCoder:(NSCoder *)aCoder{
    
    unsigned int count = 0;
    Ivar *ivars = class_copyIvarList([self class], &count);
    for (int i = 0; i < count; i++) {
        Ivar ivar = ivars[i];
        const char *name = ivar_getName(ivar);
        NSString *nameStr = [NSString stringWithCString:name encoding:NSUTF8StringEncoding];
        id value = [self valueForKey:nameStr];
        [aCoder encodeObject:value forKey:nameStr];
    }
    free(ivars);
    
}

//解码
- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    
    if (self = [super init]) {
        unsigned int count = 0;
        Ivar *ivars = class_copyIvarList([self class], &count);
        for (int i = 0; i < count; i++) {
            Ivar ivar = ivars[i];
            const char *name = ivar_getName(ivar);
            NSString *key = [NSString stringWithCString:name encoding:NSUTF8StringEncoding];
            id value = [aDecoder decodeObjectForKey:key];
            [self setValue:value forKey:key];
        }
        free(ivars);
    }
    return self;
    
}

- (instancetype)initWithName:(NSString *)name sex:(NSString *)sex numPhone:(NSString *)numPhone age:(NSInteger)age height:(CGFloat)height weight:(CGFloat)weight hobby:(NSString *)hobby address:(NSString *)address{
    if (self = [super init]) {
        _name = name;
        _sex= sex ;
        _numPhone = numPhone;
       _age = age;
       _height = height;
       _weight = weight;
       _hobby = hobby;
       _address = address;
    }
    return self;
}

- (NSString *)description{
    return [NSString stringWithFormat:@"age: %ld name: %@ numPhone: %@ sex: %@ hobby: %@ address: %@ weight: %lf height: %lf",self.age,self.name,self.numPhone,self.sex,self.hobby,self.address,self.weight,self.height];
}


@end




