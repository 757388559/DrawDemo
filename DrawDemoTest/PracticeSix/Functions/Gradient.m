
//
//  Gradient.m
//  DrawDemoTest
//
//  Created by liugangyi on 2017/5/4.
//  Copyright © 2017年 com.allinmd.cn. All rights reserved.
//

#import "Gradient.h"

@implementation Gradient

- (CGGradientRef)gradient {
    
    return _storedGradient;
}

+ (instancetype)gradientWithColors:(NSArray *)colorsArray locations:(NSArray *)locationArray {
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    if (colorSpace == NULL) {
        NSLog(@"Error：Unable to create RGB color space");
        return nil;
    }
    // Convert NSNumber *locations array to CGFloat *
    CGFloat locations[locationArray.count];
    for (int i = 0; i < locationArray.count; i++)
        locations[i] = fminf(fmaxf([locationArray[i] floatValue], 0), 1);
    
    // Convert colors array to (id) CGColorRef
    NSMutableArray *colorRefArray = [NSMutableArray array];
    for (UIColor *color in colorsArray)
        [colorRefArray addObject:(id)color.CGColor];
    
    // Build the internal gradient
    CGGradientRef gradientRef = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef) colorRefArray, locations);
    CGColorSpaceRelease(colorSpace);
    if (gradientRef == NULL) {
        NSLog(@"Error：Unable to create CGGradientRef");
        return nil;
    }
    
    // Build the wrapper, store the gradient , and return
    Gradient *gradient = [[self alloc] init];
    gradient.storedGradient = gradientRef;
    CGGradientRelease(gradientRef);
    
    return gradient;
}

+ (instancetype)gradientFrom:(UIColor *)color1 to:(UIColor *)color2 {
    
    return [self gradientWithColors:@[color1,color2] locations:@[@0 , @1]];
}


- (void)drawFromPoint:(CGPoint)startPoint toPoint:(CGPoint)endPoint style:(int)mask {
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    if (context == NULL) {
        NSLog(@"Error：NO context to draw");
        return;
    }
    
    CGContextDrawLinearGradient(context, [self gradient], startPoint, endPoint, mask);
}

- (void)drawRadialFromPoint:(CGPoint)startPoint toPoint:(CGPoint)endPoint raidus:(CGPoint)radiusPoint style:(int)mask {
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    if (context == NULL) {
        NSLog(@"Error：NO context to draw");
        return;
    }
    
    CGContextDrawRadialGradient(context, [self gradient], startPoint, radiusPoint.x, endPoint, radiusPoint.y, mask);
}


@end
