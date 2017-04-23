//
//  BezierUtility.m
//  DrawDemoTest
//
//  Created by liugangyi on 2017/4/18.
//  Copyright © 2017年 com.allinmd.cn. All rights reserved.
//

#import "BezierUtility.h"

#pragma mark - Bounding Box
CGRect PathBoundingBox(UIBezierPath *path) {
    return CGPathGetBoundingBox(path.CGPath);
}

CGRect PathBoundingBoxIgnorContolPoints(UIBezierPath *path) {
    return CGPathGetPathBoundingBox(path.CGPath);
}

CGRect PathBoundingBoxWithLineWidth(UIBezierPath *path) {
    CGRect bounding = PathBoundingBox(path);
    return CGRectInset(bounding, -path.lineWidth /2.0f, -path.lineWidth/2.0f);
}

CGPoint PathBoundingCenter(UIBezierPath *path) {
    CGRect bounding = PathBoundingBox(path);
    return RectGetCenter(bounding);
}

CGPoint PathCenter(UIBezierPath *path) {
    return RectGetCenter(path.bounds);
}

// Transformations
void ApplyCenteredPathTransform(UIBezierPath *path, CGAffineTransform transform) {
    
    CGPoint center = PathBoundingCenter(path);
    CGAffineTransform t = CGAffineTransformIdentity;
    t = CGAffineTransformTranslate(t, center.x, center.y);
    t = CGAffineTransformConcat(transform, t);
    t = CGAffineTransformTranslate(t, -center.x, -center.y);
    [path applyTransform:t];
}

UIBezierPath *PathByApplyingTransform(UIBezierPath *path, CGAffineTransform transform) {
    
    UIBezierPath *pathCopy = [path copy];
    ApplyCenteredPathTransform(pathCopy, transform);
    return pathCopy;
}

// Utility
void RotatePath(UIBezierPath *path, CGFloat theta) {
    CGAffineTransform rotateTransform = CGAffineTransformMakeRotation(theta);
    ApplyCenteredPathTransform(path, rotateTransform);
}

void ScalePath(UIBezierPath *path, CGFloat sx, CGFloat sy) {
    CGAffineTransform scaleTransform = CGAffineTransformMakeScale(sx, sy);
    ApplyCenteredPathTransform(path, scaleTransform);
    
}

void OffsetPath(UIBezierPath *path, CGSize offset){
    CGAffineTransform translatin = CGAffineTransformMakeTranslation(offset.width, offset.height);
    ApplyCenteredPathTransform(path, translatin);
}

void MovePathToPoint(UIBezierPath *path, CGPoint point) {
    CGRect bounds = PathBoundingBox(path);
    CGPoint p1 = bounds.origin;
    CGPoint p2 = destPoint;
    CGSize vector = CGSizeMake(p2.x - p1.x, p2.y - p1.y);
    OffsetPath(path, vector);
}
void MovePathCenterToPoint(UIBezierPath *path, CGPoint point);
void MirrorPathHorizontally(UIBezierPath *path);
void MirrorPathVertically(UIBezierPath *path);




@implementation BezierUtility

@end
