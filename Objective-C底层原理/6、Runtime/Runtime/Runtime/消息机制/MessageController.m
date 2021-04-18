//
//  MessageController.m
//  Runtime
//
//  Created by mingjun zhang on 2018/3/25.
//  Copyright © 2018年 mingjun zhang. All rights reserved.
//

#import "MessageController.h"

@interface MessageController ()

@property (nonatomic,strong) NSArray *listArray;

@end

@implementation MessageController

- (void)viewDidLoad {
    [super viewDidLoad];
    _listArray = @[@"PrincipleController",@"DynamicController",@"ReDirectionalController",@"AddPropertyController"];
}

- (IBAction)clickPrinciple:(UIButton *)sender {
    UIViewController *cls = [[NSClassFromString(_listArray[sender.tag]) alloc] init];
    [self.navigationController pushViewController:cls animated:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end


