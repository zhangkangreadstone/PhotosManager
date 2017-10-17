//
//  UIView+Frame.h
//  PhotosDemo
//
//  Created by LSH on 2017/10/17.
//  Copyright © 2017年 ZhangKang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Frame)

@property (nonatomic, assign)CGFloat width;

@property (nonatomic, assign)CGFloat height;

@property (nonatomic, assign)CGFloat top;

@property (nonatomic, assign)CGFloat bottom;

@property (nonatomic, assign)CGFloat left;

@property (nonatomic, assign)CGFloat right;

@property (nonatomic, assign)CGFloat centerX;

@property (nonatomic, assign)CGFloat centerY;

@property (nonatomic, assign)CGSize size;

@property (nonatomic, assign)CGPoint origin;

- (void)setCornerRadius:(CGFloat)radius;
- (void)setBtnForAPPStyle;
- (void)setBtnForAPPStyleWithColor:(UIColor *)color;
- (void)setBorderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor;

@end
