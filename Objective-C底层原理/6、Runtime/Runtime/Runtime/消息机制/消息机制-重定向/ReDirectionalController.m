//
//  ImplementController.m
//  Runtime
//
//  Created by mingjun zhang on 2018/3/25.
//  Copyright © 2018年 mingjun zhang. All rights reserved.
//

#import "ReDirectionalController.h"
#import "NoPerson.h"

@interface ReDirectionalController ()

@end

@implementation ReDirectionalController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    NoPerson *person = [[NoPerson alloc] init];
    //通过消息转发机制使得对象调用未实现的方法时不会崩溃
    [person run];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

