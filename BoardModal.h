//
//  BoardModal.h
//  代码splite
//
//  Created by INTCO 王伟 on 2016/10/21.
//  Copyright © 2016年 INTCO 王伟. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BoardModal : NSObject

/** 订单号 */
@property (nonatomic,strong) NSString * orderStr;

/** 线号 */
@property (nonatomic,strong) NSString * lineStr;

- (instancetype) initWithOrderNum:(NSString *)order andLineNum:(NSString * )line;

@end
