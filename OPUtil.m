//
//  OPUtil.m
//  intcoTest
//
//  Created by INTCO 王伟 on 2016/11/1.
//  Copyright © 2016年 INTCO 王伟. All rights reserved.
//

#import "OPUtil.h"

@implementation OPUtil

#pragma mark - 基础方法 -- 取数据
+ (NSMutableArray *) userDefaultsGetPrimaryAction{
    
    // > NSUserDefaulrs 单例初始化
    NSUserDefaults * userD = [NSUserDefaults standardUserDefaults];
    // > 获取内存数据
    NSMutableArray * orderArray = [NSMutableArray arrayWithArray:[userD valueForKey:@"orderInfo"]];
    
    return orderArray;
    
}
#pragma mark - 基础方法-- 存数据
+ (void) userDefaultsStorePrimaryAction:(NSArray *)array{

    NSUserDefaults * userD = [NSUserDefaults standardUserDefaults];
    
    [userD setObject:array forKey:@"orderInfo"];
    
    [userD synchronize];
    
}

#pragma mark - 存储新创建的订单信息
+ (void) saveNewOrderWithDictionary:(NSDictionary *)orderDic{
    
   NSMutableArray * orderArray = [self userDefaultsGetPrimaryAction];
    //  > 添加新订单
    [orderArray addObject:orderDic];
    
    [self userDefaultsStorePrimaryAction:orderArray];

}
#pragma mark - 删除已经存在的订单信息
+ (void) deleteExistOrderWithIndex:(NSInteger) index{

    NSMutableArray * orderArray = [self userDefaultsGetPrimaryAction];
    
    [orderArray removeObjectAtIndex:index];
    
    [self userDefaultsStorePrimaryAction:orderArray];
    
}

#pragma mark - 返回订单名称
+(NSArray *) pickOrderName{

    NSMutableArray * orderArray = [self userDefaultsGetPrimaryAction];
    
    NSMutableArray * nameArray = [NSMutableArray array];
    for (NSDictionary * d in orderArray) {
        [nameArray addObject:d[@"orderName"]];
    }
    
    return nameArray;
}



@end
