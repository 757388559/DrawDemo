//
//  CGRectCatagery.h
//  DrawDemoTest
//
//  Created by liugangyi on 2017/3/13.
//  Copyright © 2017年 com.allinmd.cn. All rights reserved.
//


#ifndef CGGeometryCatagery_h
#define CGGeometryCatagery_h
#import <UIKit/UIGeometry.h>
#include <stdio.h>

// Undefined point
#define NULLPOINT                  CGRectNull.origin
#define POINT_IS_NULL(_POINT_)     CGPointEqualToPoint(_POINT_, NULLPOINT)

// General
#define RECTSTRING(_aRect_)        NSStringFromCGRect(_aRect_)
#define POINTSTRING(_aPoint_)      NSStringFromCGPoint(_aPoint_)
#define SIZESTRING(_aSize_)        NSStringFromCGSize(_aSize_)

#define RECT_WITH_SIZE(_SIZE_)     (CGRect){.size = _SIZE_}
#define RECT_WITH_POINT(_POINT_)   (CGRect){.origin = _POINT_}

// Conversion
CGFloat DegreesFromRadians(CGFloat radians);
CGFloat RadiansFromDegrees(CGFloat degrees);

// General Geometry
CGFloat PointDistanceFromPoint(CGPoint p1, CGPoint p2);
CGPoint PointAddPoint(CGPoint p1, CGPoint p2);
CGPoint PointSubtractPoint(CGPoint p1, CGPoint p2);

/**
 通过原点的大小生成CGRect
 
 @param origin 原点
 @param size 大小
 @return rect
 */
CGRect RectMakeWithOrigin(CGPoint origin ,CGSize size);

/**
 默认为(0,0)原点的矩形
 
 @param tagetSize 目标尺寸
 @return 矩形
 */
CGRect SizeMakeRect(CGSize tagetSize);

/**
 获取一个rect的中心点
 
 @param rect Rect
 @return 中心点
 */
CGPoint RectGetCenter(CGRect rect);

/**
 中心点和大小生成一个Rect
 
 @param center 中心点
 @param size 大小Size
 @return 矩形Rect
 */
CGRect RectAroundCenter(CGPoint center ,CGSize size);

/**
 同心Rect（类似同心圆）
 
 @param rect 给定的矩形
 @param mainRect 原始Rect(以他中心点为准)
 @return 同心矩形
 */
CGRect RectCenteredInRect(CGRect rect ,CGRect mainRect);
// scaled

/**
 scale size
 
 @param size source size
 @param factor 缩放因子
 @return 缩放之后的size
 */
CGSize SizeScaleByFactor (CGSize size ,CGFloat factor);

/**
 scale one Rect
 
 @param scale 缩放比例
 @param sourceRect Source Rect
 @return new scaled Rect
 */
CGRect RectByScale (CGFloat scale ,CGRect sourceRect);


// ------- fitting -------

/**
 Calculate scale for fitting a size to a destination
 
 @param sourceSize 给定size
 @param destRect 目标矩形
 @return 缩放比例
 */
CGFloat AspectScaleFit (CGSize sourceSize ,CGRect destRect);

/**
 fitting a rect
 
 @param sourceRect 给定矩形
 @param destRect 目标矩形
 @return a rect fitting source to destination
 */
CGRect RectByFittingInRect (CGRect sourceRect , CGRect destRect);

// ------- filling --------

/**
 Calculate scale for filling a destination
 
 @param sourceSize 给定的尺寸
 @param destRect 填充的矩形
 @return a scale
 */
CGFloat AspectScaleFill (CGSize sourceSize ,CGRect destRect);

/**
 Return a rect that fills the destination
 
 @param sourceRect source rect
 @param destRect destination rect
 @return  a rect that fills the destination
 */
CGRect RectByFillingRect (CGRect sourceRect ,CGRect destRect);
// insets

/**
 bulid insets for rect
 
 @param alignmentRect aligned rect
 @param sourceRect source Rect
 @return <#return value description#>
 */
UIEdgeInsets RectBuildInsetsWithAlignRect (CGRect alignmentRect ,CGRect sourceRect);


#endif /* CGRectCatagery_h */



