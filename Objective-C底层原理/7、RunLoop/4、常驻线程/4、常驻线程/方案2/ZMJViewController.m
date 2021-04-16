//
//  ZMJViewController.m
//  4、常驻线程
//
//  Created by zmj on 2021/2/24.
//

#import "ZMJViewController.h"
#import "ZMJPermenantThread.h"

@interface ZMJViewController ()

@property (strong,nonatomic) ZMJPermenantThread *thread;

@end

@implementation ZMJViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.thread = [[ZMJPermenantThread alloc] init];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"停止线程" forState:UIControlStateNormal];
    btn.frame = CGRectMake(50, 150, [[UIScreen mainScreen] bounds].size.width - 100, 50);
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(stop) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self.thread executeTask:^{
        NSLog(@"执行任务 - %@", [NSThread currentThread]);
    }];
    
}

// 子线程需要执行的任务
-(void)test
{
    NSLog(@"%s    %@", __func__, [NSThread currentThread]);
}

-(void)stop{
    
    [self.thread stop];
    
}


- (void)dealloc
{
    
    NSLog(@"%s", __func__);
    [self stop];
    
}



@end



