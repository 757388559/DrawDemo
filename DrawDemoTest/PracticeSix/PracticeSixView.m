
//
//  PracticeSixView.m
//  DrawDemoTest
//
//  Created by liugangyi on 2017/5/4.
//  Copyright © 2017年 com.allinmd.cn. All rights reserved.
//

#import "PracticeSixView.h"

@implementation PracticeSixView


- (void)drawRect:(CGRect)rect {
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, 300, 300)];
    [path addClip];
    
    CGColorSpaceRef colSpaceRef = CGColorSpaceCreateDeviceRGB();
    NSArray *arr = @[(id)[UIColor greenColor].CGColor , (id)[UIColor orangeColor].CGColor];
    CGFloat locations[2];
    locations[0] = 0;
    locations[1] = 1;
//    locations[2] = 1;
//    locations[3] = 1;
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGGradientRef gradientRef = CGGradientCreateWithColors(colSpaceRef, (__bridge CFArrayRef) arr, locations);
    
//    CGContextDrawLinearGradient(context, gradientRef, CGPointMake(0, 0), CGPointMake(300, 0), 0);
    
    CGContextDrawRadialGradient(context, gradientRef, CGPointMake(30, 30), 20, CGPointMake(150, 150), 50, 0);
}


@end
