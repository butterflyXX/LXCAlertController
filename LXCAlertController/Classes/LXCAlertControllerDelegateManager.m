//
//  LXCAlertControllerDelegateManager.m
//  LXCAlertController
//
//  Created by 刘晓晨 on 2019/5/10.
//

#import "LXCAlertControllerDelegateManager.h"
#import "LXCBaseAlertController.h"

@interface LXCAlertControllerDelegateManager ()

@property (nonatomic, assign) BOOL isPresenting;

@end

@implementation LXCAlertControllerDelegateManager

- (instancetype)initWithPresenting:(BOOL)isPresenting {
    if (self = [super init]) {
        self.isPresenting = isPresenting;
    }
    return self;
}

+ (instancetype)animationIsPresenting:(BOOL)isPresenting {
    return [[self alloc] initWithPresenting:isPresenting];
}

#pragma mark - UIViewControllerAnimatedTransitioning
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
    if (_isPresenting) {
        [self presentAnimationTransition:transitionContext];
    }else{
        [self dismissAnimationTransition:transitionContext];
    }
}

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return self.isPresenting ? 0.45 : 0.25;
}

- (void)presentAnimationTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    LXCBaseAlertController *alertController = (LXCBaseAlertController *)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    alertController.backgroundView.alpha = 0.0;
    
    alertController.alertView.alpha = 0.0;
    alertController.alertView.transform = CGAffineTransformMakeScale(0.5, 0.5);
    
    UIView *containerView = [transitionContext containerView];
    [containerView addSubview:alertController.view];
    
    [UIView animateWithDuration:0.25 animations:^{
        alertController.backgroundView.alpha = 1.0;
        alertController.alertView.alpha = 1.0;
        alertController.alertView.transform = CGAffineTransformMakeScale(1.05, 1.05);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.2 animations:^{
            alertController.alertView.transform = CGAffineTransformIdentity;
        } completion:^(BOOL finished) {
            [transitionContext completeTransition:YES];
        }];
    }];
}

- (void)dismissAnimationTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    LXCBaseAlertController *alertController = (LXCBaseAlertController *)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    [UIView animateWithDuration:0.25 animations:^{
        alertController.backgroundView.alpha = 0.0;
        alertController.alertView.alpha = 0.0;
        alertController.alertView.transform = CGAffineTransformMakeScale(0.9, 0.9);
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:YES];
    }];
}

#pragma mark - UIViewControllerTransitioningDelegate
- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    return [[self class] animationIsPresenting:YES];
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    return [[self class] animationIsPresenting:NO];
}

@end
