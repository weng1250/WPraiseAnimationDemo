//
//  UIView+WZLPraiseAnimation.m
//  WPraiseAnimationDemo
//
//  Created by zilin_weng on 15/6/9.
//  Copyright (c) 2015年 Weng-Zilin. All rights reserved.
//

#import "UIView+WZLPraiseAnimation.h"
#import "UIView+Frame.h"

@implementation UIView (WZLPraiseAnimation)

- (void)beginPraiseAnimaitonWithAnimationType:(WAnimationType)anniType
                                     duration:(CGFloat)duration
                                  toDirection:(WToDirection)direction
                              completionBlock:(void(^)(void))finishBlock
{
    switch (anniType) {
        case WAnimationTypeRaiseThumb:
            [self beginRaiseThumbAnimationWithDuration:duration toDirection:direction completionBlock:finishBlock];
            break;
            
        default:
            break;
    }
    
}

#pragma mark - private apis
- (void)beginRaiseThumbAnimationWithDuration:(CGFloat)duration
                                 toDirection:(WToDirection)direction
                             completionBlock:(void(^)(void))finishBlock
{
    CGRect originFrame = self.frame;
    [UIView animateWithDuration:duration / 4 animations:^{
        CGFloat newWith = self.width * 2;
        CGFloat newHeight = self.height * 2;
        self.frame = CGRectMake(self.x, self.y - 80, newWith, newHeight);
    } completion:^(BOOL finished) {
        if (direction == WToDirectionRight) {
            //rotate to left first, then to right
            [UIView animateWithDuration:duration / 2 animations:^{
                float centerX = self.width /2;
                float centerY = self.height / 2;
                float x = self.width / 2;
                float y = self.height;
                
                CGAffineTransform trans = GetCGAffineTransformRotateAroundPoint(centerX,centerY, x, y, 30.0/180.0*M_PI);
                self.transform = CGAffineTransformIdentity;
                self.transform = trans;
            } completion:^(BOOL finished) {
                [UIView animateWithDuration:duration / 4 animations:^{
                    float centerX = self.width /2;
                    float centerY = self.height / 2;
                    float x = self.width / 2;
                    float y = self.height;
                    
                    CGAffineTransform trans = GetCGAffineTransformRotateAroundPoint(centerX,centerY, x, y, 0.0/180.0*M_PI);
                    self.transform = CGAffineTransformIdentity;
                    self.transform = trans;
                    
                } completion:^(BOOL finished) {
                    [UIView animateWithDuration:duration / 2 delay:0 usingSpringWithDamping:0.6
                          initialSpringVelocity:4 options:UIViewAnimationOptionCurveEaseIn
                                     animations:^{
                                         self.frame = originFrame;
                                     }
                                     completion:^(BOOL finished) {
                                         if (finishBlock) {
                                             finishBlock();
                                         }
                                     }];
                }];
                
            }];
        }
    }];
}



#pragma -mark other private apis

CGAffineTransform GetCGAffineTransformRotateAroundPoint(float centerX, float centerY, float x ,float y ,float angle)
{
    x = x - centerX; //计算(x,y)从(0,0)为原点的坐标系变换到(CenterX ，CenterY)为原点的坐标系下的坐标
    y = y - centerY; //(0，0)坐标系的右横轴、下竖轴是正轴,(CenterX,CenterY)坐标系的正轴也一样
    
    CGAffineTransform  trans = CGAffineTransformMakeTranslation(x, y);
    trans = CGAffineTransformRotate(trans,angle);
    trans = CGAffineTransformTranslate(trans,-x, -y);
    
    return trans;
}



@end
