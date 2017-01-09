//
//  WWItem.m
//  TabBar动画修改
//
//  Created by jerehedu on 16/6/7.
//  Copyright © 2016年 王伟. All rights reserved.
//

#import "WWItem.h"

@implementation WWItem

-(instancetype)initWithTitle:(NSString *)title andImageNmae:(NSString *)imageName{
    
    self=[super init];
    if (self) {
        
        self.title=title;
        
        self.imageName=imageName;
        
    }
    return self;
}

@end
