//
//  OrderModal.h
//  intcoTest
//
//  Created by INTCO 王伟 on 2016/10/28.
//  Copyright © 2016年 INTCO 王伟. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OrderModal : NSObject
/** 订单名 */
@property (nonatomic,strong) NSString * orderName;
/** 收货人姓名 */
@property (nonatomic,strong) NSString * receiverName;
/** 收货人地址 */
@property (nonatomic,strong) NSString * receiveAddress;
/** 收货人电话 */
@property (nonatomic,strong) NSString * receivePhone;
/** 日期 */
@property (nonatomic,strong) NSString * receiveDate;

- (instancetype) initWithOrderName:(NSString *)orderName andReceiverInfoName:(NSString *)rName adress:(NSString *)rAddress phoneNum:(NSString *)rPhone date:(NSString *)rDate;
/**
 *字典数组转模型数组
*/
+ (NSArray *) getModalArrayFromDicArray:(NSArray *)dicArray;

@end
