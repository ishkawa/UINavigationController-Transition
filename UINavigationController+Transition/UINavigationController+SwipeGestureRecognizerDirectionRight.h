//
//  UINavigationController+SwipeGestureRecognizerDirectionRight.h
//  PhotosShareClient
//
//  Created by 曾 宪华 on 13-3-25.
//  Copyright (c) 2013年 Jack_team. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationController (SwipeGestureRecognizerDirectionRight)
- (void)customPushViewController:(UIViewController *)viewController animation:(BOOL)animation;
- (UIViewController *)customPopViewController;
@end
