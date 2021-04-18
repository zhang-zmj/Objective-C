
//
//  DicTranModelController.m
//  Runtime
//
//  Created by mc on 2018/3/27.
//  Copyright © 2018年 mingjun zhang. All rights reserved.
//

#import "DicTranModelController.h"
#import "NSObject+Model.h"
#import "StatusItem.h"

@interface DicTranModelController ()

@end

@implementation DicTranModelController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    //获取文件全路径
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"status.plist" ofType:nil];
    //文件全路径
    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:filePath];
    
    //字典转模型
    StatusItem *item = [StatusItem modelWithDict:dict];
    NSLog(@"%@",item.user);
    
}











- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

