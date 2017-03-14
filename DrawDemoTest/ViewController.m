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



@interface ViewController ()


@property (nonatomic , strong) PlayCardView *playCardView;
/// source imgview.
@property (nonatomic , strong) UIImageView *sourceImageView;
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
    

    
}



#pragma mark - Image
- (void)setKindsOfImage {
    
    //    UIImage *image = [UIImage imageNamed:@"bg20161219.jpg"];
    //    self.sourceImageView.frame = CGRectMake(10, 80, image.size.width, image.size.height);
    //    self.sourceImageView.image = image;
    //
    //    NSLog(@"SourceImageSize:%@" , NSStringFromCGSize(image.size));
    //
    //    UIImage *subImage ;
    
    // 生成纯颜色的图片
    //    subImage = [UIImage swatchWithColor:[UIColor blueColor] size:CGSizeMake(100, 100)];
    // 缩略图
    //    subImage = [UIImage thumbnailImageWithImage:image size:CGSizeMake(300, 100)];
    
    // 提取子视图
    //    subImage = [UIImage extractingSubimageWithRetinaImage:image subRect:CGRectMake(150,100, 100, 100)];
    // 提取子视图
    //    subImage = [UIImage extractingSubimageWithSourceImage:image subRect:CGRectMake(0, 0, 100, 75)];
    // 提取子视图 view
    //    subImage = [UIImage extractingSubImageInView:self.sourceImageView subRect:CGRectMake(150, 100, 200, 150)];
    
    // 灰度
    //    subImage = [UIImage grayscaleOfImage:image];
    
    // 水印
    //    subImage = [UIImage waterMarkingAnImage:image targetSize:CGSizeMake(200, 200) markStr:@"这是水印"];
    
    // data 转换
    //    NSData *data = [UIImage bytesFromRGBImage:image];
    //    subImage = [UIImage imageFromBytes:data targetSize:image.size];
    //    subImage = [UIImage imageFromBytes:data targetSize:CGSizeMake(200, 100)];
    
    
    // 圆形图片
    //    subImage = [UIImage circleWithImage:image targetSize:image.size borderColor:[UIColor redColor] borderWidth:5];
    //    subImage = [UIImage circleImage:image targetSize:CGSizeMake(100, 100)];
    
    
    
    //    self.showImageView.frame = CGRectMake(10, CGRectGetMaxY(self.sourceImageView.frame)+20, subImage.size.width, subImage.size.height);
    //    self.showImageView.image = subImage;

}

- (UIImageView *)sourceImageView {
    
    if (!_sourceImageView) {
        _sourceImageView = [[UIImageView alloc] init];
        [self.view addSubview:_sourceImageView];
    }
    return _sourceImageView;
}

- (UIImageView *)showImageView {
    
    if (!_showImageView) {
        _showImageView = [[UIImageView alloc] init];
        _showImageView.backgroundColor = [UIColor greenColor];
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
