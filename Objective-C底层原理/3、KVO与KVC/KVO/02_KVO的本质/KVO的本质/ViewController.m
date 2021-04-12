//
//  ViewController.m
//  KVO的本质
//
//  Created by mingjun zhang on 2019/4/5.
//  Copyright © 2019 mingjun zhang. All rights reserved.
//

#import "ViewController.h"
#import "ZMJPerson.h"

@interface ViewController ()

@property (strong, nonatomic) ZMJPerson *person1;
@property (strong, nonatomic) ZMJPerson *person2;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    
    self.person1 = [[ZMJPerson alloc] init];
    self.person1.age = 1;
    
    self.person2 = [[ZMJPerson alloc] init];
    self.person2.age = 2;
    
    // 给person1对象添加KVO监听
    NSKeyValueObservingOptions options = NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld;
    [self.person1 addObserver:self forKeyPath:@"age" options:options context:@"123"];
    
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    //    self.person1.age = 21;
    //    self.person2.age = 22;
    
    // NSKVONotifying_MJPerson是使用Runtime动态创建的一个类，是MJPerson的子类
    
    // self.person1.isa == NSKVONotifying_MJPerson
    [self.person1 setAge:21];
    
    // self.person2.isa = MJPerson
    [self.person2 setAge:22];
}

- (void)dealloc {
    [self.person1 removeObserver:self forKeyPath:@"age"];
}

// 当监听对象的属性值发生改变时，就会调用
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    NSLog(@"监听到%@的%@属性值改变了 - %@ - %@", object, keyPath, change, context);
}








@end






