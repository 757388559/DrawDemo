//
//  Draw-Block.m
//  DrawDemoTest
//
//  Created by liugangyi on 2017/4/23.
//  Copyright © 2017年 com.allinmd.cn. All rights reserved.
//

#import "Draw-Block.h"

UIImage *ImageWithBlock(DrawingBlock block, CGSize size)
{
    UIGraphicsBeginImageContextWithOptions(size, NO, 0.0);
    if (block) block((CGRect){.size = size});
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

UIImage *DrawIntoImage(CGSize size , DrawingStateBlock block) {
    
    UIGraphicsBeginImageContextWithOptions(size, NO, 0.0);
    if (block) {
        block();
    }
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

void PushDraw(DrawingStateBlock block)
{
    if (!block) return; // nothing to do
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    if (context == NULL) {NSLog(@"No context to draw into");return;}
    
    CGContextSaveGState(context);
    block();
    CGContextRestoreGState(context);
}

// Improve performance by pre-clipping context
// before beginning layer drawing
void PushLayerDraw(DrawingStateBlock block)
{
    if (!block) return; // nothing to do
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    if (context == NULL) {NSLog(@"No context to draw into"); return;}
    CGContextBeginTransparencyLayer(context, NULL);
    block();
    CGContextEndTransparencyLayer(context);
}
