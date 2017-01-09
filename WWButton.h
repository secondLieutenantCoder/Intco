//
//  WWButton.h
//  TabBar动画修改
//
//  Created by jerehedu on 16/6/7.
//  Copyright © 2016年 王伟. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol WWButtonDelegate <NSObject>

- (void) switchController:(NSInteger)index;

@end

@interface WWButton : UIButton

/** 定义代理 */
@property(nonatomic,weak) id<WWButtonDelegate> delegate;

/** 自定义构造方法 */
- (instancetype) initWithFrame:(CGRect)frame andTitle:(NSString *)title andImageName:(NSString *)imageName;



@end
