//
//  main.m
//  NSObject单子类对象本质
//
//  Created by mingjun zhang on 2019/3/20.
//  Copyright © 2019 mingjun zhang. All rights reserved.
//


#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import <malloc/malloc.h>


//struct NSObject_IMPL {
//    Class isa;
//};


struct Student_IMPL {
    Class isa;
    int _no;
    int _age;
};


@interface Student : NSObject
{
    @public
    int _no;
    int _age;
}

@end

@implementation Student

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Student *stu = [[Student alloc] init];
        stu->_no = 4;
        stu->_age = 5;
        
        NSLog(@"%zd", class_getInstanceSize([Student class]));
        NSLog(@"%zd", malloc_size((__bridge const void *)stu));
        
        
        struct Student_IMPL *stuImpl = (__bridge struct Student_IMPL *)stu;
        NSLog(@"no is %d, age is %d", stuImpl->_no, stuImpl->_age);
  
    }
    return 0;
}



