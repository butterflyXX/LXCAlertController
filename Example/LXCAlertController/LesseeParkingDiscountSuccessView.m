//
//  ELLesseeParkingDiscountSuccessView.m
//  ActionSheetPicker-3.0
//
//  Created by 刘晓晨 on 2019/4/27.
//

#import "ELLesseeParkingDiscountSuccessView.h"

@interface ELLesseeParkingDiscountSuccessView ()

@property (nonatomic,strong)UIImageView *iconImageView;

@property (nonatomic,strong)UILabel *titleLabel;

@property (nonatomic,strong)UILabel *subTitleLabel;

@end

@implementation ELLesseeParkingDiscountSuccessView

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
    self.iconImageView.image = kBundleNameImage(@"Group");
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.offset(0);
        make.top.offset(24);
    }];
    
    self.titleLabel = [[UILabel alloc] init];
    
    self.titleLabel.numberOfLines = 0;
    
    self.titleLabel.font = [UIFont fontWithName:@"ArialMT" size:20];
    
    self.titleLabel.textColor = kColor_TextTitle;
    
    [self.contentView addSubview:self.titleLabel];
    
    self.titleLabel.text = title;
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.offset(0);
        make.top.equalTo(self.iconImageView.mas_bottom).offset(20);
    }];
    
    self.subTitleLabel = [[UILabel alloc] init];
    
    self.subTitleLabel.numberOfLines = 0;
    
    self.subTitleLabel.font = [UIFont systemFontOfSize:14];
    
    self.subTitleLabel.textColor = kColor_TextSubTitle;
    
    [self.contentView addSubview:self.subTitleLabel];
    
    self.subTitleLabel.text = subTitle;
    
    [self.subTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.offset(0);
        make.top.equalTo(self.titleLabel.mas_bottom).offset(14);
        make.bottom.offset(-40);
    }];
    
}


-(void)addActionWithButtonTitle:(NSString *)title block:(ELBaseAlertViewButtonActionBlock)actionBlock {
    UIButton *button = [[UIButton alloc] init];
    button.titleLabel.font = [UIFont systemFontOfSize:16];
    button.backgroundColor = kColorWithHex(0xFD6C44);
    [button setTitleColor:kColorWithHex(0xffffff) forState:UIControlStateNormal];
    [button setTitle:title forState:UIControlStateNormal];
    [self setButton:button block:actionBlock];
}

//重写按钮方法
-(void)setButton:(UIButton *)button block:(ELBaseAlertViewButtonActionBlock)actionBlock {
    [super setButton:button block:actionBlock];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.offset(0);
        make.height.offset(48);
        make.leading.offset(0);
        make.bottom.offset(0);
    }];
}

@end
