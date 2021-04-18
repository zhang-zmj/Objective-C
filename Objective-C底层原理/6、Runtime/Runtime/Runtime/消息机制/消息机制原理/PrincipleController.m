//
//  PrincipleController.m
//  Runtime
//
//  Created by mingjun zhang on 2018/3/25.
//  Copyright © 2018年 mingjun zhang. All rights reserved.
//

#import "PrincipleController.h"
#import "EveryPerson.h"

@interface PrincipleController ()

@end

@implementation PrincipleController

/*
 OC是一种运行时语言(runtime)
   任何方法调用本质：发送一个消息.
   验证：方法调用，是否真的转换为消息机制
   runtime都有一个前缀，谁的事情使用谁
*/

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    /*
     sel_registerName(const char *str) 注册个方法编号
     让Person这个类对象发送了一个alloc消息，返回一个分配好的内存对象给你;再发送一个消息初始化.
     */
    
    //类的初始化
//    EveryPerson *person = [EveryPerson alloc];
    EveryPerson *person = objc_msgSend(objc_getClass("EveryPerson"), sel_registerName("alloc"));
    
//    person = [person init];
    person = objc_msgSend(person, sel_registerName("init"));
    
    //调用方法种类：三种：
//    objc_msgSend(person, @selector(eat)); //无参
    objc_msgSend(person, sel_registerName("eat"));
    objc_msgSend(person, @selector(run:),100);

    
    /*
     方法的调用的流程：
     怎么去调用eat方法，对象方法：类对象的方法列表   类方法：元类中方法列表
     1、通过isa去对应的类中查找
     2、注册方法编号
     3、根据方法编号去查找对应方法
     4、找到只是最终函数实现地址，根据地址去方法区调用对应函数；
     
     内容5大区：
     1、栈 2、堆 3、静态区 4、常量区 5、方法区
     栈：不需要手动管理内存，自动管理
     堆：徐亚奥手动管理内存，自己去释放
     */
    
}

-(void)test{
    
    //    id objc = [NSObject alloc];
    id objc = objc_msgSend([NSObject class], @selector(alloc));
    
    //    objc = [objc init];
    objc = objc_msgSend(objc, @selector(init));
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

