//
//  MBProgressHUD+myHud.h
//  intcoTest
//
//  Created by INTCO 王伟 on 2016/11/1.
//  Copyright © 2016年 INTCO 王伟. All rights reserved.
//

#import "MBProgressHUD.h"

@interface MBProgressHUD (myHud)


/**
 * 使用hud展示成功与否的信息
 */
+(void) showHudInfo:(NSString *)info andSuccess:(BOOL)state;

@end
