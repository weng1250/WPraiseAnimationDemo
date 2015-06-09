//
//  ViewController.m
//  WPraiseAnimationDemo
//
//  Created by zilin_weng on 15/6/9.
//  Copyright (c) 2015年 Weng-Zilin. All rights reserved.
//

#import "ViewController.h"
#import "UIView+WZLPraiseAnimation.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(80, 400, 30, 30);
    [btn setImage:[UIImage imageNamed:@"good.jpg"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)clickBtn:(UIButton *)sender
{
    [sender beginPraiseAnimaitonWithAnimationType:WAnimationTypeRaiseThumb duration:1 toDirection:WToDirectionRight completionBlock:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
