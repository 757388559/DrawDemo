//
//  PlayCardView.m
//  DrawDemoTest
//
//  Created by liugangyi on 2016/12/16.
//  Copyright © 2016年 com.allinmd.cn. All rights reserved.
//

#import "PlayCardView.h"

@implementation PlayCardView

- (void)setFaceUp:(BOOL)faceUp {
    _faceUp = faceUp;
    [self setNeedsDisplay];
}

- (void)setRank:(NSString *)rank {
    
    _rank = rank;
    [self setNeedsDisplay];
}

- (void)setType:(NSString *)type {
    
    _type = type;
    [self setNeedsLayout];
}

- (void)awakeFromNib {
    
    [super awakeFromNib];
    self.backgroundColor = [UIColor cyanColor];
    self.opaque = NO;
    
}




// Only override drawRect: if you perform custom drawing.
- (void)drawRect:(CGRect)rect {
    
    [self drawCharactorCircleNature];
    
    [self drawLine];
}

// 圆圈字母图片
- (UIImage *)drawCharactorCircleNature {
    
    NSString *charactorStr = @"ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    UIGraphicsBeginImageContext(self.bounds.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGPoint center = self.center;
    CGFloat radius = center.x * .75;
    
    CGContextTranslateCTM(context, center.x, center.y);
    for (int i = 0; i < charactorStr.length; i++) {
        NSString *letter = [charactorStr substringWithRange:NSMakeRange(i, 1)];
        CGSize letterSize = [letter sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]}];
        CGFloat theta = i * (2 * M_PI / (float) 26);
        CGContextSaveGState(context);
        CGContextRotateCTM(context, theta);
        CGContextTranslateCTM(context, -letterSize.width/2, -radius);
        [letter drawAtPoint:CGPointMake(0, 0)
             withAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]}];
        CGContextRestoreGState(context);
    }
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    [self addSubview:[[UIImageView alloc] initWithImage:image]];
    return image;
}

// bitmapImage
- (void)drawBitmapImage:(CGRect)rect {
    
    CGColorSpaceRef colorRef = CGColorSpaceCreateDeviceRGB();
    if (colorRef == NULL) {
        NSLog(@"Error allocating color space");
        return;
    }
    CGContextRef context = CGBitmapContextCreate(NULL, 100, 60, 8, 100 *8, colorRef, (CGBitmapInfo) kCGImageAlphaPremultipliedFirst);
    if (context == NULL)
    {
        NSLog(@"Error: Context not created!"); CGColorSpaceRelease(colorRef); return;
    }
    
    // Push the context.
    // (This is optional. Read on for an explanation of this.)
    // UIGraphicsPushContext(context);
    
    
    // Perform drawing here
    CGContextSetLineWidth(context, 4);
    CGContextSetStrokeColorWithColor(context, [UIColor greenColor].CGColor);
    CGContextStrokeEllipseInRect(context, rect);
    
    // Balance the context push if used.
    // UIGraphicsPopContext();
    // Convert to image
    CGImageRef imageRef = CGBitmapContextCreateImage(context);
//    UIImage *image = [UIImage imageWithCGImage:imageRef];
    // Clean up
    CGColorSpaceRelease(colorRef);
    CGContextRelease(context);
    CFRelease(imageRef);

}

// 画边框
- (void)drawBoundswithRect:(CGRect)rect {
    
    
    // 1. 贝塞尔曲线
    // Drawing code
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:10];
    [bezierPath addClip];
    // 填充 rect
    [[UIColor orangeColor] setFill];
    //    [bezierPath fill];
    UIRectFill(rect);
    // 描边 rect
    [[UIColor blackColor] setStroke];
    [bezierPath stroke];
    
    // 2.context
    /*
     CGContextRef ctx = UIGraphicsGetCurrentContext();
     CGContextSetLineWidth(ctx, 4);
     CGContextSetStrokeColorWithColor(ctx, [UIColor greenColor].CGColor);
     CGContextStrokeEllipseInRect(ctx, rect);
     */
}

