//
//  CustomTabBar.h
//  intcoTest
//
//  Created by INTCO 王伟 on 2016/10/21.
//  Copyright © 2016年 INTCO 王伟. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TabBarChangeVC <NSObject>

- (void) changeVCWithIndex:(NSInteger)index;

@end

@interface CustomTabBar : UIView

@property (nonatomic,weak) id<TabBarChangeVC> delegate;
@end
