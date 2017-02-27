//
//  PlayCardView.h
//  DrawDemoTest
//
//  Created by liugangyi on 2016/12/16.
//  Copyright © 2016年 com.allinmd.cn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlayCardView : UIView

/// <##>.
@property (nonatomic , assign) BOOL faceUp;
/// <#注释#>.
@property (nonatomic , copy) NSString *rank;
/// <#注释#>.
@property (nonatomic , copy) NSString *type;
@end
