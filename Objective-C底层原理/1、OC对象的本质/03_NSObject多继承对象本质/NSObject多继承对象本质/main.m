//
//  main.m
//  NSObject多继承对象本质
//
//  Created by mingjun zhang on 2019/3/20.
//  Copyright © 2019 mingjun zhang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import <malloc/malloc.h>

/*
 
//根类
struct NSObject_IMPL {
    Class isa;
};

//子类
struct Person_IMPL {
    struct NSObject_IMPL NSObject_IVARS; // 8
    int _age; // 4
}; // 16 内存对齐：结构体的大小必须是最大成员大小的倍数

//多子类
struct Student_IMPL {
    struct Person_IMPL Person_IVARS; // 16
    int _no; // 4
}; // 16
 
*/


/*
 
 struct Person_IMPL {
 Class isa;
 int _age;
 int _height;
 };
 
 */
 
// Person
@interface Person : NSObject
{
@public
    int _age;
}

//生成成员变量
@property (nonatomic, assign) int height;

@end

@implementation Person

@end

// Student
@interface Student : Person
{
    int _no;
}

@end

@implementation Student

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
//        Student *stu = [[Student alloc] init];
//        //内存对齐，实际成员变量的内存大小  16个字节
//        NSLog(@"stu - %zd", class_getInstanceSize([Student class]));
//        //最低是16个字节，之后以2的倍数增加
//        NSLog(@"stu - %zd", malloc_size((__bridge const void *)stu));
    
        
//        Person *person = [[Person alloc] init];
//        NSLog(@"person - %zd", class_getInstanceSize([Person class]));      //16个字节
//        NSLog(@"person - %zd", malloc_size((__bridge const void *)person)); //16个字节
        
  
    }
    return 0;
}





