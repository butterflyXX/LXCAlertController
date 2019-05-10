//
//  LesseeParkingDiscountSuccessView.m
//  ActionSheetPicker-3.0
//
//  Created by 刘晓晨 on 2019/4/27.
//

#import "LesseeParkingDiscountSuccessView.h"
#import <Masonry.h>

@interface LesseeParkingDiscountSuccessView ()

@property (nonatomic,strong)UIImageView *iconImageView;

@property (nonatomic,strong)UILabel *titleLabel;

@property (nonatomic,strong)UILabel *subTitleLabel;

@end

@implementation LesseeParkingDiscountSuccessView


//每一个自定义都有自己的需求,这个方法实现自己的页面自定义需求
- (instancetype)initWithTitle:(NSString *)title subTitle:(NSString *)subTitle imageName:(NSString *)imageName {
    if (self = [super initWithFrame:CGRectZero]) {
        self.layer.cornerRadius = 6;
        self.layer.masksToBounds = YES;
        [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.offset(295);
        }];
        [self setupUIWithTitle:title subTitle:subTitle imageName:imageName];
    }
    return self;
}

-(void)setupUIWithTitle:(NSString *)title subTitle:(NSString *)subTitle imageName:(NSString *)imageName {
    
    self.iconImageView = [[UIImageView alloc] init];
    [self.contentView addSubview:self.iconImageView];
    self.iconImageView.image = [UIImage imageNamed:@"Group"];
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.offset(0);
        make.top.offset(24);
    }];
    
    self.titleLabel = [[UILabel alloc] init];
    
    self.titleLabel.numberOfLines = 0;
    
    self.titleLabel.font = [UIFont fontWithName:@"ArialMT" size:20];
    
    self.titleLabel.textColor = [UIColor blackColor];
    
    [self.contentView addSubview:self.titleLabel];
    
    self.titleLabel.text = title;
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.offset(0);
        make.top.equalTo(self.iconImageView.mas_bottom).offset(20);
    }];
    
    self.subTitleLabel = [[UILabel alloc] init];
    
    self.subTitleLabel.numberOfLines = 0;
    
    self.subTitleLabel.font = [UIFont systemFontOfSize:14];
    
    self.subTitleLabel.textColor = [UIColor blackColor];
    
    [self.contentView addSubview:self.subTitleLabel];
    
    self.subTitleLabel.text = subTitle;
    
    [self.subTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.offset(0);
        make.top.equalTo(self.titleLabel.mas_bottom).offset(14);
        make.bottom.offset(-40);
    }];
    
}

//每一个自定义都有自己的需求,这个方法实现自己的按钮自定义需求
-(void)addActionWithButtonTitle:(NSString *)title block:(LXCBaseAlertViewButtonActionBlock)actionBlock {
    UIButton *button = [[UIButton alloc] init];
    button.titleLabel.font = [UIFont systemFontOfSize:16];
    button.backgroundColor = [UIColor redColor];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setTitle:title forState:UIControlStateNormal];
    [self setButton:button block:actionBlock];
}

//重写按钮方法,这个方法是用来绑定按钮,并实现b按钮布局,因为框架内部只是设置了关联,没有对按钮布局(因为布局是需要用户根据自己的需要自定义的),需要继承super,并实现布局
//  *******内部盛放button的view是自动填充大小的,所以用户添加的button需要去支撑buttonContentView
-(void)setButton:(UIButton *)button block:(LXCBaseAlertViewButtonActionBlock)actionBlock {
    [super setButton:button block:actionBlock];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.offset(0);
        make.height.offset(48);
        make.leading.offset(0);
        make.bottom.offset(0);
    }];
}

@end
