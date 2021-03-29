//
//  main.m
//  Instance(实例)对象
//
//  Created by mingjun zhang on 2019/3/24.
//  Copyright © 2019 mingjun zhang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <malloc/malloc.h>
#import <objc/runtime.h>

//struct NSObject_IMPL
//{
//    Class isa;
//};
//
//struct MJPerson_IMPL
//{
//    struct NSObject_IMPL NSObject_IVARS; // 8
//    int _age; // 4
//    int _height; // 4
//    int _no; // 4
//}; // 24

//struct NSObject_IMPL {
//    Class isa;
//};

//struct MJPerson_IMPL {
//    struct NSObject_IMPL NSObject_IVARS;
//    int _age;
//    int _height;
//    int _no;
//}; // 计算结构体大小，内存对齐，24  一般是8的倍数

//struct MJStudent_IMPL
//{
//    struct MJPerson_IMPL MJPerson_IVARS;
//    int _weight;
//};

@interface MJPerson : NSObject
{
    int _age;
    int _height;
    int _no;
}

@end

//@interface MJStudent : MJPerson
//{
//    int _weight;
//}
//@end

@implementation MJPerson

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
      
        MJPerson *p = [[MJPerson alloc] init];
        
        // NSLog(@"%zd", sizeof(struct MJPerson_IMPL)); // 24 对象的大小、编译的时候就确定了
        
        // 24 创建一个实例对象，至少需要多少内存（所有成员变量占用的内存大小）
        NSLog(@"------%zd",class_getInstanceSize([MJPerson class]));
        
        // 32 创建一个实例对象，实际分配了多少内存
        NSLog(@"------%zd",malloc_size((__bridge const void *)(p)));

       // malloc分配的内存 是16 的倍数，最大是256
        
    }
    return 0;
}



