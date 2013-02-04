#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface UINavigationController (Transition)

- (void)pushViewController:(UIViewController *)toViewController
                  duration:(NSTimeInterval)duration
                prelayouts:(void (^)(UIView *fromView, UIView *toView))preparation
                animations:(void (^)(UIView *fromView, UIView *toView))animations
                completion:(void (^)(UIView *fromView, UIView *toView))completion;

- (void)pushViewController:(UIViewController *)toViewController
                  duration:(NSTimeInterval)duration
                   options:(UIViewAnimationOptions)options
                prelayouts:(void (^)(UIView *fromView, UIView *toView))preparation
                animations:(void (^)(UIView *fromView, UIView *toView))animations
                completion:(void (^)(UIView *fromView, UIView *toView))completion;

- (UIViewController *)popViewControllerWithDuration:(NSTimeInterval)duration
                                         prelayouts:(void (^)(UIView *fromView, UIView *toView))preparation
                                         animations:(void (^)(UIView *fromView, UIView *toView))animations
                                         completion:(void (^)(UIView *fromView, UIView *toView))completion;

- (UIViewController *)popViewControllerWithDuration:(NSTimeInterval)duration
                                            options:(UIViewAnimationOptions)options
                                         prelayouts:(void (^)(UIView *fromView, UIView *toView))preparation
                                         animations:(void (^)(UIView *fromView, UIView *toView))animations
                                         completion:(void (^)(UIView *fromView, UIView *toView))completion;

@end
