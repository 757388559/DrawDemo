//
//  BezierUtility.h
//  DrawDemoTest
//
//  Created by liugangyi on 2017/4/18.
//  Copyright © 2017年 com.allinmd.cn. All rights reserved.
//

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






@interface BezierUtility : NSObject


@end

