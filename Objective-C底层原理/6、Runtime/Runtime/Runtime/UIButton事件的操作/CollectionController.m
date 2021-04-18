
//
//  CollectionController.m
//  Runtime的案例应用
//
//  Created by mc on 2018/3/27.
//  Copyright © 2018年 mc. All rights reserved.
//

#import "CollectionController.h"
#import "UIButton+Swizze.h"

@interface CollectionController ()

@property (weak, nonatomic) IBOutlet UIButton *collectionBtn;

@end

@implementation CollectionController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.collectionBtn.acceptInterval = 3;
    self.collectionBtn.collectionTarget = YES;
}

- (IBAction)collectionWithButton:(UIButton *)sender {
    
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
