//
//  FirstVC.m
//  UIViewControllerTransitionTest
//
//  Created by 张贵广 on 2017/5/17.
//  Copyright © 2017年 GG. All rights reserved.
//

#import "FirstVC.h"
#import "SecondVC.h"
#import "VCPushTransitionDelegate.h"
#import "QQMenuTransitionAnimator.h"

@interface FirstVC ()
@property (nonatomic, strong) VCPushTransitionDelegate *customPushTransitionDelegate;
@end

@implementation FirstVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor cyanColor];
    [self.view addSubview:[self createButton]];
    
    self.customPushTransitionDelegate = [[VCPushTransitionDelegate alloc] init];
    
    UIScreenEdgePanGestureRecognizer *interactvieTransitionRecognizer =
    [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(interactiveTransitionAction:)];
    interactvieTransitionRecognizer.edges = UIRectEdgeRight;
    [self.view addGestureRecognizer:interactvieTransitionRecognizer];

}

- (void)interactiveTransitionAction:(UIScreenEdgePanGestureRecognizer *)sender {
    if (sender.state == UIGestureRecognizerStateBegan) {
        [self nextVC:sender];
    }
}

- (UIButton *)createButton {
    UIButton *button = [[UIButton alloc] init];
    button.frame = CGRectMake(10, 100, 200, 40);
    button.backgroundColor = [UIColor lightGrayColor];
    [button setTitle:@"Present to SecondVC" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(nextVC:) forControlEvents:UIControlEventTouchUpInside];
    return button;
}

- (void)nextVC:(id)sender {
    UIViewController *secondVC = [[SecondVC alloc] init];
    
    if ([sender isKindOfClass:[UIGestureRecognizer class]]) {
        self.customPushTransitionDelegate.gestureRecongnizer = sender;
    } else {
        self.customPushTransitionDelegate.gestureRecongnizer = nil;
    }
    self.customPushTransitionDelegate.targetEdge = UIRectEdgeRight;
    
    secondVC.transitioningDelegate = self.customPushTransitionDelegate;
    
    [self presentViewController:secondVC animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
