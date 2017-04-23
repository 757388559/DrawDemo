//
//  Draw-Block.h
//  DrawDemoTest
//
//  Created by liugangyi on 2017/4/23.
//  Copyright © 2017年 com.allinmd.cn. All rights reserved.
//

typedef void (^DrawingBlock)(CGRect bounds);
typedef void (^DrawingStateBlock)();
void PushDraw(DrawingStateBlock block);
void PushLayerDraw(DrawingStateBlock block);

// Image
UIImage *ImageWithBlock(DrawingBlock block, CGSize size);


