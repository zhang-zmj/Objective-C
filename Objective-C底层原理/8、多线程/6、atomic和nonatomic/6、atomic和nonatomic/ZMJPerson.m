//
//  ZMJPerson.m
//  7、atomic和nonatomic
//
//  Created by zmj on 2019/7/22.
//  Copyright © 2019 zmj. All rights reserved.
//

#import "ZMJPerson.h"

@implementation ZMJPerson

@synthesize name;

-(void)setName:(NSString *)name{
    //加锁
    name = name;
    //解锁
}

-(NSString *)name{
    //加锁
    return name;
    //解锁
}


@end







