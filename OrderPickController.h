//
//  OrderPickController.h
//  intcoTest
//
//  Created by INTCO 王伟 on 2016/10/31.
//  Copyright © 2016年 INTCO 王伟. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PickOrderDelegate <NSObject>

- (void) pickOrderWithName:(NSString *) orderName;

@end

@interface OrderPickController : UITableViewController
@property (nonatomic,weak) id<PickOrderDelegate> pickDelegate;

@end
