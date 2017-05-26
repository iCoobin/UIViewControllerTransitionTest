//
//  SecondVC.m
//  UIViewControllerTransitionTest
//
//  Created by 张贵广 on 2017/5/17.
//  Copyright © 2017年 GG. All rights reserved.
//

#import "SecondVC.h"
#import "VCPushTransitionDelegate.h"

@interface SecondVC ()

@end

@implementation SecondVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    [self.view addSubview:[self createButton]];
    
    UIScreenEdgePanGestureRecognizer *interactiveTransitionRecognizer;
    interactiveTransitionRecognizer = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(interactiveTransitionAction:)];
    interactiveTransitionRecognizer.edges = UIRectEdgeLeft;
    [self.view addGestureRecognizer:interactiveTransitionRecognizer];
}

- (UIButton *)createButton {
    UIButton *button = [[UIButton alloc] init];
    button.frame = CGRectMake(10, 100, 200, 40);
    button.backgroundColor = [UIColor lightGrayColor];
    [button setTitle:@"Dismiss to FirstVC" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchUpInside];
    return button;
}

- (void)back:(id)sender {
    
    if ([self.transitioningDelegate isKindOfClass:[VCPushTransitionDelegate class]])
    {
        VCPushTransitionDelegate *transitionDelegate = self.transitioningDelegate;
        
        if ([sender isKindOfClass:UIGestureRecognizer.class])
            transitionDelegate.gestureRecongnizer = sender;
        else
            transitionDelegate.gestureRecongnizer = nil;
        
        transitionDelegate.targetEdge = UIRectEdgeLeft;
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)interactiveTransitionAction:(UIScreenEdgePanGestureRecognizer *)gesture {
    if (gesture.state == UIGestureRecognizerStateBegan) {
        [self back:gesture];
    }
}


- (CGFloat)percentForGesture:(UIScreenEdgePanGestureRecognizer *)gesture {
    CGPoint locationInSourceView = [gesture locationInView:self.view];
    CGFloat width = CGRectGetWidth(self.view.bounds);
    return locationInSourceView.x / width;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
