//
//  UIView+Frame.m
//  PhotosDemo
//
//  Created by LSH on 2017/10/17.
//  Copyright © 2017年 ZhangKang. All rights reserved.
//

#import "UIView+Frame.h"

@implementation UIView (Frame)

-(CGFloat)width
{
    return self.frame.size.width;
}
-(void)setWidth:(CGFloat)width
{
    CGRect rect = self.frame;
    CGRect newRect = CGRectMake(rect.origin.x, rect.origin.y, width, rect.size.height);
    self.frame = newRect;
}

-(CGFloat)height
{
    return self.frame.size.height;
}

-(void)setHeight:(CGFloat)height
{
    CGRect rect = self.frame;
    CGRect newRect = CGRectMake(rect.origin.x, rect.origin.y, rect.size.width, height);
    self.frame = newRect;
    
}
-(CGFloat)left
{
    return  self.frame.origin.x;
}
-(void)setLeft:(CGFloat)left
{
    CGRect rect = self.frame;
    CGRect newRect = CGRectMake(left, rect.origin.y, rect.size.width, rect.size.height);
    self.frame = newRect;
    
}


-(CGFloat)top
{
    return self.frame.origin.y;
}

-(void)setTop:(CGFloat)top
{
    CGRect rect = self.frame;
    CGRect newRect = CGRectMake(rect.origin.x, top, rect.size.width, rect.size.height);
    self.frame = newRect;
}
-(CGFloat)right
{
    return self.left+self.width;
}


-(CGFloat)bottom
{
    return self.top + self.height;
}

-(CGFloat)centerX
{
    return self.left + 0.5*self.width;
}
-(void)setCenterX:(CGFloat)centerX
{
    CGRect rect = self.frame;
    CGRect newRect = CGRectMake(centerX-0.5*self.width, rect.origin.y, rect.size.width, rect.size.height);
    self.frame = newRect;
}

-(CGFloat)centerY
{
    return self.top + 0.5*self.height;
}
-(void)setCenterY:(CGFloat)centerY
{
    CGRect rect = self.frame;
    CGRect newRect = CGRectMake(rect.origin.x, centerY-0.5*self.height, rect.size.width, rect.size.height);
    self.frame = newRect;
}

-(CGSize)size
{
    return self.frame.size;
}

-(void)setSize:(CGSize)size
{
    CGRect rect = self.frame;
    CGRect newRect = CGRectMake(rect.origin.x, rect.origin.y, size.width, size.height);
    self.frame = newRect;
}

-(CGPoint)origin
{
    return self.frame.origin;
}

-(void)setOrigin:(CGPoint)origin
{
    CGRect rect = self.frame;
    CGRect newRect = CGRectMake(origin.x, origin.y, rect.size.width, rect.size.height);
    self.frame = newRect;
}


- (void)setCornerRadius:(CGFloat)radius
{
    self.layer.cornerRadius = radius;
    self.layer.masksToBounds = YES;
    
}

- (void)setBorderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor
{
    self.layer.borderWidth = borderWidth;
    self.layer.borderColor = borderColor.CGColor;
}

- (void)setBtnForAPPStyleWithColor:(UIColor *)color
{
    self.backgroundColor = color;
    self.layer.cornerRadius = 3.0;
    self.layer.masksToBounds = YES;
}



@end
