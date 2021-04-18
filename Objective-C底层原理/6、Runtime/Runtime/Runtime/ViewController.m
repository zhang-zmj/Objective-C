//
//  ViewController.m
//  Runtime
//
//  Created by mingjun zhang on 2018/3/25.
//  Copyright © 2018年 mingjun zhang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic,strong) NSArray *listArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _listArray = @[@"MessageController",@"PrivateController",@"ChangeController",@"ArchiveController",@"DicTranModelController",@"FirstController",@"CollectionController",@"GetPrivateController",@"DynamiController"];
}

- (IBAction)clickMessageBtn:(UIButton *)sender {
    UIViewController *cls = [[NSClassFromString(_listArray[sender.tag]) alloc] init];
    [self.navigationController pushViewController:cls animated:NO];
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
