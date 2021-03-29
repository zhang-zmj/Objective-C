//
//  ViewController.m
//  手动实现KVO
//
//  Created by mingjun zhang on 2019/4/5.
//  Copyright © 2019 mingjun zhang. All rights reserved.
//

#import "ViewController.h"
#import "ZMJPerson.h"

@interface ViewController ()

@property (nonatomic, strong) ZMJPerson *person;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 创建学生对象
    _person = [ZMJPerson new];
    
    NSKeyValueObservingOptions options = NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld;
    // 监听属性name
    [_person addObserver:self
               forKeyPath:@"name"  // 属性
                  options:options
                  context:nil];
    
    // 监听实例变量age
    [_person addObserver:self
               forKeyPath:@"age"   // 实例变量
                  options:options
                  context:nil];
    
    _person.name = @"YouXianMing"; // 改变名字
    _person.age  = @"18";          // 改变年龄
}

- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context
{
    NSLog(@"%@", change);
}




@end



