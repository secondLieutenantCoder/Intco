//
//  DJOrder.h
//  intcoTest
//
//  Created by INTCO 王伟 on 2017/1/4.
//  Copyright © 2017年 INTCO 王伟. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DJOrder : NSObject

/// 数据库id
@property (nonatomic,assign) NSInteger backId;
/** 订单种类 （丁腈、PVC） */
@property(nonatomic,copy) NSString * orderKind;
/** 评审状态 */
@property (nonatomic,copy) NSString * approveType;
/** 产品号 */
@property (nonatomic,copy) NSString * productCode;
/** 客户名称 */
@property (nonatomic,copy) NSString * customerName;
/** 业务员 */
@property (nonatomic,copy) NSString * saleMan;
/** 规格 */
@property (nonatomic,copy) NSString * formatType;
/** 期望交期 */
@property (nonatomic,copy) NSString * expectedTime;

/// 将从网络获取的数据数组 转成 model数组
+ (NSArray *) getModelArrayWithDataArray:(NSArray *)dataArray;

@end
