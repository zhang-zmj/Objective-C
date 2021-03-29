//
//  main.m
//  01_KVC基础
//
//  Created by zmj on 2021/3/29.
//

#import <Foundation/Foundation.h>
#import "ZMJPerson.h"


int main(int argc, const char * argv[]) {
    @autoreleasepool {
       
        ZMJPerson *person = [[ZMJPerson alloc] init];
        person.age = 1;
        person.cat = [[ZMJCat alloc] init];
        person.cat.weight = 2;
        NSLog(@"%@", [person valueForKey:@"age"]);
        NSLog(@"%@", [person valueForKeyPath:@"cat.weight"]);

        [person setValue:@10 forKey:@"age"];
        [person setValue:@20 forKeyPath:@"cat.weight"];
        
        NSLog(@"%@", [person valueForKey:@"age"]);
        NSLog(@"%@", [person valueForKeyPath:@"cat.weight"]);
    }
    return 0;
}
