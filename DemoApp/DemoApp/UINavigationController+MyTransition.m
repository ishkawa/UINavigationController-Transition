#import "UINavigationController+MyTransition.h"
#import "UINavigationController+Transition.h"

@implementation UINavigationController (MyTransition)

//这个是协议回调，所以需要遵循 UIGestureRecognizerDelegate协议
-(void)handleSwipeFrom:(UISwipeGestureRecognizer *)recognizer {
    if (recognizer == nil) return;
    if (recognizer.direction==UISwipeGestureRecognizerDirectionDown) {
        NSLog(@"向下滑动");
        //执行程序
    }
    if (recognizer.direction==UISwipeGestureRecognizerDirectionUp) {
        
        NSLog(@"向上滑动");
        //执行程序
    }
    if (recognizer.direction==UISwipeGestureRecognizerDirectionLeft) {
        
        NSLog(@"向左滑动");
        //执行程序
    }
    if (recognizer.direction==UISwipeGestureRecognizerDirectionRight) {
        
        NSLog(@"向右滑动");
        //执行程序
        [self popViewControllerWithDuration:.7f
                                 prelayouts:^(UIView *fromView, UIView *toView) {
                                     toView.transform = CGAffineTransformMakeScale(.85, .85);
                                 }
                                 animations:^(UIView *fromView, UIView *toView) {
                                     toView.transform = CGAffineTransformMakeScale(1, 1);
                                     fromView.frame = CGRectMake(-fromView.frame.size.height,
                                                                 0,
                                                                 fromView.frame.size.width,
                                                                 fromView.frame.size.height);
                                 }
                                 completion:nil];
    }
}

- (void)customPushViewController:(UIViewController *)viewController
{
    UISwipeGestureRecognizer *recognizer;
    
    //向右滑动
    recognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeFrom:)];
    [recognizer setDirection:(UISwipeGestureRecognizerDirectionRight)];
    [[self view] addGestureRecognizer:recognizer];
    [recognizer release];
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
