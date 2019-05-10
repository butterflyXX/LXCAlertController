//
//  LXCAlertControllerDelegateManager.h
//  LXCAlertController
//
//  Created by 刘晓晨 on 2019/5/10.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LXCAlertControllerDelegateManager : NSObject<UIViewControllerTransitioningDelegate,UIViewControllerAnimatedTransitioning>




@property (nonatomic, assign, readonly) BOOL isPresenting;

+ (instancetype)animationIsPresenting:(BOOL)isPresenting;

- (void)presentAnimationTransition:(id<UIViewControllerContextTransitioning>)transitionContext;

- (void)dismissAnimationTransition:(id<UIViewControllerContextTransitioning>)transitionContext;

- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext;

@end

NS_ASSUME_NONNULL_END
