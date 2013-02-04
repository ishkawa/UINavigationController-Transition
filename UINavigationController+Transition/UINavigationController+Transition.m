#import "UINavigationController+Transition.h"

@implementation UINavigationController (Transition)

- (void)pushViewController:(UIViewController *)toViewController
                  duration:(NSTimeInterval)duration
                prelayouts:(void (^)(UIView *, UIView *))preparation
                animations:(void (^)(UIView *, UIView *))animations
                completion:(void (^)(UIView *, UIView *))completion
{
    [self pushViewController:toViewController
                    duration:duration
                     options:0
                  prelayouts:preparation
                  animations:animations
                  completion:completion];
}

- (void)pushViewController:(UIViewController *)toViewController
                  duration:(NSTimeInterval)duration
                   options:(UIViewAnimationOptions)options
                prelayouts:(void (^)(UIView *, UIView *))preparation
                animations:(void (^)(UIView *, UIView *))animations
                completion:(void (^)(UIView *, UIView *))completion
{
    UIViewController *fromViewController = self.visibleViewController;
    
    [self pushViewController:toViewController animated:NO];
    [self.view layoutSubviews];
    
    UIView *superView = toViewController.view.superview;
    [superView addSubview:fromViewController.view];
    [superView bringSubviewToFront:toViewController.view];
    
    if (preparation) {
        preparation(fromViewController.view, toViewController.view);
    }
    
    [UIView animateWithDuration:duration
                          delay:0.0
                        options:options
                     animations:^{
                         if (animations) {
                             animations(fromViewController.view, toViewController.view);
                         }
                     }
                     completion:^(BOOL finished) {
                         if (completion) {
                             completion(fromViewController.view, toViewController.view);
                         }
                         [fromViewController.view removeFromSuperview];
                     }];
}

- (UIViewController *)popViewControllerWithDuration:(NSTimeInterval)duration
                                         prelayouts:(void (^)(UIView *, UIView *))preparation
                                         animations:(void (^)(UIView *, UIView *))animations
                                         completion:(void (^)(UIView *, UIView *))completion
{
    UIViewController *fromViewController = [self popViewControllerWithDuration:duration
                                                                       options:0
                                                                    prelayouts:preparation
                                                                    animations:animations
                                                                    completion:completion];
    return fromViewController;
}

- (UIViewController *)popViewControllerWithDuration:(NSTimeInterval)duration
                                            options:(UIViewAnimationOptions)options
                                         prelayouts:(void (^)(UIView *, UIView *))preparation
                                         animations:(void (^)(UIView *, UIView *))animations
                                         completion:(void (^)(UIView *, UIView *))completion
{
    NSInteger count = [self.viewControllers count];
    if (count <= 1) {
        return nil;
    }
    
    UIViewController *fromViewController = self.visibleViewController;
    [self popViewControllerAnimated:NO];
    [self.view layoutSubviews];
    
    UIViewController *toViewController = self.visibleViewController;
    UIView *superView = toViewController.view.superview;
    [superView addSubview:fromViewController.view];
    
    [self.view layoutIfNeeded];
    if (preparation) {
        preparation(fromViewController.view, toViewController.view);
    }
    
    [UIView animateWithDuration:duration
                          delay:0.0
                        options:options
                     animations:^{
                         if (animations) {
                             animations(fromViewController.view, toViewController.view);
                         }
                     }
                     completion:^(BOOL finished) {
                         if (completion) {
                             completion(fromViewController.view, toViewController.view);
                         }
                         [fromViewController.view removeFromSuperview];
                     }];
    
    return fromViewController;
}

@end
