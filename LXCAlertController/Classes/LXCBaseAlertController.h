//
//  LXCBaseAlertController.h
//  LXCAlertController
//
//  Created by 刘晓晨 on 2019/5/10.
//
/*
    l. 例子  LXCAlertController(下载demo)
 */
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LXCBaseAlertController : UIViewController

@property (nonatomic, strong) UIView *backgroundView;//半透明罩层
@property (nonatomic, strong) UIColor *backgroundColor;//罩层颜色

@property (nonatomic, strong, readonly) UIView *alertView;

// 是否可以点击背景消失（默认为NO）
@property (nonatomic, assign) BOOL tapBackgroundDismissEnable;

+ (instancetype)alertControllerWithAlertView:(UIView *)alertView;

@end

NS_ASSUME_NONNULL_END
