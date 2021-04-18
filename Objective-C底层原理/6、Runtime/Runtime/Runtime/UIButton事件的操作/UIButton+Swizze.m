
//
//  UIButton+Swizze.m
//  Runtime的案例应用
//
//  Created by mc on 2018/3/27.
//  Copyright © 2018年 mc. All rights reserved.
//

#import "UIButton+Swizze.h"

static const char *UIButton_collection = "UIButton_collection";
static const char *UIButton_time = "UIButton_time";

@implementation UIButton (Swizze)


-(void)setCollectionTarget:(BOOL)collectionTarget{
    objc_setAssociatedObject(self,UIButton_collection,@(collectionTarget),OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(BOOL)collectionTarget{
    return [objc_getAssociatedObject(self,UIButton_collection) boolValue];
}


-(void)setAcceptInterval:(NSTimeInterval)acceptInterval{
    objc_setAssociatedObject(self,UIButton_time,@(acceptInterval),OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(NSTimeInterval)acceptInterval{
    return [objc_getAssociatedObject(self,UIButton_time) doubleValue];
}


#pragma 这个使用对象的实例方法
+ (void)load{

    Class class = [self class];
    Method originalMethod = class_getInstanceMethod(class, @selector(sendAction:to:forEvent:));
    Method swizzleMethod = class_getInstanceMethod(class, @selector(collectionTarget:to:forEvent:));
    
    BOOL didAddMethod = class_addMethod(class, @selector(sendAction:to:forEvent:), method_getImplementation(swizzleMethod), method_getTypeEncoding(swizzleMethod));
    if (didAddMethod) {
        class_replaceMethod(class, @selector(collectionTarget:to:forEvent:), method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    }else{
        method_exchangeImplementations(originalMethod, swizzleMethod);
    }
}

-(void)collectionTarget:(SEL)action to:(id)target forEvent:(UIEvent *)event{
    
      if (self.collectionTarget){
        NSLog(@"在这里收集用户点击的行为,点击了:%@",self.currentTitle);
      }
    
    if (self.acceptInterval > 0) {
        if (self.userInteractionEnabled) {
           [self collectionTarget:action to:target forEvent:event];
        }
        self.userInteractionEnabled = NO;
        
        // GCD 延迟执行 self.acceptEventInterval：为延迟时间
        __weak typeof (self) weakSelf = self;
        dispatch_time_t delayTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(self.acceptInterval * NSEC_PER_SEC));
        dispatch_after(delayTime, dispatch_get_main_queue(), ^{
            weakSelf.userInteractionEnabled = YES;
        });

    }else{
       [self collectionTarget:action to:target forEvent:event];
    }

}








@end


