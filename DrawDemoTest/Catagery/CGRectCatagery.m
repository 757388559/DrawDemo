//
//  CGRectCatagery.c
//  DrawDemoTest
//
//  Created by liugangyi on 2017/3/13.
//  Copyright © 2017年 com.allinmd.cn. All rights reserved.
//

#include "CGRectCatagery.h"

CGRect RectMakeWithOrigin(CGPoint origin ,CGSize size) {
    return CGRectMake(origin.x, origin.y, size.width, size.height);
}

CGRect SizeMakeRect(CGSize tagetSize) {
    return CGRectMake(0, 0, tagetSize.width, tagetSize.height);
}

CGPoint RectGetCenter(CGRect rect) {
    
    if (CGRectEqualToRect(rect, CGRectNull) || CGRectEqualToRect(rect, CGRectZero)) {
        return CGPointZero;
    }
    return CGPointMake(CGRectGetMidX(rect), CGRectGetMidY(rect));
}

CGRect RectAroundCenter(CGPoint center ,CGSize size) {
    
    CGFloat originX = center.x - size.width/2;
    CGFloat originY = center.y - size.height/2;
    
    CGPoint origin = CGPointMake(originX,originY);
    return RectMakeWithOrigin(origin, size);
}

CGRect RectCenteredInRect(CGRect rect ,CGRect mainRect) {
    
    CGPoint sourceCenter = RectGetCenter(rect);
    CGPoint destCenter = RectGetCenter(mainRect);
    
    CGFloat dx = destCenter.x - sourceCenter.x;
    CGFloat dy = destCenter.y - sourceCenter.y;
    
    return CGRectOffset(rect, dx, dy);
}


// scaled

CGSize SizeScaleByFactor (CGSize size ,CGFloat factor) {
    return CGSizeMake(size.width * factor, size.height * factor);
}

CGRect RectByScale (CGFloat scale ,CGRect sourceRect) {
    
    CGSize destSize = CGSizeMake(sourceRect.size.width*scale, sourceRect.size.height*scale);
    return RectMakeWithOrigin(sourceRect.origin, destSize);
}

// fit

CGFloat AspectScaleFit (CGSize sourceSize ,CGRect destRect) {
    
    CGFloat widthScale = sourceSize.width / CGRectGetWidth(destRect);
    CGFloat heightScale = sourceSize.height / CGRectGetHeight(destRect);
    
    CGFloat factor = MIN(widthScale, heightScale);
    
    return factor;
}

CGRect RectByFittingInRect (CGRect sourceRect , CGRect destRect) {
    
    CGFloat factor = AspectScaleFit(sourceRect.size, destRect);
    CGSize fitSize = SizeScaleByFactor(sourceRect.size, factor);
    CGPoint center = RectGetCenter(destRect);
    
    return RectAroundCenter(center, fitSize);
}

// filling
CGFloat AspectScaleFill (CGSize sourceSize ,CGRect destRect) {
    
    CGSize destSize = destRect.size;
    CGFloat widthScale = destSize.width / sourceSize.width;
    CGFloat heightScale = destSize.width / sourceSize.width;
    CGFloat factor = MAX(widthScale, heightScale);
    
    return factor;
}


CGRect RectByFillingRect (CGRect sourceRect ,CGRect destRect) {
    
    CGPoint center = RectGetCenter(destRect);
    
    CGFloat factor = AspectScaleFill(sourceRect.size, destRect);
    CGSize fillingSize = SizeScaleByFactor(sourceRect.size , factor);
    CGRect rect = RectAroundCenter(center, fillingSize);
    return rect;
}


UIEdgeInsets RectBuildInsetsWithAlignRect (CGRect alignmentRect ,CGRect sourceRect) {
    
    // Ensure alignment rect is fully within source rect
    CGRect targetRect = CGRectIntersection(alignmentRect, sourceRect);
    // Caculate insets
    UIEdgeInsets insets;
    insets.top = CGRectGetMinY(targetRect) - CGRectGetMinY(sourceRect);
    insets.left = CGRectGetMinX(targetRect) - CGRectGetMinX(sourceRect);
    insets.bottom = CGRectGetMaxY(sourceRect) - CGRectGetMaxY(targetRect);
    insets.right = CGRectGetMaxX(sourceRect) - CGRectGetMaxX(targetRect);
    return insets;
}
