//
//  BoardModal.m
//  代码splite
//
//  Created by INTCO 王伟 on 2016/10/21.
//  Copyright © 2016年 INTCO 王伟. All rights reserved.
//

#import "BoardModal.h"

@implementation BoardModal
/** 自定义构造方法 */
- (instancetype) initWithOrderNum:(NSString *)order andLineNum:(NSString * )line{
    self = [super init];
    if (self) {
        self.orderStr = order;
        self.lineStr    = line;
    }
    return  self;
}

@end
