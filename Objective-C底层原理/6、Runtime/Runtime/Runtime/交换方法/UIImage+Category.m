//
//  UIImage+Category.m
//  Runtime
//
//  Created by mc on 2018/3/26.
//  Copyright © 2018年 mingjun zhang. All rights reserved.
//

#import "UIImage+Category.h"

@implementation UIImage (Category)

#pragma 调用多次 用单利保证执行一次
/*
+ (void)initialize{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
    });
}
*/

// 在分类中,最好不要重写系统方法,一旦重写,把系统方法实现给干掉
//+ (UIImage *)imageNamed:(NSString *)name{
//        // super -> 父类NSObject
//}


#pragma 把类加载进内存的时候调用，只会调用一次 (这个适用于类方法)
+(void)load{
    
    //获取imageNamed  1、获取哪个类的方法 2、SEL: 获取哪个方法
    Method imageNamedMethod = class_getClassMethod(self, @selector(imageNamed:));
    //获取zmj_imageNamed
    Method zmj_imageNamedMethod = class_getClassMethod(self, @selector(zmj_imageNamed:));
    
    method_exchangeImplementations(imageNamedMethod, zmj_imageNamedMethod);
    
}


//1.加载图片  2.判断时候加载成功
+ (UIImage *)zmj_imageNamed:(NSString *)name{
    //图片
    UIImage *image = [UIImage zmj_imageNamed:name];
    if (image) {
        NSLog(@"加载成功");
    }else{
        NSLog(@"加载失败");
    }
    return image;
}






@end

