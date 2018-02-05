//
//  UIView+Frame.m
//  IFreeApp
//
//  Created by wuyiguang on 2016/10/11.
//  Copyright © 2016年 YG. All rights reserved.
//

#import "UIView+Frame.h"

@implementation UIView (Frame)

- (CGFloat)x
{
    return self.frame.origin.x;
}
- (void)setX:(CGFloat)x
{
    CGRect rect = self.frame;
    rect.origin.x = x;
    self.frame = rect;
}

- (CGFloat)y
{
    return self.frame.origin.y;
}
- (void)setY:(CGFloat)y
{
    CGRect rect = self.frame;
    rect.origin.y = y;
    self.frame = rect;
}

- (CGFloat)width
{
    return self.bounds.size.width;
}
- (void)setWidth:(CGFloat)width
{
    CGRect rect = self.bounds;
    rect.size.width = width;
    self.frame = rect;
}

- (CGFloat)height
{
    return self.bounds.size.height;
}
- (void)setHeight:(CGFloat)height
{
    CGRect rect = self.bounds;
    rect.size.height = height;
    self.frame = rect;
}



- (void)setCenterX:(CGFloat)centerX
{
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}

- (CGFloat)centerX
{
    return self.center.x;
}
- (void)setCenterY:(CGFloat)centerY
{
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}

- (CGFloat)centerY
{
    return self.center.y;
}


- (void)setSize:(CGSize)size
{
    //    self.width = size.width;
    //    self.height = size.height;
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (CGSize)size
{
    return self.frame.size;
}

@end
