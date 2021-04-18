
//
//  UIViewController+Runtime.m
//  Runtime的案例应用
//
//  Created by mc on 2018/3/26.
//  Copyright © 2018年 mc. All rights reserved.
//

#import "UIViewController+Runtime.h"


const char *viewDidAppearTimeInterValKey = "viewDidAppearTimeIntervalKey";
@interface UIViewController ()

@property (nonatomic, strong) NSDate *date;

@end

@implementation UIViewController (Runtime)

+(void)load{
    
    SEL systemDidAppearSEL = @selector(viewDidAppear:);
    SEL customDidAppearSEL = @selector(swizzleViewDidAppear:);
    [UIViewController swizzleSystemSel:systemDidAppearSEL implementationCustomSel:customDidAppearSEL];
    
    SEL systemDidDisappearSEL = @selector(viewDidDisappear:);
    SEL customDidDisappearSEL = @selector(swizzleViewDidDisapper:);
    [UIViewController swizzleSystemSel:systemDidDisappearSEL implementationCustomSel:customDidDisappearSEL];

}


#pragma 运用到实例方法上
+(void)swizzleSystemSel:(SEL)systemSel implementationCustomSel:(SEL)customSel{
    
    Class cls  = [self class];
    Method systemMethod = class_getInstanceMethod(cls, systemSel);
    Method customMethod = class_getInstanceMethod(cls, customSel);
    /*
     BOOL class_addMethod(Class cls, SEL name, IMP imp,const char *types)
     cls被添加方法的类
     name: 被增加Method的name
     imp 被添加的Method的实现函数
     types被添加Method的实现函数的返回类型和参数的字符串
    */
    BOOL didAddMethod = class_addMethod(cls, systemSel, method_getImplementation(customMethod), method_getTypeEncoding(customMethod));
    if (didAddMethod) {
        class_replaceMethod(cls, customSel, method_getImplementation(systemMethod), method_getTypeEncoding(customMethod));
    }else{
        method_exchangeImplementations(systemMethod, customMethod);
    }
    
}


#pragma 自定义Controller已经打开的方法
-(void)swizzleViewDidAppear:(BOOL)animated{
     NSLog(@" class =%@ 访问一次 在这里实现用户统计用埋点\n",[self class] );
    [self setDate:[NSDate new]];
     NSLog(@"访问时间 ＝%@",[self date]);
    [self swizzleViewDidAppear:animated];
}

#pragma 自定义Controller已经关闭的方法
-(void)swizzleViewDidDisapper:(BOOL)animated{
    [self swizzleViewDidDisapper:animated];
    NSDate * date = [NSDate new];
    NSLog(@"访问时间%@  离开时间＝%@ \n ", date,self.date);
    NSLog(@" %@访问时间TimeInterval ＝%f秒", [self class],[date timeIntervalSinceDate:self.date]);
}


#pragma 添加setter和getter方法
-(NSDate*)date{
    return objc_getAssociatedObject(self, viewDidAppearTimeInterValKey);
}

- (void)setDate:(NSDate *)date{
    objc_setAssociatedObject(self, viewDidAppearTimeInterValKey, date, OBJC_ASSOCIATION_COPY_NONATOMIC);
    
}


@end




