
//
//  PracticeSixView.m
//  DrawDemoTest
//
//  Created by liugangyi on 2017/5/4.
//  Copyright © 2017年 com.allinmd.cn. All rights reserved.
//

#import "PracticeSixView.h"
#import "Gradient.h"


@implementation PracticeSixView


- (void)drawRect:(CGRect)rect {
    
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, 300, 300)];
    path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(150, 150) radius:100 startAngle:0 endAngle:M_PI * 2 clockwise:YES];
//    CGPoint p1 = RectGetPointAtPercents(path.bounds, .5, .5);
//    CGPoint p2 = RectGetPointAtPercents(path.bounds, .7, .5);
    
    [path fill:[UIColor greenColor]];
//    [path addClip];
//    [grandient drawLinerFromPoint:p1 toPoint:p2];
    

    

}

#pragma mark - Ease Test

- (void)easeTest {
    
    
//    InterpolationBlock block =  ^CGFloat(CGFloat percent) {
//        CGFloat skippingPercent = 0.75;
//        if (percent < skippingPercent) return 0;
//        
//        CGFloat scaled = (percent - skippingPercent) * (1 / (1 - skippingPercent));
//        return cosf(scaled * M_PI);
//        return sinf(scaled * M_PI);
//    };
    
    
    InterpolationBlock block = ^CGFloat (CGFloat percent) {
        CGFloat skippingPercent = 0.5;
        if (percent < skippingPercent) return 0;
        CGFloat scaled = (percent - skippingPercent) * (1 / (1 - skippingPercent));
        return EaseInOut(scaled, 3);
        return EaseOut(scaled, 3);
        return EaseIn(scaled, 3);
    };
    
    Gradient *gra = [Gradient gradientUsingInterpolationBlock:block betweenColor:White_Levels(0, 0) andColor:White_Levels(0, 1)];
    CGContextDrawRadialGradient(UIGraphicsGetCurrentContext(), gra.gradient, CGPointMake(150, 150) , 0, CGPointMake(150, 150), 100 , 0);
}


@end
