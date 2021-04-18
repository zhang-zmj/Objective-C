//
//  main.m
//  04、OC对象的内存管理
//
//  Created by zmj on 2021/4/18.
//

#import <Foundation/Foundation.h>
#import "MJPerson.h"
#import "MJDog.h"

// Manual Reference Counting ： MRC

void test()
{
    // 内存泄漏：该释放的对象没有释放
//    MJPerson *person1 = [[[MJPerson alloc] init] autorelease];
//    MJPerson *person2 = [[[MJPerson alloc] init] autorelease];
}

void test2()
{
    MJDog *dog = [[MJDog alloc] init]; // 1
    
    MJPerson *person1 = [[MJPerson alloc] init];
    [person1 setDog:dog]; // 2
    
    MJPerson *person2 = [[MJPerson alloc] init];
    [person2 setDog:dog]; // 3
    
    [dog release]; // 2
    
    [person1 release]; // 1
    
    [[person2 dog] run];
    [person2 release]; // 0
}

void test3()
{
    MJDog *dog1 = [[MJDog alloc] init]; // dog1 : 1
    MJDog *dog2 = [[MJDog alloc] init]; // dog2 : 1
    
    MJPerson *person = [[MJPerson alloc] init];
    [person setDog:dog1]; // dog1 : 2
    [person setDog:dog2]; // dog2 : 2, dog1 : 1
    
    [dog1 release]; // dog1 : 0
    [dog2 release]; // dog2 : 1
    [person release]; // dog2 : 0
}

void test4()
{
    MJDog *dog = [[MJDog alloc] init]; // dog:1
    
    MJPerson *person = [[MJPerson alloc] init];
    [person setDog:dog]; // dog:2
    
    [dog release]; // dog:1
    
    [person setDog:dog];
    [person setDog:dog];
    [person setDog:dog];
    [person setDog:dog];
    [person setDog:dog];
    
    [person release]; // dog:0
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        MJPerson *person = [MJPerson person];
//        MJPerson *person = [[MJPerson alloc] init];
//        [person release];
        
    }
    return 0;
}
