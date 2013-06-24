#import <UIKit/UIKit.h>

@interface UINavigationController (MyTransition)

- (void)customPushViewController:(UIViewController *)viewController;
- (UIViewController *)customPopViewController;

@end
