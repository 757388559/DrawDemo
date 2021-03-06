//
//  UIBezierPath+HandyUtilities.h
//  DrawDemoTest
//
//  Created by liugangyi on 2017/4/18.
//  Copyright © 2017年 com.allinmd.cn. All rights reserved.
//

// Bounds
CGRect PathBoundingBox(UIBezierPath *path);
CGRect PathBoundingBoxIgnorContolPoints(UIBezierPath *path);
CGRect PathBoundingBoxWithLineWidth(UIBezierPath *path);
CGPoint PathBoundingCenter(UIBezierPath *path);
CGPoint PathCenter(UIBezierPath *path);

// Transformations
void ApplyCenteredPathTransform(UIBezierPath *path, CGAffineTransform transform);
UIBezierPath *PathByApplyingTransform(UIBezierPath *path, CGAffineTransform transform);

// Utility
void RotatePath(UIBezierPath *path, CGFloat theta);
void ScalePath(UIBezierPath *path, CGFloat sx, CGFloat sy);
void OffsetPath(UIBezierPath *path, CGSize offset);
void MovePathToPoint(UIBezierPath *path, CGPoint point);
void MovePathCenterToPoint(UIBezierPath *path, CGPoint point);
void MirrorPathHorizontally(UIBezierPath *path);
void MirrorPathVertically(UIBezierPath *path);

// Fitting
void FitPathToRect(UIBezierPath *path, CGRect rect);
void AdjustPathToRect(UIBezierPath *path, CGRect destRect);

// Path Attributes
void CopyBezierState(UIBezierPath *source, UIBezierPath *destination);
void CopyBezierDashes(UIBezierPath *source, UIBezierPath *destination);
void AddDashesToPath(UIBezierPath *path);

// String to Path
UIBezierPath *BezierPathFromString(NSString *string, UIFont *font);
UIBezierPath *BezierPathFromStringWithFontFace(NSString *string, NSString *fontFace);

// Misc
void ClipToRect(CGRect rect);
void FillRect(CGRect rect, UIColor *color);
void ShowPathProgression(UIBezierPath *path, CGFloat maxPercent);

// Effects
void SetShadow(UIColor *color, CGSize size, CGFloat blur);
void DrawShadow(UIBezierPath *path, UIColor *color, CGSize size, CGFloat blur);
void DrawInnerShadow(UIBezierPath *path, UIColor *color, CGSize size, CGFloat blur);
void EmbossPath(UIBezierPath *path, UIColor *color, CGFloat radius, CGFloat blur);
void BevelPath(UIBezierPath *p,  UIColor *color, CGFloat r, CGFloat theta);
void InnerBevel(UIBezierPath *p,  UIColor *color, CGFloat r, CGFloat theta);
void ExtrudePath(UIBezierPath *path, UIColor *color, CGFloat radius, CGFloat angle);


@interface UIBezierPath (HandyUtilities)

@property (nonatomic, readonly) CGPoint center;
@property (nonatomic, readonly) CGRect computedBounds;
@property (nonatomic, readonly) CGRect computedBoundsWithLineWidth;

// Stroke/Fill
- (void)stroke:(CGFloat)width;
- (void)stroke:(CGFloat)width color:(UIColor *)color;
- (void)strokeInside:(CGFloat)width;
- (void)strokeInside:(CGFloat)width color:(UIColor *)color;
- (void)fill:(UIColor *)fillColor;
- (void)drawOuterGlow:(UIColor *)fillColor withRadius:(CGFloat)radius;
- (void)drawInnerGlow:(UIColor *)fillColor withRadius:(CGFloat)radius;
- (void)addDashes;
- (void)addDashes:(NSArray *)pattern;
- (void)applyPathPropertiesToContext;

// Clipping
- (void)clipToPath; // I hate addClip
- (void)clipToStroke:(NSUInteger)width;

// Util
- (UIBezierPath *)safeCopy;

@end

