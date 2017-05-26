//
//  QQMenuTransitionAnimator.m
//  UIViewControllerTransitionTest
//
//  Created by 张贵广 on 2017/5/18.
//  Copyright © 2017年 GG. All rights reserved.
//

#import "QQMenuTransitionAnimator.h"

@implementation QQMenuTransitionAnimator

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 1;
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
    
    CGFloat insetX = 300;
    CGRect screenFrame = UIScreen.mainScreen.bounds;
    CGRect leftFrame = CGRectMake(0, 0, insetX, screenFrame.size.height);
    CGRect rightFrame = CGRectMake(300, 0, screenFrame.size.width, screenFrame.size.height);
    CGRect leftOrginFrame = CGRectMake(-300, 0, 300, screenFrame.size.height);
    
//    CGRect fromFrame = [transitionContext initialFrameForViewController:fromVC];
//    CGRect toFrame = [transitionContext finalFrameForViewController:toVC];
//    
    
    [containerView addSubview:toView];
    
    if ([_direction isEqualToString:kCATransitionFromRight]) {
        fromView.frame = leftFrame;
        toView.frame = rightFrame;
    } else {
        fromView.frame = screenFrame;
        toView.frame = leftOrginFrame;
//        [containerView bringSubviewToFront:fromView];
    }
    
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    [UIView animateWithDuration:duration animations:^{
        
        if ([_direction isEqualToString:kCATransitionFromRight]) {
            fromView.frame = leftOrginFrame;
            toView.frame = screenFrame;
        } else {
            fromView.frame = rightFrame;
            toView.frame = leftFrame;
        }
    } completion:^(BOOL finished) {
        BOOL wasCancelled = [transitionContext transitionWasCancelled];
        [transitionContext completeTransition:!wasCancelled];
    }];
}


@end
