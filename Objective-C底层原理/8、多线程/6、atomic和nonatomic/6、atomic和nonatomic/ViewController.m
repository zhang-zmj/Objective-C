//
//  ViewController.m
//  7、atomic和nonatomic
//
//  Created by zmj on 2019/7/22.
//  Copyright © 2019 zmj. All rights reserved.
//

#import "ViewController.h"
#import "ZMJPerson.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ZMJPerson *person = [[ZMJPerson alloc] init];
    
    person.dataArray = [NSMutableArray array]; //线程安全， 使用的setterd方法
    
    //多个线程操作这个方法，容易造成不安全，可能同时进行
    
    //加锁
    [person.dataArray addObject:@"1"];
    [person.dataArray addObject:@"2"];
    [person.dataArray addObject:@"3"];
    //解锁
    
    
    //对于同一个对象进行多线程操作
    for (int i = 0; i < 10; i++) {
        dispatch_async(NULL, ^{
           person.dataArray = [NSMutableArray array];
        });
    }
    
    //需要加锁的时候，要在外面进行加锁
    
}





@end
