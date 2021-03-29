//
//  main.m
//  meta-class(元类)对象
//
//  Created by mingjun zhang on 2019/3/24.
//  Copyright © 2019 mingjun zhang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>


int main(int argc, const char * argv[]) {
    @autoreleasepool {
      
      
        // instance对象，实例对象
        NSObject *object1 = [[NSObject alloc] init];
        NSObject *object2 = [[NSObject alloc] init];
        
        // class对象，类对象
        // class方法返回的一直是class对象，类对象
        Class objectClass1 = [object1 class];
        Class objectClass2 = [object2 class];
        Class objectClass3 = object_getClass(object1);
        Class objectClass4 = object_getClass(object2);
        Class objectClass5 = [NSObject class];
        
        // meta-class对象，元类对象
        // 将类对象当做参数传入，获得元类对象
        Class objectMetaClass = object_getClass(objectClass5);
        //        Class objectMetaClass2 = [[[NSObject class] class] class];
        
        NSLog(@"instance - %p %p",
              object1,
              object2);
        
        NSLog(@"class - %p %p %p %p %p %d",
              objectClass1,
              objectClass2,
              objectClass3,
              objectClass4,
              objectClass5,
              class_isMetaClass(objectClass3));
        
        NSLog(@"objectMetaClass - %p %d", objectMetaClass, class_isMetaClass(objectMetaClass));
        
        
    }
    return 0;
}


/*
 1.Class objc_getClass(const char *aClassName)
 1> 传入字符串类名
 2> 返回对应的类对象
 
 2.Class object_getClass(id obj)
 1> 传入的obj可能是instance对象、class对象、meta-class对象
 2> 返回值
 a) 如果是instance对象，返回class对象
 b) 如果是class对象，返回meta-class对象
 c) 如果是meta-class对象，返回NSObject（基类）的meta-class对象
 
 3.- (Class)class、+ (Class)class
 1> 返回的就是类对象
 
 - (Class) {
 return self->isa;
 }
 
 + (Class) {
 return self;
 }
 */





