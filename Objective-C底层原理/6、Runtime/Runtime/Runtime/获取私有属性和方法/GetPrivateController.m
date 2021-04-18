//
//  GetPrivateController.m
//  Runtime
//
//  Created by mingjun zhang on 2018/4/5.
//  Copyright © 2018年 mingjun zhang. All rights reserved.
//

#import "GetPrivateController.h"
#import "PrivateModel.h"


@interface GetPrivateController ()



@end

@implementation GetPrivateController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    //获取UIPageControl的私有属性和方法
    [self getAllIvar];
    
    [self getAllMethod];
    
}


#pragma mark - 获取所有的属性(包括私有的)
- (void)getAllIvar{
    unsigned int count = 0;
    //Ivar：定义对象的实例变量，包括类型和名字。
    //获取所有的属性(包括私有的)
    Ivar *ivars= class_copyIvarList([UIPageControl class], &count);
    for (int i = 0; i < count; i++) {
        //取出成员变量
        Ivar ivar = ivars[i];
        
        NSString *name = [NSString stringWithUTF8String:ivar_getName(ivar)];
        NSString *type = [NSString stringWithUTF8String:ivar_getTypeEncoding(ivar)];
        NSLog(@"属性 --> %@ 和 %@",name,type);
        
    }
    
}


#pragma mark - 获取所有的方法(包括私有的)
- (void)getAllMethod {
    unsigned int count = 0;
    //获取所有的方法(包括私有的)
    Method *memberFuncs = class_copyMethodList([UIPageControl class], &count);
    for (int i = 0; i < count; i++) {
        
        SEL address = method_getName(memberFuncs[i]);
        NSString *methodName = [NSString stringWithCString:sel_getName(address) encoding:NSUTF8StringEncoding];
        
        NSLog(@"方法 : %@",methodName);
    }
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end


