//
//  FirstVC.m
//  UIViewControllerTransitionTest
//
//  Created by 张贵广 on 2017/5/17.
//  Copyright © 2017年 GG. All rights reserved.
//

#import "FirstVC.h"
#import "SecondVC.h"
#import "VCTransitionAnimator.h"

@interface FirstVC () <UIViewControllerTransitioningDelegate>

@end

@implementation FirstVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor cyanColor];
    [self.view addSubview:[self createButton]];
}

- (UIButton *)createButton {
    UIButton *button = [[UIButton alloc] init];
    button.frame = CGRectMake(10, 100, 200, 40);
    button.backgroundColor = [UIColor lightGrayColor];
    [button setTitle:@"Present to SecondVC" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(nextVC) forControlEvents:UIControlEventTouchUpInside];
    return button;
}

- (void)nextVC {
    UIViewController *secondVC = [[SecondVC alloc] init];
    
    secondVC.transitioningDelegate = self;
//    secondVC.navigationController.transitioningDelegate = self;
    
    [self presentViewController:secondVC animated:YES completion:nil];
//    [self.navigationController pushViewController:secondVC animated:YES];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    return [[VCTransitionAnimator alloc] init];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    VCTransitionAnimator *animator = [[VCTransitionAnimator alloc] init];
    animator.direction = 1;
    return animator;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
