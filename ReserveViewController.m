//
//  ReserveViewController.m
//  intcoTest
//
//  Created by INTCO 王伟 on 2016/10/27.
//  Copyright © 2016年 INTCO 王伟. All rights reserved.
//

#import "ReserveViewController.h"
#import "OrderPickController.h"

@interface ReserveViewController ()<PickOrderDelegate>
@property (weak, nonatomic) IBOutlet UIButton *pickOrderBtn;

@end

@implementation ReserveViewController

/** lazy */


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.pickOrderBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
}

- (IBAction)pickOrderAction:(UIButton *)sender {
    
    NSLog(@"%s",__func__);
    // > 初始化要弹出的控制器
    OrderPickController * vc = [[OrderPickController alloc] init];
    vc.view.backgroundColor = [UIColor blueColor];
    /**  设置代理
     */
    vc.pickDelegate = self;
     // > 设置弹出的控制器的显示样式
    vc.modalPresentationStyle = UIModalPresentationPopover;
     // > 弹出模式
    vc.modalTransitionStyle   = UIModalTransitionStyleFlipHorizontal;
    // > 弹出控制器的尺寸
    vc.preferredContentSize = CGSizeMake(300, 150);
    // > 弹出控制器的箭头指向的view
    vc.popoverPresentationController.sourceView = sender;
    // > 弹出视图的箭头的“尖”的坐标 - 以sourceView的（0，0，0，0）为基准结合sourceRect。系统默认width/2使用。（sender.bounds的位置即：在sender的底部边缘居中）
    vc.popoverPresentationController.sourceRect = sender.bounds;
    // > 箭头的指向（上，下，左，右）
    vc.popoverPresentationController.permittedArrowDirections = UIPopoverArrowDirectionUp;
    // > presentVC
    [self presentViewController:vc animated:YES completion:nil];
    
}

#pragma mark - 代理cell方法
- (void) pickOrderWithName:(NSString *) orderName{

    [self.pickOrderBtn setTitle:orderName forState:UIControlStateNormal];
}



@end
