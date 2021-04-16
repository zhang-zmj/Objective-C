//
//  ViewController.m
//  8、读写安全
//
//  Created by zmj on 2019/7/22.
//  Copyright © 2019 zmj. All rights reserved.
//

#import "ViewController.h"
#import "Pthread_rwlock.h"
#import "Dispatch_barrier_async.h"

@interface ViewController ()

@end

@implementation ViewController


#pragma mark -- 不管读或者写，只有一条线程进行
- (void)viewDidLoad {
    [super viewDidLoad];
   
    Pthread_rwlock *objct = [[Pthread_rwlock alloc] init];
//    Dispatch_barrier_async *barry = [[Dispatch_barrier_async alloc] init];
    
    
}







@end


