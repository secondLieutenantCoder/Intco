//
//  RepositoryTableViewCell.m
//  intcoTest
//
//  Created by INTCO 王伟 on 2016/10/25.
//  Copyright © 2016年 INTCO 王伟. All rights reserved.
//

#import "RepositoryTableViewCell.h"

@interface RepositoryTableViewCell ()

@property (nonatomic,strong) UILongPressGestureRecognizer * press;
@property (weak, nonatomic) IBOutlet UIButton *buyButton;

@end

@implementation RepositoryTableViewCell


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    // > 订购按钮样式
    self.buyButton.layer.cornerRadius  = 15;
    self.buyButton.layer.masksToBounds = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self!=nil) {
        // > 订购按钮样式
        self.buyButton.layer.cornerRadius  = 5;
        self.buyButton.layer.masksToBounds = YES;
    }
    return self;
}
- (IBAction)reserveAction:(id)sender {
    
    [self.orderDelegate orderGoodsWithIndex:self.cellIndexPath];
}



@end
