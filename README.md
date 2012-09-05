## Requirements

iOS4 or later

## Usage

- add files in `UINavigationController+Transition/` to your xcode project.

```objectivec
#import "UINavigationController+Transition.h"
```

- push viewcontroller

```objectivec
[self.navigationController pushViewController:viewController
                                     duration:.3f
                                   prelayouts:^(UIView *fromView, UIView *toView) {
                                       ;
                                   }
                                   animations:^(UIView *fromView, UIView *toView) {
                                       ;
                                   }
                                   completion:^(UIView *fromView, UIView *toView) {
                                       ;
                                   }];
```

- pop viewcontroller

```objectivec
[self.navigationController popViewControllerWithDuration:.3f
                                              prelayouts:^(UIView *fromView, UIView *toView) {
                                                  ;
                                              }
                                              animations:^(UIView *fromView, UIView *toView) {
                                                  ;
                                              }
                                              completion:^(UIView *fromView, UIView *toView) {
                                                  ;
                                              }];
```

## Shortcut

make your custom category on UINavigationController.  

#### Example

`UINavigationController+MyTransition.h`

```objectivec
#import <UIKit/UIKit.h>

@interface UINavigationController (MyTransition)

- (void)customPushViewController:(UIViewController *)viewController;
- (UIViewController *)customPopViewController;

@end
```

`UINavigationController+MyTransition.m`

```objectivec
#import "UINavigationController+MyTransition.h"
#import "UINavigationController+Transition.h"

@implementation UINavigationController (MyTransition)

- (void)customPushViewController:(UIViewController *)viewController
{
    [self pushViewController:viewController
                    duration:.3f
                  prelayouts:^(UIView *fromView, UIView *toView) {
                      toView.frame = CGRectMake(0,
                                                -toView.frame.size.height,
                                                toView.frame.size.width,
                                                toView.frame.size.height);
                  }
                  animations:^(UIView *fromView, UIView *toView) {
                      toView.frame = CGRectMake(0, 0,
                                                toView.frame.size.width,
                                                toView.frame.size.height);
                      
                      fromView.transform = CGAffineTransformMakeScale(.7, .7);
                  }
                  completion:^(UIView *fromView, UIView *toView) {
                      fromView.transform = CGAffineTransformMakeScale(1, 1);
                  }];
}

- (UIViewController *)customPopViewController
{
    return [self popViewControllerWithDuration:.3f
                                    prelayouts:^(UIView *fromView, UIView *toView) {
                                        toView.transform = CGAffineTransformMakeScale(.7, .7);
                                    }
                                    animations:^(UIView *fromView, UIView *toView) {
                                        toView.transform = CGAffineTransformMakeScale(1, 1);
                                        fromView.frame = CGRectMake(0,
                                                                    -fromView.frame.size.height,
                                                                    fromView.frame.size.width,
                                                                    fromView.frame.size.height);
                                    }
                                    completion:nil];
}

@end
```

## License

MIT
