//
//  DynamiController.m
//  Runtime
//
//  Created by mingjun zhang on 2018/4/7.
//  Copyright © 2018年 mingjun zhang. All rights reserved.
//

#import "DynamiController.h"
#import "DetailController.h"

@interface DynamiController ()

@end


@implementation DynamiController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //获取类名
    NSString *selfClass = NSStringFromClass([self class]);
    
    
    //NSClassFromString用法
    id myOneObj = [[NSClassFromString(@"DetailController") alloc] init];
    id myTwoObj = [[DetailController alloc] init];
    //如果你的程序中并不存在DetailController这个类,下面的写法会出错，而上面的写法只是返回一个空对象而已
  
    
    //NSStringFromSelector用法
    SEL sel=@selector(compare:);
    
    NSString *functionName = NSStringFromSelector(sel);
    
    SEL anotherSel = NSSelectorFromString(@"");
    
    //通过下面的调用来给一个对象发送消息
//    [对象　performSelector:SEL变量　withObject:参数1　withObject:参数2];
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}












- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}






@end


