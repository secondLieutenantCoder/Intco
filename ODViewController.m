//
//  ODViewController.m
//  intcoTest
//
//  Created by INTCO 王伟 on 2016/11/1.
//  Copyright © 2016年 INTCO 王伟. All rights reserved.
//

#import "ODViewController.h"

@interface ODViewController ()

@end

@implementation ODViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 300, 60)];
    label.backgroundColor = [UIColor cyanColor];
    label.text      = @"订单的详细界面";
    label.center    = self.view.center;
    [self.view addSubview:label];
    
}
- (IBAction)backAction:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
