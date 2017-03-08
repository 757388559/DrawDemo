//
//  UIImage+Image.h
//  DrawDemoTest
//
//  Created by liugangyi on 2017/2/20.
//  Copyright © 2017年 com.allinmd.cn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Customer)


/**
 将单种颜色生成图片

 @param color 颜色
 @param size 尺寸
 @return 图片
 */
+ (UIImage *)swatchWithColor:(UIColor *)color size:(CGSize)size;


/**
 获取缩略图(不失真)
 
 @param sourceImage 源图片
 @param targetSize 尺寸
 @return 缩略图
 */
+ (UIImage *)thumbnailImageWithImage:(UIImage *)sourceImage size:(CGSize)targetSize;


/**
 获取缩略图(fill/fit)会失真

 @param sourceImage 源图片
 @param targetSize 目标尺寸
 @param useFitting yes-fit  no-fill
 @return 缩略图
 */
+ (UIImage *)thumbnailImageWithImage:(UIImage *)sourceImage
                                size:(CGSize)targetSize
                          useFitting:(BOOL)useFitting;


/**
 提取子图（不是Retina图片）

 @param sourceImage 原始图片
 @param subRect 图片中要提取的地方
 @return 提取到的子图
 */
+ (UIImage *)extractingSubimageWithSourceImage:(UIImage *)sourceImage subRect:(CGRect)subRect;


/**
 提取图片子图 Retina屏幕

 @param sourceImage 用来提取的图片
 @param subRect 提取的位置和大小
 @return 提取到的图片
 */
+ (UIImage *)extractingSubimageWithRetinaImage:(UIImage *)sourceImage subRect:(CGRect)subRect;

/**
 提取view的子图

 @param view 原始view
 @param subRect 包含在view中的rect
 @return 原始view中subrect部分生成图片
 */
+ (UIImage *)extractingSubImageInView:(UIView *)view subRect:(CGRect)subRect;

// convert an image to grayscale

/**
 将一个图片转换成灰色图片

 @param sourceImage 原图片
 @return 新生成的灰色图片
 */
+ (UIImage *)grayscaleOfImage:(UIImage *)sourceImage;

/**
 图片添加水印

 @param sourceImage 原图
 @param targetSize 目标尺寸
 @param markStr 水印
 @return 新的带水印的图片
 */
+ (UIImage *)waterMarkingAnImage:(UIImage *)sourceImage
                      targetSize:(CGSize)targetSize
                         markStr:(NSString *)markStr;

/**
 将RGB图片转成Data

 @param sourceImage 图片
 @return 图片的二进制数据
 */
+ (NSData *)bytesFromRGBImage:(UIImage *)sourceImage;

/**
 将data转换成RGB图片

 @param data imageData
 @param targetSize image reall size
 @return A new image
 */
+ (UIImage *)imageFromBytes:(NSData *)data targetSize:(CGSize)targetSize;

/**
 生成圆形图片

 @param sourceImage 原始图片
 @param targetSize 要生成的圆形图片的大小
 @return A new circle graph
 */
+ (UIImage *)circleImage:(UIImage *)sourceImage targetSize:(CGSize)targetSize;
/**
 带边框的原型图片

 @param sourceImage 原始图片
 @param targetSize 要生成的圆形图片的大小(包括边框厚度)
 @param borderColor 边框颜色
 @param width 边框厚度
 @return 带圆框的图片
 */
+ (UIImage *)circleWithImage:(UIImage *)sourceImage
                  targetSize:(CGSize)targetSize
                 borderColor:(UIColor *)borderColor
                 borderWidth:(CGFloat)width;



@end
