//
//  ViewController.m
//  DrawDemoTest
//
//  Created by liugangyi on 2016/11/14.
//  Copyright © 2016年 com.allinmd.cn. All rights reserved.
//

#import "ViewController.h"
#import "PlayCardView.h"
#import "RunByRun.h"
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
    UIImage *image = [UIImage imageNamed:@"bg20161102.jpg"];
    self.imageView.image = image;
    
    UIImage *subImage = [UIImage extractingSubimageWithSourceImage:image subRect:CGRectMake(0, 0, 100, 75)];
    subImage = [UIImage exractingSubimageWithRetinaImage:image subRect:CGRectMake(0, 0, 100, 75)];
    self.showImageView.frame = CGRectMake(10, 240, subImage.size.width, subImage.size.height);
    self.showImageView.image = subImage;
    
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


- (void)buttonWithActivityView {
    self.button = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.button setTitle:@"创建账号" forState:UIControlStateNormal];
    [self.button setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    self.button.frame = CGRectMake(20, 100, 375-40, 40);
    [self.view addSubview:self.button];
    self.button.backgroundColor = [UIColor whiteColor];
    
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [self.button setTitle:@"  " forState:UIControlStateNormal];
        CGPoint center = self.button.titleLabel.center;
        UIActivityIndicatorView *view = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        view.center = center;
        view.hidesWhenStopped = YES;
        [self.button addSubview:view];
        [view startAnimating];
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self.button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
            [self.button setTitle:@"登陆成功" forState:UIControlStateNormal];
            [view stopAnimating];
        });
        
    });
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
