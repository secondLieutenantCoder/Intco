//
//  BoardTableViewCell.h
//  代码splite
//
//  Created by INTCO 王伟 on 2016/10/17.
//  Copyright © 2016年 INTCO 王伟. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BoardModal.h"

#define cellHeight 100
@interface BoardTableViewCell : UITableViewCell

@property (nonatomic,strong) BoardModal * modal;

@end
