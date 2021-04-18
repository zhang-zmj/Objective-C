
//
//  AddPropertyController.m
//  Runtime
//
//  Created by mc on 2018/3/26.
//  Copyright © 2018年 mingjun zhang. All rights reserved.
//

#import "AddPropertyController.h"
#import "UIGestureRecognizer+Block.h"
#import "Person.h"
#import "NSObject+Category.h"

#define SCREENWIDTH [UIScreen mainScreen].bounds.size.width
#define SCREENHEIGHT [UIScreen mainScreen].bounds.size.height

@interface AddPropertyController ()

@property (weak, nonatomic) IBOutlet UIView *middleView;

@end

@implementation AddPropertyController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /*
     众所周知，分类中是无法设置属性的，如果在分类的声明中写@property 只能为其生成get 和 set 方法的声明，但无法生成成员变量，就是虽然点语法能调用出来，但程序执行后会crash
     */
    
    
    
    NSString *str = @"123";
    Person *p = [[Person alloc] init];
    p.name = str;
    NSLog(@"%@",p.name);
    
    
    [_middleView addGestureRecognizer:[UITapGestureRecognizer gestureRecognizerWithActionBlock:^(id gestureRecognizer) {
        NSLog(@"我在这里增加了一个block的属性-----%@",gestureRecognizer);
    }]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
