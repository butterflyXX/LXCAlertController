//
//  LXCAlertController.m
//  LXCAlertController_Example
//
//  Created by 刘晓晨 on 2019/5/10.
//  Copyright © 2019 刘晓晨. All rights reserved.
//

#import "LXCAlertController.h"

@interface LXCAlertController ()

@end

@implementation LXCAlertController

+(instancetype)alertControllerWithTitle:(NSString *)title subTitle:(NSString *)subTitle imageName:(NSString *)imageName {
    LesseeParkingDiscountSuccessView *alertView = [[LesseeParkingDiscountSuccessView alloc] initWithTitle:title subTitle:subTitle imageName:imageName];
    
    LXCAlertController *alertController = [self alertControllerWithAlertView:alertView];
//    alertController.tapBackgroundDismissEnable = YES;
    alertController.el_alertView = alertView;
    return alertController;
}

-(void)addActionWithButtonTitle:(NSString *)title block:(EasyBlock)block {
    [self.el_alertView addActionWithButtonTitle:title block:[block copy]];
}

@end
