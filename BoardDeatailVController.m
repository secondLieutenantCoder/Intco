//
//  BoardDeatailVController.m
//  代码splite
//
//  Created by INTCO 王伟 on 2016/10/20.
//  Copyright © 2016年 INTCO 王伟. All rights reserved.
//

#import "BoardDeatailVController.h"

@interface BoardDeatailVController ()

@end

@implementation BoardDeatailVController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor redColor];
}
- (IBAction)backAction:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
