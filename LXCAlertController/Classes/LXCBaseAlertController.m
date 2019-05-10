//
//  LXCBaseAlertController.m
//  LXCAlertController
//
//  Created by 刘晓晨 on 2019/5/10.
//

#import "LXCBaseAlertController.h"
#import "LXCAlertControllerDelegateManager.h"
#import "Masonry.h"

@interface LXCBaseAlertController ()<UIViewControllerTransitioningDelegate>

@property (nonatomic, strong) UIView *alertView;

@end

@implementation LXCBaseAlertController

- (void)viewDidLoad {
    self.view.backgroundColor = [UIColor clearColor];
    [super viewDidLoad];
    [self.view addSubview:self.alertView];
    [self.alertView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.offset(0);
    }];
    self.backgroundView = [[UIView alloc] init];
    self.backgroundView.backgroundColor = _backgroundColor;
    self.backgroundView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view insertSubview:self.backgroundView atIndex:0];
    [self.backgroundView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.offset(0);
    }];
    
}

+ (instancetype)alertControllerWithAlertView:(UIView *)alertView {
    LXCBaseAlertController *alertViewController = [[self alloc] init];
    [alertViewController configureController];
    alertViewController.alertView = alertView;
    return alertViewController;
}

- (void)configureController {
    // 是否视图控制器定义它呈现视图控制器的过渡风格（默认为NO）
    self.providesPresentationContextTransitionStyle = YES;
    self.definesPresentationContext = YES;
    self.modalPresentationStyle = UIModalPresentationCustom;
    self.transitioningDelegate = self;
    
    _backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.4];
    _tapBackgroundDismissEnable = NO;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if (_tapBackgroundDismissEnable) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

#pragma mark - UIViewControllerTransitioningDelegate
- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    return [LXCAlertControllerDelegateManager animationIsPresenting:YES];
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    return [LXCAlertControllerDelegateManager animationIsPresenting:NO];
}

@end
