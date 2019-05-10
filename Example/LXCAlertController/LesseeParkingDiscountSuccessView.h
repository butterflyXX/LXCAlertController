//
//  ELLesseeParkingDiscountSuccessView.h
//  ActionSheetPicker-3.0
//
//  Created by 刘晓晨 on 2019/4/27.
//

#import <UIKit/UIKit.h>
#import "ELBaseAlertView.h"

NS_ASSUME_NONNULL_BEGIN

@interface ELLesseeParkingDiscountSuccessView : ELBaseAlertView

- (instancetype)initWithTitle:(NSString *)title subTitle:(NSString *)subTitle imageName:(NSString *)imageName;

-(void)addActionWithButtonTitle:(NSString *)title block:(ELBaseAlertViewButtonActionBlock)actionBlock;

@end

NS_ASSUME_NONNULL_END
