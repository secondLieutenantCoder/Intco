//
//  MBProgressHUD+myHud.m
//  intcoTest
//
//  Created by INTCO 王伟 on 2016/11/1.
//  Copyright © 2016年 INTCO 王伟. All rights reserved.
//

#import "MBProgressHUD+myHud.h"

@implementation MBProgressHUD (myHud)

#pragma mark - 使用hud展示成功与否的信息
+(void) showHudInfo:(NSString *)info andSuccess:(BOOL)state{
    
    UIWindow * window = [UIApplication sharedApplication].keyWindow;
    MBProgressHUD * hud = [MBProgressHUD showHUDAddedTo:window animated:YES];
    hud.labelText = info;
    hud.mode      = MBProgressHUDModeCustomView;

    // > 自定义view
    UIImageView * cView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:state?@"success":@"error"]];
    hud.customView = cView;
    [hud hide:YES afterDelay:1];
    
}

@end
