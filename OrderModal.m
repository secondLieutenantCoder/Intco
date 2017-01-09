//
//  OrderModal.m
//  intcoTest
//
//  Created by INTCO 王伟 on 2016/10/28.
//  Copyright © 2016年 INTCO 王伟. All rights reserved.
//

#import "OrderModal.h"

@implementation OrderModal
#pragma mark - 自定义构造方法
//
- (instancetype) initWithOrderName:(NSString *)orderName andReceiverInfoName:(NSString *)rName adress:(NSString *)rAddress phoneNum:(NSString *)rPhone date:(NSString *)rDate{

    self = [super init];
    if (self) {
        _orderName      = orderName;
        _receiverName   = rName;
        _receiveAddress = rAddress;
        _receivePhone   = rPhone;
        _receiveDate    = rDate;
    }
    return self;
}

#pragma mark - 字典数组转modal数组
+ (NSMutableArray *) getModalArrayFromDicArray:(NSArray *)dicArray{
/*
    @{@"orderName":self.orderName.text,@"receiveName":self.receiverName.text,@"receiveAddress":self.receiveAdress.text,@"receivePhone":self.receivePhone.text,@"receiveDate":self.receiveData.text};
 */
    NSMutableArray * mutabArray = [[NSMutableArray alloc] init];
    for (int i=0; i<dicArray.count; i++) {
         OrderModal * oModal = [[OrderModal alloc] init];
        NSDictionary * tempDic = dicArray[i];
        oModal.orderName = tempDic[@"orderName"];
        oModal.receiverName = tempDic[@"receiveName"];
        oModal.receivePhone = tempDic[@"receivePhone"];
        oModal.receiveAddress = tempDic[@"receiveAddress"];
        oModal.receiveDate    = tempDic[@"receiveDate"];
        [mutabArray  addObject:oModal];
    }
    return mutabArray;
    
}

@end
