
//
//  DrawPDFPageView.m
//  DrawDemoTest
//
//  Created by liugangyi on 2017/3/12.
//  Copyright © 2017年 com.allinmd.cn. All rights reserved.
//

#import "DrawPDFPageView.h"

@implementation DrawPDFPageView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)drawPDFPageInRect:(CGRect)destinationRect pdfRef:(CGPDFPageRef)pageRef {
    
    // Get current context
    CGContextRef context = UIGraphicsGetCurrentContext();
    if (context == NULL) {
        NSLog(@"Error: NO context to draw to");
        return;
    }
    
    // Save current context status
    CGContextSaveGState(context);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    // Flip the context to Quartz space
    CGAffineTransform transform = CGAffineTransformIdentity;
    transform = CGAffineTransformScale(transform, 1.0f, -1.0f);
    transform = CGAffineTransformTranslate(transform, 0.0f, -image.size.height);
    CGContextConcatCTM(context, transform);
    
    // Flip the rect, which remain in UIKit space
    CGRect d = CGRectApplyAffineTransform(destinationRect, transform);
    
    // Calculate a rectangle to draw to
    // CGPDFPageGetBoxRect() returns a rectangle
    // representing the page’s dimension
    CGRect pageRect = CGPDFPageGetBoxRect(pageRef, kCGPDFCropBox);
    CGFloat drawingAspect = AspectScaleFit(pageRect.size, d);
    CGRect drawingRect = RectByFillingRect(pageRect, d);
    
    // Draw the page outline (optional)
    UIRectFrame(drawingRect);
    
    // Adjust the context to the page draws within
    // the fitting rectangle (drawingRect)
    CGContextTranslateCTM(context,
    drawingRect.origin.x, drawingRect.origin.y); CGContextScaleCTM(context, drawingAspect, drawingAspect);
    
    // Draw the page
    CGContextDrawPDFPage(context, pageRef);
    CGContextRestoreGState(context);
}


- (CGPDFDocumentRef)openPdfDocWithName:(NSString *)pdfName {
    
    // Open pdf document
    NSString *pdfPath = [[NSBundle mainBundle] pathForResource:pdfName ofType:nil];
    CGPDFDocumentRef docRef = CGPDFDocumentCreateWithURL((__bridge CFURLRef)[NSURL fileURLWithPath:pdfPath]);
    if (docRef == NULL) {
        NSLog(@"Error loading PDF");
        return nil;
    }

    CGPDFDocumentRelease(docRef);
    return docRef;
}


@end
