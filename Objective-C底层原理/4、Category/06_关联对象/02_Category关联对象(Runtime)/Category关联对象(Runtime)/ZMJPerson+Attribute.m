//
//  ZMJPerson+Attribute.m
//  Category关联对象(Runtime)
//
//  Created by mingjun zhang on 2019/4/20.
//  Copyright © 2019 mingjun zhang. All rights reserved.
//

#import "ZMJPerson+Attribute.h"
#import <objc/runtime.h>


@implementation ZMJPerson (Attribute)



/*  第一种：
 
//const void *ZMJPerson_key;  //没有赋值相当于 Null
//const void *ZMJName_key = &ZMJName_key; //存放地变量的地址 ,这个只可以在外面访问

static void *ZMJName_key = &ZMJName_key; //全局变量添加static，只能在，当前文件下访问

- (void)setName:(NSString *)name{
    objc_setAssociatedObject(self, ZMJName_key, name, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

-(NSString*)name{
    return objc_getAssociatedObject(self, ZMJName_key);
}
 
*/


/*  第二种：
static const char ZMJName_key;

- (void)setName:(NSString *)name{
    objc_setAssociatedObject(self, &ZMJName_key, name, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

-(NSString*)name{
    return objc_getAssociatedObject(self, &ZMJName_key);
}
*/



/* 第三种：
#define  ZMJNameKey  @"name"
 
 - (void)setName:(NSString *)name{
 objc_setAssociatedObject(self, ZMJNameKey, name, OBJC_ASSOCIATION_COPY_NONATOMIC);
 }
 
 -(NSString*)name{
 return objc_getAssociatedObject(self, ZMJNameKey);
 }
*/



- (void)setName:(NSString *)name{
    objc_setAssociatedObject(self, @selector(name), name, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

-(NSString*)name{
    // 隐式参数
    // _cmd == @selector(name)
     return objc_getAssociatedObject(self, @selector(name));
    return objc_getAssociatedObject(self, @selector(name));
}


@end



