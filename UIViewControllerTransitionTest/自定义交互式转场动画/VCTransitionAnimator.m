//
//  VCTransitionAnimator.m
//  UIViewControllerTransitionTest
//
//  Created by 张贵广 on 2017/5/17.
//  Copyright © 2017年 GG. All rights reserved.
//

#import "VCTransitionAnimator.h"

@implementation VCTransitionAnimator

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.3;
}


- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView *containerView = transitionContext.containerView;
    
    UIView *fromView;
    UIView *toView;
    
    if ([transitionContext respondsToSelector:@selector(viewForKey:)]) {
        fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
        toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    } else {
        fromView = fromVC.view;
        toView = toVC.view;
    }
    
    static CGFloat screenInset = 5;
    CGRect fromFrame = [transitionContext initialFrameForViewController:fromVC];
    CGRect toFrame = [transitionContext finalFrameForViewController:toVC];
    
    [containerView addSubview:toView];
    
    fromView.frame = fromFrame;
    if ([_direction isEqualToString:kCATransitionFromRight]) {
        toView.frame = CGRectOffset(toFrame, toFrame.size.width, 0);
    } else {
        toView.frame = CGRectInset(toFrame, screenInset, screenInset);
        [containerView bringSubviewToFront:fromView];
    }
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    [UIView animateWithDuration:duration animations:^{
        
        if ([_direction isEqualToString:kCATransitionFromRight]) {
            fromView.frame = CGRectInset(fromFrame, screenInset, screenInset);
        } else {
            fromView.frame = CGRectOffset(fromFrame, fromFrame.size.width, 0);
        }
        toView.frame = toFrame;
    } completion:^(BOOL finished) {
        BOOL wasCancelled = [transitionContext transitionWasCancelled];
        [transitionContext completeTransition:!wasCancelled];
    }];
}

@end
