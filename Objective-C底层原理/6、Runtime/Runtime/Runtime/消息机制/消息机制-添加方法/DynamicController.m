//
//  DynamicController.m
//  Runtime
//
//  Created by mingjun zhang on 2018/3/25.
//  Copyright © 2018年 mingjun zhang. All rights reserved.
//

#import "DynamicController.h"
#import "AddPerson.h"

@interface DynamicController ()

@end

@implementation DynamicController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
     AddPerson *person = [[AddPerson alloc] init];
     [person performSelector:@selector(run:) withObject:@10];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

