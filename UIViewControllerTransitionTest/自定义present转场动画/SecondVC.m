//
//  SecondVC.m
//  UIViewControllerTransitionTest
//
//  Created by 张贵广 on 2017/5/17.
//  Copyright © 2017年 GG. All rights reserved.
//

#import "SecondVC.h"

@interface SecondVC ()

@end

@implementation SecondVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    [self.view addSubview:[self createButton]];
}

- (UIButton *)createButton {
    UIButton *button = [[UIButton alloc] init];
    button.frame = CGRectMake(10, 100, 200, 40);
    button.backgroundColor = [UIColor lightGrayColor];
    [button setTitle:@"Dismiss to FirstVC" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    return button;
}

- (void)back {
    [self dismissViewControllerAnimated:YES completion:nil];
//    [self.navigationController popViewControllerAnimated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