-(void)drawChangImage {
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    //保存初始状态
    CGContextSaveGState(context);
    
    //形变第一步：图形上下文向右平移50
    CGContextTranslateCTM(context, 50, 0);
    
    //形变第二步：缩放0.8
    CGContextScaleCTM(context, 0.8, 0.8);
    
    //形变第三步：旋转
    CGContextRotateCTM(context, M_PI_4);
    
    UIImage *image=[UIImage imageNamed:@"bg20161102.jpg"];
    [image drawInRect:CGRectMake(0, 50, 240, 300)];
    
    //恢复到初始状态
    CGContextRestoreGState(context);
    
}

- (void)drawLine {
    
    // 画线
    UIBezierPath *bezierPath = [[UIBezierPath alloc] init];
    [bezierPath moveToPoint:CGPointMake(20, 30)];
    [bezierPath addLineToPoint:CGPointMake(20, 100)];
    //    [bezierPath moveToPoint:CGPointMake(30, 100)];
    [bezierPath addLineToPoint:CGPointMake(100, 100)];
    [bezierPath addLineToPoint:CGPointMake(100, 30)];
    [bezierPath stroke];
    
}

// 画圆
- (void)drawCircle {
    
    UIBezierPath *clearPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2) radius:100 startAngle:0 endAngle:2*M_PI clockwise:NO];
    clearPath.lineWidth = 2;
    [[UIColor whiteColor] setFill];
    [clearPath fill];
    [[UIColor grayColor] setStroke];
    [clearPath stroke];
    
}

// 椭圆
- (void)drawTuoYuan {
    
    UIBezierPath *tuoYuan = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(10, 100, 100, 50)];
    [[UIColor grayColor] setStroke];
    [tuoYuan stroke];
    
}

// 做操作，平移 缩放 旋转
- (void)translateOrScaleOrRotate {
    
    // 做变形操作的时候有两种方法可以操作：
    // 1.直接创建贝塞尔曲线，在stroke 或者 fill之前，通过上下文进行相应的变换操作，否则不会出来相应的效果。因为图形在变换之前已经呈现在画布上了
    // 2.以贝塞尔曲线为辅助，进行对应的变换
    
    /**
     * 1.第一种方式进行变换操作
     */
    UIBezierPath *changePath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(20, 100, 50, 30) byRoundingCorners:UIRectCornerBottomLeft | UIRectCornerBottomRight cornerRadii:CGSizeMake(10, 10)];
    
    // 先进行相应的变换操作
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    // 旋转 旋转π的度数，也就是180° (按照坐标原点旋转的也就是(0,0))
    // CGContextRotateCTM(ctx, 0.2); 是按照z轴旋转的
    CGContextScaleCTM(ctx, 1.0, -1.0);
    CGContextTranslateCTM(ctx, 0, -140);
    [[UIColor whiteColor] setStroke];
    [changePath stroke];
}

- (void)dashLine {
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:0.0];
    [[UIColor colorWithRed:219/255.0 green:219/255.0 blue:219/255.0 alpha:1] setStroke];
    
    CGFloat dash[2] = {4,4};
    [path setLineDash:dash count:2 phase:0];
    
    [path stroke];
}

- (void)drawCorner {
    
    // 左上角
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    style.alignment = NSTextAlignmentCenter;
    UIFont *font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    NSString *tempStr = [NSString stringWithFormat:@"%@\n%@" , self.rank,self.type];
    
    NSAttributedString *attrStr = [[NSAttributedString alloc] initWithString:tempStr attributes:@{NSFontAttributeName:font , NSParagraphStyleAttributeName:style}];
    
    CGRect textBounds;
    textBounds.origin = CGPointMake(15, 10);
    textBounds.size = [attrStr size];
    [attrStr drawInRect:textBounds];
    
    // 右下角
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextTranslateCTM(context, self.bounds.size.width, self.bounds.size.height);
    CGContextRotateCTM(context, M_PI);
    [attrStr drawInRect:textBounds];

}


@end
