//
//  Gradient.h
//  DrawDemoTest
//
//  Created by liugangyi on 2017/5/4.
//  Copyright © 2017年 com.allinmd.cn. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef __attribute__((NSObject)) CGGradientRef GradientObject;

@interface Gradient : NSObject

/// <#Description#>.
@property (nonatomic , strong)  GradientObject storedGradient;


+ (instancetype)gradientWithColors:(NSArray *)colorsArray locations:(NSArray *)locationArray;

/**
 创建渐变实例

 @param color1 颜色1
 @param color2 颜色2
 @return Gradient
 */
+ (instancetype)gradientFrom:(UIColor *)color1 to:(UIColor *)color2;

/**
 线性渐变
 
 @param startPoint 开始点
 @param endPoint 结束点
 @param mask 相当于CGGradientDrawingOptions
 */
- (void)drawFromPoint:(CGPoint)startPoint toPoint:(CGPoint)endPoint style:(int)mask;

/**
 辐射渐变

 @param startPoint 开始点
 @param endPoint 结束点
 @param mask 相当于CGGradientDrawingOptions
 */
- (void)drawRadialFromPoint:(CGPoint)startPoint toPoint:(CGPoint)endPoint raidus:(CGPoint)radiusPoint style:(int)mask;



@end
