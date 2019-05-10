//
//  LesseeParkingDiscountSuccessView.h
//  ActionSheetPicker-3.0
//
//  Created by 刘晓晨 on 2019/4/27.
//

#import <UIKit/UIKit.h>
#import "LXCBaseAlertView.h"

NS_ASSUME_NONNULL_BEGIN

@interface LesseeParkingDiscountSuccessView : LXCBaseAlertView

- (instancetype)initWithTitle:(NSString *)title subTitle:(NSString *)subTitle imageName:(NSString *)imageName;

-(void)addActionWithButtonTitle:(NSString *)title block:(LXCBaseAlertViewButtonActionBlock)actionBlock;

@end

NS_ASSUME_NONNULL_END
