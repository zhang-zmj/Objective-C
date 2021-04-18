
//
//  Private Controller.m
//  Runtime
//
//  Created by mc on 2018/3/26.
//  Copyright © 2018年 mingjun zhang. All rights reserved.
//

#import "PrivateController.h"
#import "Student.h"

@interface PrivateController ()

@property (nonatomic, strong) Student *student;

@end

@implementation PrivateController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self modifyPrivateIvar]; //修改私有变量
    [self getAllMethods]; //获取所有的方法
    
}


#pragma 修改私有变量
-(void)modifyPrivateIvar{
    Student *student = [[Student alloc] init];
    self.student = student;
    NSLog(@"修改私有变量前 %@",[student description]);
    
    unsigned int count = 0;
    Ivar *ivars = class_copyIvarList([Student class], &count);
    
//    for (int i = 0; i < count; i++) {
//        Ivar ivar = ivars[i];
//        const char *ivarName = ivar_getName(ivar);
//        const char *ivarType = ivar_getTypeEncoding(ivar);
//    }
    
    //修改成员变量
    Ivar modeify_age = ivars[1];
    object_setIvar(student, modeify_age, @28);
    NSLog(@"修改私有变量后 : %@",[student description]);
}

#pragma 获取私有方法
-(void)getAllMethods{
    unsigned int count = 0;
    Method *methods = class_copyMethodList([Student class], &count);
    for (int i = 0; i < count; i++) {
        SEL methodsAddress = method_getName(methods[i]);
        NSString *methodName = [NSString stringWithCString:sel_getName(methodsAddress) encoding:NSUTF8StringEncoding];
       //调用私有方法
        if ([methodName isEqualToString:@"sleep"]) {
            objc_msgSend(self.student, @selector(sleep));
        }
        NSLog(@"方法 : %@",methodName);
    }
}

- (void)dealloc{
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end


