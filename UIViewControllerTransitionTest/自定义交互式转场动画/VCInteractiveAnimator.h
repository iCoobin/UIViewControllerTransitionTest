//
//  VCInteractiveAnimator.h
//  UIViewControllerTransitionTest
//
//  Created by 张贵广 on 2017/5/18.
//  Copyright © 2017年 GG. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VCInteractiveAnimator : UIPercentDrivenInteractiveTransition

- (instancetype)init NS_UNAVAILABLE;

- (instancetype)initWithGestureRecognizer:(UIScreenEdgePanGestureRecognizer *)gesture edgeForDragging:(UIRectEdge)edge;

@end
