//
//  ChangeController.m
//  Runtime
//
//  Created by mc on 2018/3/26.
//  Copyright © 2018年 mingjun zhang. All rights reserved.
//

#import "ChangeController.h"
#import "UIImage+Category.h"

@interface ChangeController ()

@end

@implementation ChangeController

- (void)viewDidLoad {
    [super viewDidLoad];
    /**
     *Runtime(交换方法)
     应用场景：只要想修改系统的方法实现。
     需求:
     给加载图片添加一个功能，提示是否加载成功
     给系统的imageNamed添加功能,只能使用runtime(交换方法)
     1.给系统的方法添加分类
     2.自己实现一个带有扩展功能的方法
     3.交互方法,只需要交互一次,
     */
    UIImage *image = [UIImage imageNamed:@"1.jpg"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end

