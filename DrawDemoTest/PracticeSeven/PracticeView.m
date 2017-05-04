//
//  PracticeView.m
//  DrawDemoTest
//
//  Created by liugangyi on 2017/5/4.
//  Copyright © 2017年 com.allinmd.cn. All rights reserved.
//

#import "PracticeView.h"

@implementation PracticeView


- (void)drawRect:(CGRect)rect {
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    CGRect rect1 = CGRectMake(100, 100, 100, 100);
    UIBezierPath *path1 = [UIBezierPath bezierPathWithOvalInRect:rect1];
    [path appendPath:path1];
    CGRect rect2 = CGRectInset(rect1, -50, -50);
    UIBezierPath *path2 = [UIBezierPath bezierPathWithOvalInRect:rect2];
    [path appendPath:path2];
    path.usesEvenOddFillRule = YES;
    [path addClip];
    
    UIImage *image = [UIImage imageNamed:@"bg20161102.jpg"];
    [image drawInRect:rect2];
}

@end
