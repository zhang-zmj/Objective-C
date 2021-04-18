//
//  main.m
//  03、Tagged Pointer
//
//  Created by zmj on 2021/4/18.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSString *str1 = [NSString stringWithFormat:@"%@",@"123"];
        NSString *str2 = [NSString stringWithFormat:@"%@",@"fffffff"];
        NSLog(@"%p %p %@ %@",str1, str2, [str1 class], [str2 class]);
        
    }
    return 0;
}
