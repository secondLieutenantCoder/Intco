//
//  WWItem.h
//  TabBar动画修改
//
//  Created by jerehedu on 16/6/7.
//  Copyright © 2016年 王伟. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WWItem : NSObject

@property(nonatomic,copy) NSString * title;

@property(nonatomic,copy) NSString * imageName;

-(instancetype)initWithTitle:(NSString *)title andImageNmae:(NSString *)imageName;

@end
