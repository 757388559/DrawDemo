//
//  UIImage+Image.m
//  DrawDemoTest
//
//  Created by liugangyi on 2017/2/20.
//  Copyright © 2017年 com.allinmd.cn. All rights reserved.
//

#import "UIImage+Customer.h"
#import "UIView+CGRect.h"

@implementation UIImage (Customer)


/**
 把纯颜色生成图片
 
 @param color 颜色
 @param size 尺寸
 @return 图片
 */
+ (UIImage *)swatchWithColor:(UIColor *)color size:(CGSize)size {
    
    UIGraphicsBeginImageContextWithOptions(size, YES, 0.0);
    [color setFill];
    UIRectFill(CGRectMake(0, 0, size.width, size.height));
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

// 缩略图的获取

/**
 获取缩略图(不失真)
 
 @param sourceImage 图片
 @param targetSize 尺寸
 @return 缩略图
 */
+ (UIImage *)thumbnailImageWithImage:(UIImage *)sourceImage size:(CGSize)targetSize {
    
    UIGraphicsBeginImageContextWithOptions(targetSize, NO, 0.0);
    [sourceImage drawInRect:CGRectMake(0, 0, targetSize.width, targetSize.height)];
    UIImage *thumbnail =
    UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return thumbnail;
}


+ (UIImage *)thumbnailImageWithImage:(UIImage *)sourceImage
                                size:(CGSize)targetSize
                          useFitting:(BOOL)useFitting {
    
    UIGraphicsBeginImageContextWithOptions(targetSize, NO, 0.0);
    
    // 目标
    CGRect targetRect = [UIView sizeMakeRect:targetSize];
    
    // 图片的bounds
    CGRect naturalRect = [UIView sizeMakeRect:sourceImage.size];
    
    // fit/fill 后的rect
    CGRect destanitionRect = useFitting ? [UIView rectByFittingInRect:naturalRect destRect:targetRect] : [UIView rectByFillingRect:naturalRect destRect:targetRect];
    
    // Draw the new thumbnail
    [sourceImage drawInRect:destanitionRect];
    
    // Retrieve and return the new image
    UIImage *thumbnail = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return thumbnail;
}

// 提取一个图片的某一部分
+ (UIImage *)extractingSubimageWithSourceImage:(UIImage *)sourceImage subRect:(CGRect)subRect {
    
    //Extract image
    CGImageRef imageRef = CGImageCreateWithImageInRect(sourceImage.CGImage, subRect);
    
    if (imageRef != NULL) {
        UIImage *output = [UIImage imageWithCGImage:imageRef];
        CGImageRelease(imageRef);
        return output;
    }
    NSLog(@"error：Unable to extract subImage");
    return nil;
}

+ (UIImage *)extractingSubimageWithRetinaImage:(UIImage *)sourceImage subRect:(CGRect)subRect {
    
    UIGraphicsBeginImageContextWithOptions(subRect.size, NO, 1.0);
    CGRect destRect = CGRectMake(-subRect.origin.x, -subRect.origin.y, sourceImage.size.width, sourceImage.size.height);
    [sourceImage drawInRect:destRect];
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

+ (UIImage *)extractingSubImageInView:(UIView *)view subRect:(CGRect)subRect {
    
    UIGraphicsBeginImageContextWithOptions(view.frame.size, NO, 1.0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [view.layer renderInContext:context];
    
    
    CGRect sourceRect = view.bounds;
    CGRect destRect = CGRectZero;
 
    if (CGRectIntersectsRect(sourceRect, subRect)) {
        destRect = CGRectIntersection(sourceRect, subRect);
    } else {
        UIGraphicsEndImageContext();
        return nil;
    }
    UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
    CGImageRef imageRef = CGImageCreateWithImageInRect(viewImage.CGImage, destRect);
    UIGraphicsEndImageContext();
    UIImage *newImage = [UIImage imageWithCGImage:imageRef];
    
    return newImage;
}

// convert an image to grayscale

+ (UIImage *)grayscaleOfImage:(UIImage *)sourceImage {
    
    // 创建颜色
    CGColorSpaceRef colorSpaceRef = CGColorSpaceCreateDeviceGray();
    if (colorSpaceRef == NULL) {
        NSLog(@"Error creating grayscale color space");
        return nil;
    }
    
    // Extents are integers
    int width = sourceImage.size.width;
    int height = sourceImage.size.height;
    
    // 创建context: 1byte/pix 、 no alpha
    CGContextRef contextRef = CGBitmapContextCreate(NULL, width, height, 8, width, colorSpaceRef, (CGBitmapInfo)kCGImageAlphaNone);
    // 释放
    CGColorSpaceRelease(colorSpaceRef);
    
    if (contextRef == NULL)
    {
        NSLog(@"Error building grayscale bitmap context");
        return nil;
    }
    
    // 复制图片使用新的colorspace
    CGRect rect = [UIView sizeMakeRect:sourceImage.size];
    CGContextDrawImage(contextRef, rect, sourceImage.CGImage);
    CGImageRef imageRef = CGBitmapContextCreateImage(contextRef);
    UIImage *newImage = [UIImage imageWithCGImage:imageRef];
    CFRelease(imageRef);
    
    return newImage;
}



+ (UIImage *)waterMarkingAnImage:(UIImage *)sourceImage targetSize:(CGSize)targetSize markStr:(NSString *)markStr {
    
    UIGraphicsBeginImageContextWithOptions(targetSize, NO, 0.0);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    // Draw the original image into context
    CGRect targetRect = [UIView sizeMakeRect:targetSize];
    CGRect imageRect = [UIView rectByFillingRect:[UIView sizeMakeRect:sourceImage.size] destRect:targetRect];
    [sourceImage drawInRect:imageRect];
    
    // rotate the context
    CGPoint center = [UIView rectGetCenter:targetRect];
    CGContextTranslateCTM(context, center.x, center.y);
    CGContextRotateCTM(context, M_PI_4);
    CGContextTranslateCTM(context, -center.x, -center.y);
    UIFont *font = [UIFont systemFontOfSize:20];
    CGSize size = [markStr sizeWithAttributes:@{NSFontAttributeName:font}];
    CGRect markStrRect = [UIView rectCenteredInRect:[UIView sizeMakeRect:size] mainRect:targetRect];
    
    // Drawing markstr
    CGContextSetBlendMode(context, kCGBlendModeDifference);
    [markStr drawInRect:markStrRect withAttributes:@{NSFontAttributeName:font , NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    // 获取图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}


+ (NSData *)bytesFromRGBImage:(UIImage *)sourceImage {
    
    if (!sourceImage) return nil;
    // Establish color space
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    if (colorSpace == NULL)
    {
        NSLog(@"Error creating RGB color space");
        return nil;
    }
    // Establish context
    int width = sourceImage.size.width;
    int height = sourceImage.size.height;
    CGContextRef context = CGBitmapContextCreate(NULL,
                                                 width,
                                                 height,
                                                 8, // bits per byte
                                                 width * 4, // bytes per row
                                                 colorSpace,
                                                 (CGBitmapInfo) kCGImageAlphaPremultipliedFirst);
    
    CGColorSpaceRelease(colorSpace);
    if (context == NULL) {
        NSLog(@"Error creating context");
        return nil;
    }
    // Draw source into context bytes
    CGRect rect = (CGRect){.size = sourceImage.size};
    CGContextDrawImage(context, rect, sourceImage.CGImage);
    // Create NSData from bytes
    NSData *data = [NSData dataWithBytes:CGBitmapContextGetData(context) length:(width * height * 4)]; // bytes per image
    CGContextRelease(context);
    return data;
}

+ (UIImage *)imageFromBytes:(NSData *)data targetSize:(CGSize)targetSize {
    
    // Check data
    int width = targetSize.width;
    int height = targetSize.height;
    if (data.length < (width * height * 4)) {
        NSLog(@"Error: Got %lu bytes. Expected %d bytes", (unsigned long)data.length, width * height * 4);
        return nil;
    }
    // Create a color space
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    
    if (colorSpace == NULL) {
        NSLog(@"Error creating RGB colorspace");
        return nil;
    }
    // Create the bitmap context
    Byte *bytes = (Byte *) data.bytes;
    CGContextRef context = CGBitmapContextCreate(
                                                 bytes,
                                                 width,
                                                 height,
                                                 8, // 8 bits per component
                                                 width * 4, // 4 bytes in ARGB
                                                 colorSpace,
                                                 (CGBitmapInfo)kCGImageAlphaPremultipliedFirst);
    CGColorSpaceRelease(colorSpace );
    
    if (context == NULL) {
        NSLog(@"Error. Could not create context");
        return nil; }
    // Convert to image
    CGImageRef imageRef = CGBitmapContextCreateImage(context);
    UIImage *image = [UIImage imageWithCGImage:imageRef];
    // Clean up CGContextRelease(context); CFRelease(imageRef);
    return image;
}




@end
