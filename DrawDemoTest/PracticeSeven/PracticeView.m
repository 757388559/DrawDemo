//
//  PracticeView.m
//  DrawDemoTest
//
//  Created by liugangyi on 2017/5/4.
//  Copyright © 2017年 com.allinmd.cn. All rights reserved.
//

#import "PracticeView.h"
#import "Gradient.h"
#import "UIImage+Customer.h"

@implementation PracticeView


- (void)awakeFromNib {
    
    [super awakeFromNib];
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGesture:)];
    [self addGestureRecognizer:pan];
    
    self.imageView.hidden = NO;
}

- (void)drawRect:(CGRect)rect {


    NSString *alertString = @"左右滑动滑块";
    [alertString drawAtPoint:CGPointMake(150, 20) withAttributes:nil];
    
    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint:CGPointMake(10, 50)];
    bezierPath.lineWidth = 2;
    [bezierPath addLineToPoint:CGPointMake(self.bounds.size.width - 10, 50)];
    
    CGFloat width = self.bounds.size.width - 20;
    CGFloat cY  = 47;
    
    for (int i = 0 ; i < 4; i++) {
        CGFloat cX = i * width / 3.0 + 9;
        UIBezierPath *circlePath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(cX, cY, 6, 6)];
        [circlePath fill:[UIColor blackColor]];
        [bezierPath appendPath:circlePath];
    }
    [bezierPath stroke];
    
    
    
}

- (void)panGesture:(UIGestureRecognizer *)sender {
    
    CGPoint currentPoint = [sender locationInView:self];
    
    if (!CGRectContainsPoint(CGRectMake(0, 30, self.bounds.size.width, 50), currentPoint)) {
        return;
    }
    switch (sender.state) {
        case UIGestureRecognizerStateBegan:
        {
            
        }
            break;
        case UIGestureRecognizerStateChanged:
        {
            
        }
            break;
        case UIGestureRecognizerStateEnded:
        {
            CGFloat widthE = self.bounds.size.width / 4.0;
            
            
            
            if (currentPoint.x < widthE) {
                
                self.imageView.frame = CGRectMake([self cX:0], 40, 20, 20);
            } else if (currentPoint.x < 2 *widthE) {
                self.imageView.frame = CGRectMake([self cX:1], 40, 20, 20);
            } else if (currentPoint.x < 3 *widthE) {
                self.imageView.frame = CGRectMake([self cX:2], 40, 20, 20);
            } else {
                self.imageView.frame = CGRectMake([self cX:3], 40, 20, 20);
            }
            
        }
            break;
        default:
            break;
    }
    
    
}

- (CGFloat)cX:(CGFloat)i {
    return (i * self.bounds.size.width / 3.0 + 9);
}

- (UIImageView *)imageView {
    
    if (!_imageView) {
        
        UIImage *image = [UIImage circleImage:[UIImage imageNamed:@"bg20161102.jpg"] targetSize:CGSizeMake(20, 20)];
        _imageView = [[UIImageView alloc] initWithImage:image];
        _imageView.frame = CGRectMake( 9, 40, 20, 20);
        [self addSubview:_imageView];
    }
    return _imageView;
}

@end
