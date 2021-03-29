//
//  main.m
//  04_isa和superclass内存特点
//
//  Created by zmj on 2021/3/28.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

// MJPerson
@interface ZMJPerson : NSObject <NSCopying>
{
@public
    int _age;
}
@property (nonatomic, assign) int no;
- (void)personInstanceMethod;
+ (void)personClassMethod;
@end

@implementation ZMJPerson

- (void)test
{
    
}

- (void)personInstanceMethod
{
    
}
+ (void)personClassMethod
{
    
}
- (id)copyWithZone:(NSZone *)zone
{
    return nil;
}
@end

// ZMJStudent
@interface ZMJStudent : ZMJPerson <NSCoding>
{
@public
    int _weight;
}
@property (nonatomic, assign) int height;
- (void)studentInstanceMethod;
+ (void)studentClassMethod;
@end

@implementation ZMJStudent
- (void)test
{
    
}
- (void)studentInstanceMethod
{
    
}
+ (void)studentClassMethod
{
    
}
- (id)initWithCoder:(NSCoder *)aDecoder
{
    return nil;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    
}
@end


struct mj_objc_class {
    Class isa;
    Class superclass;
};



int main(int argc, const char * argv[]) {
    @autoreleasepool {
   
        // ZMJPerson类对象的地址：0x00000001000014c8
        // isa & ISA_MASK：0x00000001000014c8
        
        // MJPerson实例对象的isa：0x001d8001000014c9
        
        struct mj_objc_class *personClass = (__bridge struct mj_objc_class *)([ZMJPerson class]);
        
        struct mj_objc_class *studentClass = (__bridge struct mj_objc_class *)([ZMJStudent class]);
        
        NSLog(@"1111");
        
//        MJPerson *person = [[ZMJPerson alloc] init];
//
        
//        Class personClass = [ZMJPerson class];
        
//        struct mj_objc_class *personClass2 = (__bridge struct mj_objc_class *)(personClass);
//
//        Class personMetaClass = object_getClass(personClass);
//
//        NSLog(@"%p %p %p", person, personClass, personMetaClass);
//        MJStudent *student = [[ZMJStudent alloc] init];
        
    }
    return 0;
}







