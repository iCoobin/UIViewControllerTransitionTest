//
//  VCInteractiveAnimator.m
//  UIViewControllerTransitionTest
//
//  Created by 张贵广 on 2017/5/18.
//  Copyright © 2017年 GG. All rights reserved.
//

#import "VCInteractiveAnimator.h"

@interface VCInteractiveAnimator ()

@property (nonatomic, weak) id<UIViewControllerContextTransitioning> transitionContext;
@property (nonatomic, strong) UIScreenEdgePanGestureRecognizer *gestureRecognizer;
@property (nonatomic, assign) UIRectEdge edge;

@end

@implementation VCInteractiveAnimator

- (instancetype)initWithGestureRecognizer:(UIScreenEdgePanGestureRecognizer *)gesture edgeForDragging:(UIRectEdge)edge {
    self = [super init];
    if (self) {
        _gestureRecognizer = gesture;
        _edge = edge;
        
        [_gestureRecognizer addTarget:self action:@selector(gestureDidUpdate:)];
    }
    return self;
}

- (void)startInteractiveTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    self.transitionContext = transitionContext;
    [super startInteractiveTransition:transitionContext];
}

- (void)dealloc {
    [self.gestureRecognizer removeTarget:self action:@selector(gestureDidUpdate:)];
}

- (CGFloat)percentForGesture:(UIScreenEdgePanGestureRecognizer *)gesture {
    UIView *transitioinContainerView = self.transitionContext.containerView;
    CGPoint locationInSourceView = [gesture locationInView:transitioinContainerView];
    
    CGFloat width = CGRectGetWidth(transitioinContainerView.bounds);
    CGFloat height = CGRectGetHeight(transitioinContainerView.bounds);
    
    if (self.edge == UIRectEdgeRight)
        return (width - locationInSourceView.x) / width;
    else if (self.edge == UIRectEdgeLeft)
        return locationInSourceView.x / width;
    else if (self.edge == UIRectEdgeBottom)
        return (height - locationInSourceView.y) / height;
    else if (self.edge == UIRectEdgeTop)
        return locationInSourceView.y / height;
    else
        return 0.f;
}

- (void)gestureDidUpdate:(UIScreenEdgePanGestureRecognizer *)gesture {
    switch (gesture.state)
    {
        case UIGestureRecognizerStateBegan:
            // The Began state is handled by the view controllers.  In response
            // to the gesture recognizer transitioning to this state, they
            // will trigger the presentation or dismissal.
            break;
        case UIGestureRecognizerStateChanged:
            // We have been dragging! Update the transition context accordingly.
            [self updateInteractiveTransition:[self percentForGesture:gesture]];
            break;
        case UIGestureRecognizerStateEnded:
            // Dragging has finished.
            // Complete or cancel, depending on how far we've dragged.
            if ([self percentForGesture:gesture] >= 0.5f)
                [self finishInteractiveTransition];
            else
                [self cancelInteractiveTransition];
            break;
        default:
            // Something happened. cancel the transition.
            [self cancelInteractiveTransition];
            break;
    }
}

@end
