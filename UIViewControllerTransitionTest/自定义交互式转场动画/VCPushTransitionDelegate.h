//
//  VCPushTransitionDelegate.h
//  UIViewControllerTransitionTest
//
//  Created by 张贵广 on 2017/5/18.
//  Copyright © 2017年 GG. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VCPushTransitionDelegate : NSObject <UIViewControllerTransitioningDelegate>

@property (nonatomic, strong) UIScreenEdgePanGestureRecognizer *gestureRecongnizer;

@property (nonatomic, assign) UIRectEdge targetEdge;

@end
