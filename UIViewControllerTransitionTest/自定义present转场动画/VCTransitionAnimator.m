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
    
    
    [containerView addSubview:toView];
//    CGRect fromFrame = [transitionContext initialFrameForViewController:fromVC];
//    CGRect toFrame = [transitionContext finalFrameForViewController:toVC];
    static CGFloat s = 5;
    if (_direction == 1) {
        fromView.frame = [transitionContext initialFrameForViewController:fromVC];
        toView.frame = CGRectMake(s, s, UIScreen.mainScreen.bounds.size.width-2*s, UIScreen.mainScreen.bounds.size.height-2*s);
        [containerView bringSubviewToFront:fromView];
    } else {
        fromView.frame = [transitionContext initialFrameForViewController:fromVC];
        toView.frame = CGRectMake(UIScreen.mainScreen.bounds.size.width, 0, UIScreen.mainScreen.bounds.size.width, UIScreen.mainScreen.bounds.size.height);
    }
    
//    toView.frame = [transitionContext finalFrameForViewController:toVC];
    
    
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    [UIView animateWithDuration:duration animations:^{
//        fromView.alpha = 0;
//        toView.alpha = 1;
        
        if (_direction == 1) {
            fromView.frame = CGRectMake(UIScreen.mainScreen.bounds.size.width, 0, UIScreen.mainScreen.bounds.size.width, UIScreen.mainScreen.bounds.size.height);
            toView.frame = [transitionContext finalFrameForViewController:toVC];
        } else {
            fromView.frame = CGRectMake(s, s, UIScreen.mainScreen.bounds.size.width-2*s, UIScreen.mainScreen.bounds.size.height-2*s);
            toView.frame = [transitionContext finalFrameForViewController:toVC];
        }
    } completion:^(BOOL finished) {
        BOOL wasCancelled = [transitionContext transitionWasCancelled];
        [transitionContext completeTransition:!wasCancelled];
    }];
}

@end
