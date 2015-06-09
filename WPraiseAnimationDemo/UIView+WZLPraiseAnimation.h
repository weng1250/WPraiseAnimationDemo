//
//  UIView+WZLPraiseAnimation.h
//  WPraiseAnimationDemo
//
//  Created by zilin_weng on 15/6/9.
//  Copyright (c) 2015年 Weng-Zilin. All rights reserved.
//

#import <UIKit/UIKit.h>

//the direction of thumb
typedef NS_ENUM(NSInteger, WToDirection) {
    WToDirectionLeft = 0,
    WToDirectionRight
};

typedef NS_ENUM(NSInteger, WAnimationType) {
    WAnimationTypeRaiseThumb = 0,               //first raise thumb, then rotate, recovery at last.
    WAnimationTypeIncreaseOne                   //'thumb' view stay still. Make label '+1' appear above thumb view
                                                
};


@interface UIView (WZLPraiseAnimation)

- (void)beginPraiseAnimaitonWithAnimationType:(WAnimationType)anniType
                                     duration:(CGFloat)duration
                             toDirection:(WToDirection)direction
                         completionBlock:(void(^)(void))finishBlock;

@end