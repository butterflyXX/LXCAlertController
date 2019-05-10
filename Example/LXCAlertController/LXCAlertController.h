//
//  LXCAlertController.h
//  LXCAlertController_Example
//
//  Created by 刘晓晨 on 2019/5/10.
//  Copyright © 2019 刘晓晨. All rights reserved.
//

#import "LXCBaseAlertController.h"
#import "LesseeParkingDiscountSuccessView.h"

typedef void(^EasyBlock)(void);

NS_ASSUME_NONNULL_BEGIN

@interface LXCAlertController : LXCBaseAlertController

@property (nonatomic,weak)LesseeParkingDiscountSuccessView *el_alertView;

+(instancetype)alertControllerWithTitle:(NSString *)title subTitle:(NSString *)subTitle imageName:(NSString *)imageName;

-(void)addActionWithButtonTitle:(NSString *)title block:(EasyBlock)block;

@end

NS_ASSUME_NONNULL_END
