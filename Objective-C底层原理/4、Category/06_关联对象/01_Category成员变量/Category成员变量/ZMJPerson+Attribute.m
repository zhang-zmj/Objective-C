
//
//  ZMJPerson+Attribute.m
//  Category成员变量
//
//  Created by mingjun zhang on 2019/4/20.
//  Copyright © 2019 mingjun zhang. All rights reserved.
//

#import "ZMJPerson+Attribute.h"

#define zmj_Key [NSString  stringWithFormat:@"%p",self]
@implementation ZMJPerson (Attribute)

NSMutableDictionary *weights_;
NSMutableDictionary *names_;
+(void)load{
    weights_ = [NSMutableDictionary dictionary];
    names_ = [NSMutableDictionary dictionary];
}

//weight属性
-(void)setWeight:(int)weight{
    weights_[zmj_Key] = @(weight);
}

-(int)weight{
    return [weights_[zmj_Key] intValue];
}

//name属性
-(void)setName:(NSString *)name{
     names_[zmj_Key] = name;
}

-(NSString*)name{
    return names_[zmj_Key];
}


//int weight_;


//-(void)setWeight:(int)weight{
    //    weight_ = weight;
//}


//-(int)weight{
    //    return weight_;
//}


@end



