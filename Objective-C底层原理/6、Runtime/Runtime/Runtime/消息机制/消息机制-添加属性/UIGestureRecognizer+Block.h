//
//  UIGestureRecognizer+Block.h
//  Runtime
//
//  Created by mc on 2018/3/26.
//  Copyright © 2018年 mingjun zhang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ZMJGestureBlock)(id gestureRecognizer);

@interface UIGestureRecognizer (Block)

+(instancetype)gestureRecognizerWithActionBlock:(ZMJGestureBlock)block;

@end

