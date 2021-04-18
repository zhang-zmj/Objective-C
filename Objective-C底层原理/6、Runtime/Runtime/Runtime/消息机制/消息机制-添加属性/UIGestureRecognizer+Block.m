//
//  UIGestureRecognizer+Block.m
//  Runtime
//
//  Created by mc on 2018/3/26.
//  Copyright © 2018年 mingjun zhang. All rights reserved.
//

#import "UIGestureRecognizer+Block.h"

static const int target_key;
@implementation UIGestureRecognizer (Block)

+ (instancetype)gestureRecognizerWithActionBlock:(ZMJGestureBlock)block{
    __weak typeof(self) weakSelf = self;
    return [[weakSelf alloc] initWithActionBlock:block];
}

-(instancetype)initWithActionBlock:(ZMJGestureBlock)block{
    self = [self init];
    [self addActionBlock:block];
    [self addTarget:self action:@selector(invoke:)];
    return self;
}

-(void)addActionBlock:(ZMJGestureBlock)block{
    if (block) {
        //让这个字符串和当前对象产生联系
        /*
         object:给哪个对象添加属性
         key:属性名称
         value:属性值
         policy:保存策略
         */
        objc_setAssociatedObject(self, &target_key, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
    }
}


-(void)invoke:(id)sender{
    ZMJGestureBlock block = objc_getAssociatedObject(self, &target_key);
    if (block) {
        block(sender);
    }
}

@end

