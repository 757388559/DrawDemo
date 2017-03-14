//
//  BezierPath.m
//  DrawDemoTest
//
//  Created by liugangyi on 2017/3/13.
//  Copyright © 2017年 com.allinmd.cn. All rights reserved.
//

#import "BezierPath.h"

@implementation BezierPath


- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    [self createALaughFace:CGRectMake(20, rect.origin.x+rect.size.height/4, 300, 300)];
    
}


- (void)createALaughFace:(CGRect)rect {
    
    CGRect fullRect = (CGRect){.size = rect.size};
    
    // Establish a new path
    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    
    // Create the face outline add append it to the path
    CGRect inset = CGRectInset(fullRect, 40, 40);
    UIBezierPath *faceOutline = [UIBezierPath bezierPathWithOvalInRect:inset];
    [bezierPath appendPath:faceOutline];
    
    // Move in again ,for the mouths and eyes
    CGRect insetAgain = CGRectInset(inset, 80, 80);
    
    // Caculate a radius
    CGPoint refrencePoint = CGPointMake(CGRectGetMinX(insetAgain), CGRectGetMaxY(insetAgain));
    CGPoint center = RectGetCenter(insetAgain);
    CGFloat radius = sqrt(pow(refrencePoint.x-center.x, 2) + pow(refrencePoint.y-center.y , 2));
    
    // Add a smile 40 degrees around to 140 degrees
    UIBezierPath *smile = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:140/180.0 * M_PI endAngle:M_PI*40/180 clockwise:NO];
    [bezierPath appendPath:smile];
    
    // Build Eye1
    CGPoint p1 = CGPointMake(CGRectGetMinX(insetAgain), CGRectGetMinY(insetAgain));
    CGRect eyeRect1 = RectAroundCenter(p1, CGSizeMake(20, 20));
    UIBezierPath *eye1 = [UIBezierPath bezierPathWithRect:eyeRect1]; [bezierPath appendPath:eye1];
    
    // Build Eye2
    CGPoint p2 = CGPointMake(CGRectGetMaxX(insetAgain),CGRectGetMinY(insetAgain));
    CGRect eyeRect2 = RectAroundCenter(p2, CGSizeMake(20, 20));
    UIBezierPath *eye2 = [UIBezierPath bezierPathWithRect:eyeRect2]; [bezierPath appendPath:eye2];
    // Draw the complete path
    bezierPath.lineWidth = 4;
    [bezierPath stroke];
    
}



@end
