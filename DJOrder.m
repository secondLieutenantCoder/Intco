//
//  DJOrder.m
//  intcoTest
//
//  Created by INTCO 王伟 on 2017/1/4.
//  Copyright © 2017年 INTCO 王伟. All rights reserved.
//

#import "DJOrder.h"

@implementation DJOrder

+ (NSArray *) getModelArrayWithDataArray:(NSArray *)dataArray{

    NSMutableArray * modelArray = [[NSMutableArray alloc] init];
    
    for (int i=0; i<dataArray.count; i++) {
        DJOrder * djOrder   = [[DJOrder alloc] init];
        djOrder.backId      = [dataArray[i][@"id"] integerValue];
        djOrder.orderKind   = dataArray[i][@"Name"];
        djOrder.approveType = dataArray[i][@"ApproveType"];
        djOrder.productCode = dataArray[i][@"ProductCode"];
        djOrder.customerName= dataArray[i][@"CustomerCode"];
        djOrder.saleMan     = dataArray[i][@"FullName"];
//        djOrder.expectedTime= dataArray[i][@"ExpectedTime"][@"date"];

        [modelArray addObject:djOrder];
    }
    return modelArray;
}

@end
