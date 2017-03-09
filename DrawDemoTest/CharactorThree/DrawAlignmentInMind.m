//
//  DrawAlignmentInMind.m
//  DrawDemoTest
//
//  Created by liugangyi on 2017/3/9.
//  Copyright © 2017年 com.allinmd.cn. All rights reserved.
//

#import "DrawAlignmentInMind.h"
#import "UIView+CGRect.h"

@implementation DrawAlignmentInMind

- (void)drawRect:(CGRect)rect {
    // Drawing code
    
   
    
}

// 3-9练习
- (UIImage *)buildInsets:(CGRect)targetRect {
    
    UIBezierPath *path;
    // Begin the image context
    UIGraphicsBeginImageContextWithOptions(targetRect.size, NO, 1.0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // Fill the background of the image and outline it
    [[UIColor grayColor] setFill];
    UIRectFill(targetRect);
    path = [UIBezierPath bezierPathWithRect:targetRect];
    [path setLineWidth:2];
    [path stroke];
    
    // Fit bunny into a inset , offset rectangle
    CGRect destinationRect = [UIView rectByScale:.25 sourceRect:targetRect];
    destinationRect.origin.x = 0;
    UIBezierPath *bunny ;
//    [[UIBezierPath bunnyPath] pathWithinRect:destinationRect];
    
    // Add a shadow to the context and draw the bunny
    CGContextSaveGState(context);
    CGContextSetShadow(context, CGSizeMake(6,6), 4);
    [[UIColor greenColor] setFill];
    [bunny fill]; CGContextRestoreGState(context);
    
    // Outline bunny's bounds, which are the alignment rect
    CGRect alignmentRect = bunny.bounds;
    path = [UIBezierPath bezierPathWithRect:alignmentRect];
    [[UIColor darkGrayColor] setStroke];
    [path setLineWidth:2];
    [path stroke];
    
    // Add a red badge at the top-right corner
    UIBezierPath *badge;
//    = [[UIBezierPath badgePath] pathWithinRect:CGRectMake(0, 0, 40, 40)];
//    badge = [badge pathMoveCenterToPoint:RectGetTopRight(bunny.bounds)];

    [[UIColor redColor] setFill];
    [badge fill];
    
    // Retrieve the initial image
    UIImage *initialImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    // Build and apply the insets
    UIEdgeInsets insets = [UIView rectBuildInsetsWithAlignRect:alignmentRect sourceRect:targetRect];
    UIImage *image = [initialImage imageWithAlignmentRectInsets:insets];
    return image;
}



@end
