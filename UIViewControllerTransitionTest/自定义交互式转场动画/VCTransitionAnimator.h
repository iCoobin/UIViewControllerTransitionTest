//
//  VCTransitionAnimator.h
//  UIViewControllerTransitionTest
//
//  Created by 张贵广 on 2017/5/17.
//  Copyright © 2017年 GG. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VCTransitionAnimator : NSObject <UIViewControllerAnimatedTransitioning>

@property (nonatomic, strong) NSString *direction;

@property (nonatomic, assign) UIRectEdge targetEdge;

@end
