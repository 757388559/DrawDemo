//
//  UIView+CGRect.m
//  DrawDemoTest
//
//  Created by liugangyi on 2017/2/10.
//  Copyright © 2017年 com.allinmd.cn. All rights reserved.
//

#import "UIView+CGRect.h"

@implementation UIView (CGRect)


+ (CGRect)rectMakeRect:(CGPoint)origin size:(CGSize)size {
    
    return CGRectMake(origin.x, origin.y, size.width, size.height);
}

+ (CGRect)sizeMakeRect:(CGSize)tagetSize {
    
    return CGRectMake(0, 0, tagetSize.width, tagetSize.height);
}

+ (CGPoint)rectGetCenter:(CGRect)rect {
    
    if (CGRectEqualToRect(rect, CGRectNull) || CGRectEqualToRect(rect, CGRectZero)) {
        return CGPointZero;
    }
    
    return CGPointMake(CGRectGetMidX(rect), CGRectGetMidY(rect));
}

+ (CGRect)rectAroundCenter:(CGPoint)center size:(CGSize)size {
    
    CGFloat originX = center.x - size.width/2;
    CGFloat originY = center.y - size.height/2;
    
    CGPoint origin = CGPointMake(originX,originY);
    
    return [self rectMakeRect:origin size:size];
}

+ (CGRect)rectCenteredInRect:(CGRect)rect mainRect:(CGRect)mainRect {
    
    CGPoint sourceCenter = [self rectGetCenter:rect];
    CGPoint destCenter = [self rectGetCenter:mainRect];
    
    CGFloat dx = destCenter.x - sourceCenter.x;
    CGFloat dy = destCenter.y - sourceCenter.y;
    
    return CGRectOffset(rect, dx, dy);
}


// fit

/**
 缩放

 @param size 给定的size
 @param factor 缩放因子(倍数)
 @return 缩放之后的size
 */
+ (CGSize)sizeScaleByFactor:(CGSize)size factor:(CGFloat)factor {
    
    return CGSizeMake(size.width * factor, size.height * factor);
}


/**
 fitting a size to a destination

 @param sourceSize 给定size
 @param destRect 目标矩形
 @return 缩放比例 factor
 */
+ (CGFloat)aspectScaleFit:(CGSize)sourceSize destRect:(CGRect)destRect {
    
    CGFloat widthScale = sourceSize.width / CGRectGetWidth(destRect);
    CGFloat heightScale = sourceSize.height / CGRectGetHeight(destRect);
    
    CGFloat factor = MIN(widthScale, heightScale);
    
    return factor;
}


/**
 fitting a rect

 @param sourceRect 给定矩形
 @param destRect 目标矩形
 @return a rect fitting source to destination
 */
+ (CGRect)rectByFittingInRect:(CGRect)sourceRect destRect:(CGRect)destRect {
    
    CGFloat factor = [self aspectScaleFit:sourceRect.size destRect:destRect];
    CGSize fitSize = [self sizeScaleByFactor:sourceRect.size factor:factor];
    CGPoint center = [self rectGetCenter:destRect];
    
    return [self rectAroundCenter:center size:fitSize];
}

// filling

+ (CGFloat)aspectScaleFill:(CGSize)sourceSize destRect:(CGRect)destRect {
    
    CGSize destSize = destRect.size;
    CGFloat widthScale = destSize.width / sourceSize.width;
    CGFloat heightScale = destSize.width / sourceSize.width;
    
    CGFloat factor = MAX(widthScale, heightScale);
    
    return factor;
}


+ (CGRect)rectByFillingRect:(CGRect)sourceRect destRect:(CGRect)destRect {
    
    CGPoint center = [self rectGetCenter:destRect];
    
    CGFloat factor = [self aspectScaleFill:sourceRect.size destRect:destRect];
    
    CGSize fillingSize = [self sizeScaleByFactor:sourceRect.size factor:factor];
    CGRect rect = [self rectAroundCenter:center size:fillingSize];
    return rect;
}




@end
