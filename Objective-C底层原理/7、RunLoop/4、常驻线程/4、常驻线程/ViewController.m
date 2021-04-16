//
//  ViewController.m
//  常驻线程
//
//  Created by zmj on 2021/2/22.
//

#import "ViewController.h"
#import "ZMJViewController.h"
#import "ZMJPerViewController.h"

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    
    
    
    
    
}






- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    ZMJPerViewController *vc = [[ZMJPerViewController alloc] init];
    [self.navigationController pushViewController:vc animated:true];
}


@end











