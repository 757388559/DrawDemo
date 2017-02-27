//
//  RunByRun.m
//  DrawDemoTest
//
//  Created by liugangyi on 2017/2/17.
//  Copyright © 2017年 com.allinmd.cn. All rights reserved.
//

#import "RunByRun.h"

@implementation RunByRun


- (instancetype)init {
    
    self = [super init];
    if (self) {
        NSLog(@"ClassSelf: %@" , NSStringFromClass(self.class));
        NSLog(@"ClassSuper: %@" , NSStringFromClass(super.class));
    }
    return self;
}
@end
