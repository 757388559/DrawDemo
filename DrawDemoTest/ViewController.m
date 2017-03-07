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
    
    UIImage *image = [UIImage imageNamed:@"bg20161219.jpg"];
    self.imageView.frame = CGRectMake(10, 80, image.size.width, image.size.height);
    self.imageView.image = image;
    
    UIImage *subImage ;
//   subImage = [UIImage extractingSubimageWithSourceImage:image subRect:CGRectMake(0, 0, 100, 75)];
//    subImage = [UIImage extractingSubimageWithRetinaImage:image subRect:CGRectMake(10,0, 100, 75)];
//   UIImage *subImage = [UIImage extractingSubImageInView:self.imageView subRect:CGRectMake(150, 100, 200, 150)];
    
//    subImage = [UIImage grayscaleOfImage:image];
//    subImage = [UIImage waterMarkingAnImage:image targetSize:CGSizeMake(200, 200) markStr:@"这是水印"];
//
//    NSData *data = UIImageJPEGRepresentation(image, 1);
//    subImage = [UIImage imageWithData:data];
    
//    NSData *data = [UIImage bytesFromRGBImage:image];
//    subImage = [UIImage imageFromBytes:data targetSize:image.size];
//    subImage = [UIImage imageFromBytes:data targetSize:CGSizeMake(200, 100)];
    

    
    subImage = [UIImage circleWithImage:image targetSize:image.size borderColor:[UIColor redColor] borderWidth:5];
//    subImage = [UIImage circleImage:image targetSize:CGSizeMake(100, 100)];
    self.showImageView.frame = CGRectMake(10, CGRectGetMaxY(self.imageView.frame)+20, subImage.size.width, subImage.size.height);
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
