//
//  BezierElement.h
//  DrawDemoTest
//
//  Created by liugangyi on 2017/4/18.
//  Copyright © 2017年 com.allinmd.cn. All rights reserved.
//


#import <Foundation/Foundation.h>

// Block for transforming points
typedef CGPoint (^PathBlock)(CGPoint point);

@interface BezierElement : NSObject <NSCopying>

// Element storage
@property (nonatomic, assign) CGPathElementType elementType;
@property (nonatomic, assign) CGPoint point;
@property (nonatomic, assign) CGPoint controlPoint1;
@property (nonatomic, assign) CGPoint controlPoint2;

// Instance creation
+ (instancetype)elementWithPathElement:(CGPathElement)element;

// Applying transformations
- (BezierElement *)elementByApplyingBlock:(PathBlock)block;

// Adding to path
- (void)addToPath:(UIBezierPath *)path;

// Readable forms
@property (nonatomic, readonly)NSString *stringValue;
- (void)showTheCode;
@end;
