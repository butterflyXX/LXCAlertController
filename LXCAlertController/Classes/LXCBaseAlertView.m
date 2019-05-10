//
//  LXCBaseAlertView.m
//  HopsonMall_C
//
//  Created by liuxiaochen on 2019/2/23.
//  Copyright (c) 2019 刘晓晨. All rights reserved.
//

#import "LXCBaseAlertView.h"
#import "Masonry.h"

#define kLXCBaseAlertViewColorWithHex(c) [UIColor colorWithRed:((c>>16)&0xFF)/255.0f green:((c>>8)&0xFF)/255.0f blue:(c&0xFF)/255.0f alpha:1.0f]

@interface LXCBaseAlertView ()

@property (nonatomic,strong)NSMutableArray<UIButton *> *buttonsArray;
@property (nonatomic,strong)NSMutableArray<LXCBaseAlertViewButtonActionBlock> *blockArray;

@end

@implementation LXCBaseAlertView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupBaseUI];
        self.buttonsArray = [[NSMutableArray alloc] init];
        self.blockArray = [[NSMutableArray alloc] init];
    }
    return self;
}

-(void)setupBaseUI {
    self.contentView = [[UIView alloc] init];
    self.contentView.backgroundColor = [UIColor whiteColor];
    self.buttonView = [[UIView alloc] init];
    self.buttonView.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.contentView];
    [self addSubview:self.buttonView];
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.offset(0);
        make.centerX.offset(0);
        make.top.offset(0);
    }];

    [self.buttonView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.offset(0);
        make.centerX.offset(0);
        make.bottom.offset(0);
        make.top.equalTo(self.contentView.mas_bottom);
    }];
}

-(void)buttonAction:(UIButton *)sender {
    NSInteger index = [self.buttonsArray indexOfObject:sender];
    LXCBaseAlertViewButtonActionBlock block = self.blockArray[index];
    [self dismiss];
    if (block) {
        block();
    }
}

//子view需要继承这个方法实现button布局
-(void)setButton:(UIButton *)button block:(LXCBaseAlertViewButtonActionBlock)actionBlock {
    [self.buttonView addSubview:button];
    [self.buttonsArray addObject:button];
    [self.blockArray addObject:[actionBlock copy]];
    [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)dismiss {
    [self.viewController dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - 通过响应者链找到UIViewController
- (UIViewController*)viewController {
    for (UIView* next = [self superview]; next; next = next.superview) {
        UIResponder* nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController*)nextResponder;
        }
    }
    return nil;
}

@end
