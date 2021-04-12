//
//  ZMJPerson.m
//  Block本质
//
//  Created by mingjun zhang on 2019/4/20.
//  Copyright © 2019 mingjun zhang. All rights reserved.
//

#import "ZMJPerson.h"

@implementation ZMJPerson

-(void)test{
    
    void(^block)(void) = ^{
        NSLog(@"--------%p",self);
    };
    block();
    
}


-(instancetype)initWithName:(NSString*)name{
    if (self = [super init]) {
    
        self.name = name;
    }
    
    return self;
}



@end


