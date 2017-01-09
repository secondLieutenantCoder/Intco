//
//  BoardTableViewCell.m
//  代码splite
//
//  Created by INTCO 王伟 on 2016/10/17.
//  Copyright © 2016年 INTCO 王伟. All rights reserved.
//

#import "BoardTableViewCell.h"

@interface BoardTableViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *orderNum;
@property (weak, nonatomic) IBOutlet UILabel *lineNum;

@end

@implementation BoardTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
#pragma mark - 重写构造方法
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
//    UILabel * order = [UILabel alloc] initWithFrame:CGRectMake(5, 5, <#CGFloat width#>, <#CGFloat height#>);
    return self;
}

#pragma mark - 重写set方法
- (void) setModal:(BoardModal *)modal {

    _modal = modal;
    self.orderNum.text = modal.orderStr;
    self.lineNum.text  = modal.lineStr;
    
}

@end
