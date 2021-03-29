//
//  main.m
//  Interview01-KVC
//
//  Created by MJ Lee on 2018/5/3.
//  Copyright © 2018年 MJ Lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MJPerson.h"
#import "MJObserver.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        MJPerson *person = [[MJPerson alloc] init];
//        person->_age = 10;
//        person->_isAge = 11;
//        person->age = 12;
//        person->isAge = 13;
        
        NSLog(@"%@", [person valueForKey:@"age"]);
    }
    return 0;
}

