//
//  ViewController.m
//  KVO 子类内部实现
//
//  Created by mingjun zhang on 2019/4/5.
//  Copyright © 2019 mingjun zhang. All rights reserved.
//

#import "ViewController.h"
#import "ZMJPerson.h"
#import <objc/runtime.h>

@interface ViewController ()

@property (strong, nonatomic) ZMJPerson *person1;
@property (strong, nonatomic) ZMJPerson *person2;

@end

//使用runtime获取meta-class元类的时候 -- object_getClass(self.person1)
//@implementation NSObject
//
//- (Class)class
//{
//    return object_getClass(self);
//}
//
//@end



@implementation ViewController

- (void)printMethodNamesOfClass:(Class)cls
{
    unsigned int count;
    // 获得方法数组
    Method *methodList = class_copyMethodList(cls, &count);
    
    // 存储方法名
    NSMutableString *methodNames = [NSMutableString string];
    
    // 遍历所有的方法
    for (int i = 0; i < count; i++) {
        // 获得方法
        Method method = methodList[i];
        // 获得方法名
        NSString *methodName = NSStringFromSelector(method_getName(method));
        // 拼接方法名
        [methodNames appendString:methodName];
        [methodNames appendString:@", "];
    }
    
    // 释放
    free(methodList);
    
    // 打印方法名
    NSLog(@"%@ %@", cls, methodNames);
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.person1 = [[ZMJPerson alloc] init];
    self.person1.age = 1;
    
    self.person2 = [[ZMJPerson alloc] init];
    self.person2.age = 2;
    
    // 给person1对象添加KVO监听
    NSKeyValueObservingOptions options = NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld;
    [self.person1 addObserver:self forKeyPath:@"age" options:options context:@"123"];

    /* 获取类对象*/
    // NSLog(@"%@-----%@",[self.person1 class],object_getClass(self.person1));
    
    /*子类中方法的验证 ---- 获取类中的方法*/
    [self printMethodNamesOfClass:object_getClass(self.person1)];
    [self printMethodNamesOfClass:object_getClass(self.person2)];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
   //手动触发KVO
    [self.person1 willChangeValueForKey:@"age"];
    [self.person1 didChangeValueForKey:@"age"];
}

- (void)dealloc {
    [self.person1 removeObserver:self forKeyPath:@"age"];
}

// observeValueForKeyPath:ofObject:change:context:
// 当监听对象的属性值发生改变时，就会调用
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    NSLog(@"监听到%@的%@属性值改变了 - %@ - %@", object, keyPath, change, context);
}



@end



