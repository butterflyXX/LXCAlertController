//
//  LXCBaseAlertView.h
//  HopsonMall_C
//
//  Created by liuxiaochen on 2019/2/23.
//  Copyright (c) 2019 刘晓晨. All rights reserved.
/*  使用说明:
    1.baseView集成contentView,是用来自定义弹框内容,使用时需要设置contentView的大小(用内部控件填充大小也可以);baseView集成buttonView,是用来自定义按钮的,使用时需要设置contentView的大小(用内部控件填充大小也可以)
    2. 例子:  LesseeParkingDiscountSuccessView(需要下载demo)
 */

#import <UIKit/UIKit.h>

typedef void(^LXCBaseAlertViewButtonActionBlock)(void);

@interface LXCBaseAlertView : UIView

@property (nonatomic,strong)UIView *contentView;
@property (nonatomic,strong)UIView *buttonView;

-(void)dismiss;

-(void)setButton:(UIButton *)button block:(LXCBaseAlertViewButtonActionBlock)actionBlock;

@end
