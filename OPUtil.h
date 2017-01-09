//
//  OPUtil.h
//  intcoTest
//
//  Created by INTCO 王伟 on 2016/11/1.
//  Copyright © 2016年 INTCO 王伟. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OPUtil : NSObject

/**
 * 新订单存储
 */
+ (void) saveNewOrderWithDictionary:(NSDictionary *)orderDic;

/**
 * 删除已经存在的订单
 */
+ (void) deleteExistOrderWithIndex:(NSInteger) index;

/**
 * 返回订单名称供选择
 */
+ (NSArray * ) pickOrderName;

@end
