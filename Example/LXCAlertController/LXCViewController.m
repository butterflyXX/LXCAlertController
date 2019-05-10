//
//  LXCViewController.m
//  LXCAlertController
//
//  Created by 刘晓晨 on 05/10/2019.
//  Copyright (c) 2019 刘晓晨. All rights reserved.
//

#import "LXCViewController.h"
#import "LXCAlertController.h"

@interface LXCViewController ()

@end

@implementation LXCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    LXCAlertController *alertController = [LXCAlertController alertControllerWithTitle:@"减免成功" subTitle:@"请提醒顾客使用“合生通”进行停车缴费" imageName:@""];
    [alertController addActionWithButtonTitle:@"确定" block:^{
        
    }];
    
    [self presentViewController:alertController animated:YES completion:nil];
    
}

@end
