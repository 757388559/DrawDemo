
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

    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"hello world" forState:UIControlStateNormal];
    button.frame = CGRectMake(0, 0, 100, 30);
    [self addSubview:button];
    
    Gradient *gradient = [Gradient gradientColorFrom:White_Levels(.5, 1) to:White_Levels(.5, 1)];
    [gradient drawTopToBottom:CGRectMake(0, 0, 100, 15)];
    Gradient *gradient1 = [Gradient gradientColorFrom:White_Levels(.2, 1) to:White_Levels(.2, 1)];
    [gradient1 drawTopToBottom:CGRectMake(0, 15, 100, 15)];
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
        return EaseInOut(scaled, 2);
        return EaseOut(scaled, 2);
        return EaseIn(scaled, 2);
    };
    
    Gradient *gra = [Gradient gradientUsingInterpolationBlock:block betweenColor:White_Levels(0, 0) andColor:White_Levels(0, 1)];
    CGContextDrawRadialGradient(UIGraphicsGetCurrentContext(), gra.gradient, CGPointMake(150, 150) , 0, CGPointMake(150, 150), 100 , 0);
}

#pragma mark - Flipping Gradient (3D Effects)

- (void)flipGradient {
    
    CGRect outerRect = CGRectMake(10, 10, 300, 300);
    CGRect innerRect = CGRectInset(outerRect, 30, 30);
    
    // 圆形
    UIBezierPath *outerPath = [UIBezierPath bezierPathWithOvalInRect:outerRect];
    UIBezierPath *innerPath = [UIBezierPath bezierPathWithOvalInRect:innerRect];
    // 圆角矩形
    outerPath = [UIBezierPath bezierPathWithRoundedRect:outerRect cornerRadius:4];
    innerPath = [UIBezierPath bezierPathWithRoundedRect:innerRect cornerRadius:4];
    
    Gradient *gradient = [Gradient gradientColorFrom:White_Levels(.66, 1) to:White_Levels(.33, 1)];
    PushDraw(^{
        [outerPath addClip];
        [gradient drawTopToBottom:outerRect];
    });
    PushDraw(^{
        [innerPath addClip];
        [gradient drawBottomToTop:innerRect];
    });
    DrawInnerShadow(innerPath, White_Levels(0.0, .5f), CGSizeMake(0, 2), 2);

    
    // Mix linear and Radial Gradient
    CGRect insetRect = CGRectInset(innerRect, 2, 2);
    UIBezierPath *bluePath = [UIBezierPath bezierPathWithOvalInRect:insetRect];
    // Produce an ease-in-out gradient
    InterpolationBlock block = ^CGFloat (CGFloat percent) {
        CGFloat skippingPercent = 0.75;
        if (percent < skippingPercent) return 0;
        CGFloat scaled = (percent - skippingPercent) * (1 / (1 - skippingPercent));
        return EaseInOut(scaled, 1);
    };
    Gradient *blueGradient = [Gradient gradientUsingInterpolationBlock:block betweenColor:[UIColor colorWithRed:135 green:206 blue:235 alpha:1] andColor:[UIColor colorWithRed:0 green:191 blue:255 alpha:1]];
    
    // Draw raidal gradient
    CGPoint center = RectGetCenter(insetRect);
    CGPoint topRight = CGPointMake(insetRect.origin.x + insetRect.size.width, insetRect.origin.y);
    CGFloat width = PointDistanceFromPoint(center, topRight);
    
    PushDraw(^{
        [bluePath addClip];
        CGContextDrawRadialGradient(UIGraphicsGetCurrentContext(), blueGradient.gradient, center, 0, center, width, 0);
    });
}

#pragma mark - Drawing Gradients On Path Edges

- (void)pathOnEdges {
    
    // Create a path
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(20, 20, 200, 200)];
    // 设置虚线
    [path addDashes];
    // 复制Path (原路径正好在复制的路径的正中间)
    CGPathRef pathRef = CGPathCreateCopyByStrokingPath(path.CGPath, NULL, 15, kCGLineCapButt, kCGLineJoinMiter, 4);
    UIBezierPath *copyPath = [UIBezierPath bezierPathWithCGPath:pathRef];
    CGPathRelease(pathRef);
    // 剪切，防止渐变色溢出
    [copyPath addClip];
    // 做渐变
    Gradient *gradient = [Gradient gradientColorFrom:[UIColor orangeColor] to:[UIColor purpleColor]];
    [gradient drawTopToBottom:self.bounds];
    // 画原路径，可以做清洗的比较
    [path stroke];
}



@end
