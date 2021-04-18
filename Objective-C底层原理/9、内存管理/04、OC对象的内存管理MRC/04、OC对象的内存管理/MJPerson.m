//
//  MJPerson.m
//  Interview01-内存管理
//
//  Created by MJ Lee on 2018/6/27.
//  Copyright © 2018年 MJ Lee. All rights reserved.
//

#import "MJPerson.h"

@implementation MJPerson








- (void)setAge:(int)age
{
    _age = age;
}

- (int)age
{
    return _age;
}

- (void)setDog:(MJDog *)dog
{
    if (_dog != dog) {
        [_dog release];
        _dog = [dog retain];
    }
}

- (MJDog *)dog
{
    return _dog;
}

- (void)setCar:(MJCar *)car
{
    if (_car != car) {
        [_car release];
        _car = [car retain];
    }
}

- (MJCar *)car
{
    return _car;
}

- (void)dealloc
{
//    [_dog release];
//    _dog = nil;
    self.dog = nil;
    self.car = nil;
    
    NSLog(@"%s", __func__);
    
    // 父类的dealloc放到最后
    [super dealloc];
}

@end
