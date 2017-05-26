//
//  VCPushTransitionDelegate.m
//  UIViewControllerTransitionTest
//
//  Created by 张贵广 on 2017/5/18.
//  Copyright © 2017年 GG. All rights reserved.
//

#import "VCPushTransitionDelegate.h"
#import "VCTransitionAnimator.h"
#import "VCInteractiveAnimator.h"

@implementation VCPushTransitionDelegate

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    VCTransitionAnimator *animator = [[VCTransitionAnimator alloc] init];
    animator.direction = kCATransitionFromRight;
    return animator;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    VCTransitionAnimator *animator = [[VCTransitionAnimator alloc] init];
    animator.direction = kCATransitionFromLeft;
    return animator;
}


- (id<UIViewControllerInteractiveTransitioning>)interactionControllerForPresentation:(id<UIViewControllerAnimatedTransitioning>)animator {
    if (self.gestureRecongnizer) {
        VCInteractiveAnimator *animator = [[VCInteractiveAnimator alloc] initWithGestureRecognizer:self.gestureRecongnizer edgeForDragging:self.targetEdge];
        return animator;
    }
    return nil;
}

- (id<UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id<UIViewControllerAnimatedTransitioning>)animator {
    if (self.gestureRecongnizer) {
        VCInteractiveAnimator *animator = [[VCInteractiveAnimator alloc] initWithGestureRecognizer:self.gestureRecongnizer edgeForDragging:self.targetEdge];
        return animator;
    }
    return nil;
}

@end
