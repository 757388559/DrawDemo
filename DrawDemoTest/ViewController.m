//
//  ViewController.m
//  DrawDemoTest
//
//  Created by liugangyi on 2016/11/14.
//  Copyright © 2016年 com.allinmd.cn. All rights reserved.
//

#import "ViewController.h"
#import "PlayCardView.h"
#import "UIImage+Customer.h"
#import "UIView+CGRect.h"



@interface ViewController ()


@property (nonatomic , strong) PlayCardView *playCardView;
/// source imgview.
@property (nonatomic , strong) UIImageView *imageView;
/**
 show imageView
 */
@property (nonatomic , strong) UIImageView *showImageView;
/**
 button
 */
@property (nonatomic , strong) UIButton *button;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.imageView.frame = CGRectMake(10, 80, 200, 150);
    UIImage *image = [UIImage imageNamed:@"bg20161219.jpg"];
    self.imageView.image = image;
    
    UIImage *subImage ;
//   subImage = [UIImage extractingSubimageWithSourceImage:image subRect:CGRectMake(0, 0, 100, 75)];
//    subImage = [UIImage extractingSubimageWithRetinaImage:image subRect:CGRectMake(100, 100, 200, 75)];
//   UIImage *subImage = [UIImage extractingSubImageInView:self.imageView subRect:CGRectMake(150, 100, 200, 150)];
    
//    subImage = [UIImage grayscaleOfImage:image];
    subImage = [UIImage waterMarkingAnImage:image targetSize:image.size markStr:@"这是水印"];
    self.showImageView.frame = CGRectMake(10, 240, subImage.size.width, subImage.size.height);
    self.showImageView.image = subImage;
    self.showImageView.backgroundColor = [UIColor greenColor];
    
    
    
    
}


- (UIImageView *)imageView {
    
    if (!_imageView) {
        _imageView = [[UIImageView alloc] init];
        [self.view addSubview:_imageView];
    }
    return _imageView;
}

- (UIImageView *)showImageView {
    
    if (!_showImageView) {
        _showImageView = [[UIImageView alloc] init];
        [self.view addSubview:_showImageView];
    }
    return _showImageView;
}

- (PlayCardView *)playCardView {
    
    if (!_playCardView) {
        _playCardView = [[PlayCardView alloc] init];
        
        [self.view addSubview:_playCardView];
    }
    return _playCardView;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
