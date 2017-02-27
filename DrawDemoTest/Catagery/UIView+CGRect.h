//
//  UIView+CGRect.h
//  DrawDemoTest
//
//  Created by liugangyi on 2017/2/10.
//  Copyright © 2017年 com.allinmd.cn. All rights reserved.
//


#import <UIKit/UIKit.h>

@interface UIView (CGRect)


/**
 通过原点的大小生成CGRect

 @param origin 原点
 @param size 大小
 @return rect
 */
+ (CGRect)rectMakeRect:(CGPoint)origin size:(CGSize)size;


/**
 默认为(0,0)原点的矩形

 @param tagetSize 目标尺寸
 @return 矩形
 */
+ (CGRect)sizeMakeRect:(CGSize)tagetSize;

/**
 获取一个rect的中心点

 @param rect Rect
 @return 中心点
 */
+ (CGPoint)rectGetCenter:(CGRect)rect;

/**
 中心点和大小生成一个Rect

 @param center 中心点
 @param size 大小Size
 @return 矩形Rect
 */
+ (CGRect)rectAroundCenter:(CGPoint)center size:(CGSize)size;

/**
 同心Rect（类似同心圆）

 @param rect 给定的矩形
 @param mainRect 原始Rect(以他中心点为准)
 @return 同心矩形
 */
+ (CGRect)rectCenteredInRect:(CGRect)rect mainRect:(CGRect)mainRect;

// ------- fitting -------

/**
 Calculate scale for fitting a size to a destination
 
 @param sourceSize 给定size
 @param destRect 目标矩形
 @return 缩放比例
 */
+ (CGFloat)aspectScaleFit:(CGSize)sourceSize destRect:(CGRect)destRect;

/**
 缩放尺寸
 
 @param size 给定的size
 @param factor 缩放因子
 @return 缩放之后的size
 */
+ (CGSize)sizeScaleByFactor:(CGSize)size factor:(CGFloat)factor;

/**
 fitting a rect
 
 @param sourceRect 给定矩形
 @param destRect 目标矩形
 @return a rect fitting source to destination
 */
+ (CGRect)rectByFittingInRect:(CGRect)sourceRect destRect:(CGRect)destRect;


// ------- filling --------

/**
 Calculate scale for filling a destination

 @param sourceSize 给定的尺寸
 @param destRect 填充的矩形
 @return a scale
 */
+ (CGFloat)aspectScaleFill:(CGSize)sourceSize destRect:(CGRect)destRect;

/**
 Return a rect that fills the destination

 @param sourceRect source rect
 @param destRect destination rect
 @return  a rect that fills the destination
 */
+ (CGRect)rectByFillingRect:(CGRect)sourceRect destRect:(CGRect)destRect;



@end
