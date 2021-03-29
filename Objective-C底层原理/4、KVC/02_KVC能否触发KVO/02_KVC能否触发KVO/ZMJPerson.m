//
//  ZMJPerson.m
//  01_KVC基础
//
//  Created by zmj on 2021/3/29.
//

#import "ZMJPerson.h"

@implementation ZMJPerson

- (void)willChangeValueForKey:(NSString *)key
{
    [super willChangeValueForKey:key];
    NSLog(@"willChangeValueForKey - %@", key);
}

- (void)didChangeValueForKey:(NSString *)key
{
    NSLog(@"didChangeValueForKey - begin - %@", key);
    [super didChangeValueForKey:key];
    NSLog(@"didChangeValueForKey - end - %@", key);
}




@end







