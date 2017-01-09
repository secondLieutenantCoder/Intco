//
//  WorkShopTopView.h
//  代码splite
//
//  Created by INTCO 王伟 on 2016/10/15.
//  Copyright © 2016年 INTCO 王伟. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol WorkShopSwitchDelegate <NSObject>

- (void) swtichWorkShopVC:(NSInteger) tagNum;

@end
@interface WorkShopTopView : UIView

@property (nonatomic,weak) id<WorkShopSwitchDelegate> delegate;

@end
