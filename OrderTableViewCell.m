//
//  OrderTableViewCell.m
//  intcoTest
//
//  Created by INTCO 王伟 on 2016/10/28.
//  Copyright © 2016年 INTCO 王伟. All rights reserved.
//

#import "OrderTableViewCell.h"

@interface OrderTableViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *oName;
@property (weak, nonatomic) IBOutlet UILabel *rPhone;
@property (weak, nonatomic) IBOutlet UILabel *rAdress;
@property (weak, nonatomic) IBOutlet UILabel *rName;



@end

@implementation OrderTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
#pragma  mark - 重写set方法
- (void)setOrderModal:(OrderModal *)orderModal  {

    _orderModal = orderModal;
    
    self.oName.text = orderModal.orderName;
    self.rName.text = orderModal.receiverName;
    self.rPhone.text= orderModal.receivePhone;
    self.rAdress.text = orderModal.receiveAddress;
    
}

@end
