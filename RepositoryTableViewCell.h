//
//  RepositoryTableViewCell.h
//  intcoTest
//
//  Created by INTCO 王伟 on 2016/10/25.
//  Copyright © 2016年 INTCO 王伟. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 * 代理协议，服务于cell中的订购button
*/
@protocol ReserveDelegate <NSObject>

- (void) orderGoodsWithIndex:(NSIndexPath *) cellIndex;

@end
@interface RepositoryTableViewCell : UITableViewCell

@property (nonatomic,strong) NSIndexPath * cellIndexPath;

@property (nonatomic,weak) id<ReserveDelegate> orderDelegate;

@end
