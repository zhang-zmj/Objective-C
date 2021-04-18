//
//  FirstController.m
//  Runtime的案例应用
//
//  Created by mc on 2018/3/26.
//  Copyright © 2018年 mc. All rights reserved.
//

#import "FirstController.h"
#import "SecondController.h"

@interface FirstController ()

@end

@implementation FirstController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)clickFirstButton:(UIButton *)sender {
    SecondController *second = [[SecondController alloc] init];
    [self.navigationController pushViewController:second animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
