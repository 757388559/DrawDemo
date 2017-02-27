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
+ (UIImage *)thumbnailImageWithImage:(UIImage *)sourceImage size:(CGSize)targetSize useFitting:(BOOL)useFitting;


/**
 提取子图（不是Retina图片）

 @param sourceImage 原始图片
 @param subRect 图片中要提取的地方
 @return 提取到的子图
 */
+ (UIImage *)extractingSubimageWithSourceImage:(UIImage *)sourceImage subRect:(CGRect)subRect;


/**
 提取子图 Retina屏幕

 @param sourceImage 用来提取的图片
 @param subRect 提取的位置和大小
 @return 提取到的图片
 */
+ (UIImage *)exractingSubimageWithRetinaImage:(UIImage *)sourceImage subRect:(CGRect)subRect;


// convert an image to grayscale



@end
