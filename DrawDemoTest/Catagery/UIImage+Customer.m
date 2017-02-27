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

// 提取一个图片的部分

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

+ (UIImage *)exractingSubimageWithRetinaImage:(UIImage *)sourceImage subRect:(CGRect)subRect {
    
    UIGraphicsBeginImageContextWithOptions(subRect.size, NO, 1.0);
    CGRect destRect = CGRectMake(-subRect.origin.x, -subRect.origin.y, sourceImage.size.width, sourceImage.size.height);
    [sourceImage drawInRect:destRect];
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}


// convert an image to grayscale





@end
