//
//  NSObject+Test.m
//  03_isa和superclass
//
//  Created by zmj on 2021/3/28.
//

#import "NSObject+Test.h"

@implementation NSObject (Test)

//+ (void)test
//{
//    NSLog(@"+[NSObject test] - %p", self);
//}

- (void)test
{
    NSLog(@"-[NSObject test] - %p", self);
}


@end


