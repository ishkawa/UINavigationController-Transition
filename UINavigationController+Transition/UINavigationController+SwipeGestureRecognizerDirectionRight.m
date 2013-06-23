//
//  UINavigationController+SwipeGestureRecognizerDirectionRight.m
//  PhotosShareClient
//
//  Created by 曾 宪华 on 13-3-25.
//  Copyright (c) 2013年 Jack_team. All rights reserved.
//

#import "UINavigationController+SwipeGestureRecognizerDirectionRight.h"

@implementation UINavigationController (SwipeGestureRecognizerDirectionRight)

//这个是协议回调，所以需要遵循 UIGestureRecognizerDelegate协议
-(void)handleSwipeFrom:(UISwipeGestureRecognizer *)recognizer {
    if (recognizer == nil) return;
    if (recognizer.direction == UISwipeGestureRecognizerDirectionRight) {
        NSLog(@"向右滑动");
        //执行程序
        [self popViewControllerAnimated:YES];
    }
}

- (void)customPushViewController:(UIViewController *)viewController animation:(BOOL)animation {
    if (animation) {
        NSLog(@"添加手势了");
        UISwipeGestureRecognizer *recognizer;
        //向右滑动
        recognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeFrom:)];
        [recognizer setDirection:(UISwipeGestureRecognizerDirectionRight)];
        [[viewController view] addGestureRecognizer:recognizer];
        [recognizer release];
    }
    
    [self pushViewController:viewController animated:YES];
}

- (UIViewController *)customPopViewController {
    UIViewController *fromViewController = self.visibleViewController;
    [self popViewControllerAnimated:YES];
    return fromViewController;
}

@end
