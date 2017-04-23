//
//  UIBezierPath+HandyUtilities.h
//  DrawDemoTest
//
//  Created by liugangyi on 2017/4/18.
//  Copyright © 2017年 com.allinmd.cn. All rights reserved.
//


#define NUMBER_OF_BEZIER_SAMPLES    6

typedef CGFloat (^InterpolationBlock)(CGFloat percent);

// Return Bezier Value
float CubicBezier(float t, float start, float c1, float c2, float end);
float QuadBezier(float t, float start, float c1, float end);

// Return Bezier Point
CGPoint CubicBezierPoint(CGFloat t, CGPoint start, CGPoint c1, CGPoint c2, CGPoint end);
CGPoint QuadBezierPoint(CGFloat t, CGPoint start, CGPoint c1, CGPoint end);

// Calculate Curve Length
float CubicBezierLength(CGPoint start, CGPoint c1, CGPoint c2, CGPoint end);
float QuadBezierLength(CGPoint start, CGPoint c1, CGPoint end);

// Element Distance
CGFloat ElementDistanceFromPoint(BezierElement *element, CGPoint point, CGPoint startPoint);

// Linear Interpolation
CGPoint InterpolateLineSegment(CGPoint p1, CGPoint p2, CGFloat percent, CGPoint *slope);

// Interpolate along element
CGPoint InterpolatePointFromElement(BezierElement *element, CGPoint point, CGPoint startPoint, CGFloat percent, CGPoint *slope);

// Ease
CGFloat EaseIn(CGFloat currentTime, int factor);
CGFloat EaseOut(CGFloat currentTime, int factor);
CGFloat EaseInOut(CGFloat currentTime, int factor);

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


@interface UIBezierPath (HandyUtilities)

@property (nonatomic, readonly) CGPoint center;
@property (nonatomic, readonly) CGRect computedBounds;
@property (nonatomic, readonly) CGRect computedBoundsWithLineWidth;

// Stroke/Fill
- (void) stroke: (CGFloat) width;
- (void) stroke: (CGFloat) width color: (UIColor *) color;
- (void) strokeInside: (CGFloat) width;
- (void) strokeInside: (CGFloat) width color: (UIColor *) color;
- (void) fill: (UIColor *) fillColor;
- (void) drawOuterGlow: (UIColor *) fillColor withRadius: (CGFloat) radius;
- (void) drawInnerGlow: (UIColor *) fillColor withRadius: (CGFloat) radius;
- (void) addDashes;
- (void) addDashes: (NSArray *) pattern;
- (void) applyPathPropertiesToContext;

// Clipping
- (void) clipToPath; // I hate addClip
- (void) clipToStroke: (NSUInteger) width;

// Util
- (UIBezierPath *) safeCopy;

@end

