
//
//  ArchiveController.m
//  Runtime
//
//  Created by mingjun zhang on 2018/3/26.
//  Copyright © 2018年 mingjun zhang. All rights reserved.
//

#import "ArchiveController.h"
#import "Teacher.h"

//https://www.jianshu.com/p/b33bdbccfa57
@interface ArchiveController ()

@end

@implementation ArchiveController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    NSString *filePath = [self setArchvePath];
    
    //归档
    Teacher *tearch = [[Teacher alloc] initWithName:@"李四" sex:@"男" numPhone:@"188000099999" age:28 height:180.0 weight:140.0 hobby:@"男" address:@"中国北京中南海"];
    
    BOOL result = [NSKeyedArchiver archiveRootObject:tearch toFile:filePath];
    if (result) {
        NSLog(@"归档成功");
    }else{
        NSLog(@"归档失败");
    }
    
    //解档
    Teacher *teach = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
    NSLog(@"%@",teach);
    
}

-(NSString*)setArchvePath{
    
    NSString *documentPath = ([NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject]);
    NSString *filePath = [documentPath stringByAppendingPathComponent:@"tearch.data"];
    return filePath;
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
