//
//  Gradient.h
//  DrawDemoTest
//
//  Created by liugangyi on 2017/5/4.
//  Copyright © 2017年 com.allinmd.cn. All rights reserved.
//

#import <Foundation/Foundation.h>

#define White_Levels(_awt_,_alpha_) [UIColor colorWithWhite:(_awt_) alpha:(_alpha_)]

typedef __attribute__((NSObject)) CGGradientRef GradientObject;
typedef CGFloat(^InterpolationBlock)(CGFloat);


@interface Gradient : NSObject

/// <#Description#>.
@property (nonatomic , strong)  GradientObject gradient;


+ (instancetype)gradientWithColors:(NSArray *)colorsArray locations:(NSArray *)locationArray;

/**
 创建渐变实例

 @param color1 颜色1
 @param color2 颜色2
 @return Gradient
 */
+ (instancetype)gradientColorFrom:(UIColor *)color1 to:(UIColor *)color2;

/**
 线性渐变

 @param startPoint 开始点
 @param endPoint 结束点
 */
- (void)drawLinerFromPoint:(CGPoint)startPoint toPoint:(CGPoint)endPoint;

/**
 线性渐变
 
 @param startPoint 开始点
 @param endPoint 结束点
 @param mask 相当于CGGradientDrawingOptions
 */
- (void)drawLinerFromPoint:(CGPoint)startPoint toPoint:(CGPoint)endPoint style:(int)mask;

/**
 辐射渐变

 @param startPoint 开始点
 @param endPoint 结束点
 @param mask 相当于CGGradientDrawingOptions
 */
- (void)drawRadialFromPoint:(CGPoint)startPoint toPoint:(CGPoint)endPoint raidus:(CGPoint)radiusPoint style:(int)mask;


+ (Gradient *)gradientUsingInterpolationBlock:(InterpolationBlock)block betweenColor:(UIColor *)color1 andColor:(UIColor *)color2;

/**
 线性渐变从上到下

 @param rect 目标矩形
 */
- (void)drawTopToBottom:(CGRect)rect;

/**
 线性渐变从下到上

 @param rect 目标矩形
 */
- (void)drawBottomToTop:(CGRect)rect;


@end


UIColor * InterploateBetweenColors(UIColor *color1 , UIColor *color2 ,CGFloat amt);
#pragma mark - Easing Functions
// Ease only the begin
CGFloat EaseIn(CGFloat currentTime , int factor);
// Ease only the end
CGFloat EaseOut(CGFloat currentTime , int factor);
// Ease both beginning and end
CGFloat EaseInOut(CGFloat currentTime, int factor);
// Change color brightness
UIColor *ScaleColorBrightness(UIColor *color , CGFloat amount);
//
void DrawStrokedShadowedShape(UIBezierPath *path, UIColor *baseColor, CGRect dest);
//
void DrawGradientOverTexture(UIBezierPath *path, UIImage *texture, Gradient *gradient, CGFloat alpha);





