//
//  WorkShopViewController.m
//  代码splite
//
//  Created by INTCO 王伟 on 2016/10/14.
//  Copyright © 2016年 INTCO 王伟. All rights reserved.
//

#import "WorkShopViewController.h"
#import "WorkShopTopView.h"
// 车间四项控制器
#import "BoardViewController.h"
#import "UIView+TakeApartFrame.h"

@interface WorkShopViewController ()<WorkShopSwitchDelegate>

@property (nonatomic,strong) WorkShopTopView * wView;

@end

@implementation WorkShopViewController{
    UIViewController * _popVC;
}

#pragma mark - 视图将要出现
- (void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    // > 此时推出车间看板控制器，效果：默认选中
    // > 添加boardVC的视图
    BoardViewController * boardVC = [[BoardViewController alloc] init];
    boardVC.view.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:boardVC.view];
    // > 容器类 强引用
    [self addChildViewController:boardVC];

    
}
#pragma mark - 视图已经加载
- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self loadData];
    [self setSubViews];
    
    
    
}
-(void) loadData{

}
#pragma mark - 子视图设置
- (void) setSubViews{
    // > 0 设置顶部控制视图的背景视图
    UIView * topBack = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 64)];
    topBack.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    topBack.backgroundColor = [UIColor lightGrayColor];
    [self.navigationController.view addSubview:topBack];
    
    // >1 初始化顶部控制视图
    self.wView = [[WorkShopTopView alloc] initWithFrame:CGRectMake(84, 20, 600, 44)];
    self.wView.delegate = self;
    // > 1.5 根据当前的屏幕情况确定 “x”
    [self setOriginWViewX];
    // >2 隐藏bar
    self.navigationController.navigationBar.hidden = YES;
    [self.navigationController.view addSubview:self.wView];
  
}
#pragma mark - 根据屏幕方向确定顶部视图的位置
#pragma mark ** 根据程序启动时的屏幕方向确定顶部视图的位置
- (void)setOriginWViewX{
    
    if (self.view.frame.size.width == kLandScapeWidth) {
        self.wView.x = 84;
    }else{
        self.wView.x = 84+128;
    }
}
#pragma mark - 根据屏幕的转动方向确定顶部视图的位置
-(void) DidTransitionScreenToLandScape:(BOOL)isLabdScape{
    
    self.wView.x = isLabdScape?84:(84+128);
}
#pragma mark - 根据所选的button的tag值弹出不同的生产控制器
- (void) swtichWorkShopVC:(NSInteger) tagNum{

    switch (tagNum) {
        case 0:{
            BoardViewController * boardVC = [[BoardViewController alloc] init];
            boardVC.view.backgroundColor = [UIColor redColor];
            [self.navigationController pushViewController:boardVC animated:YES];
        }
            break;
        case 1:
        {
            UIViewController * boardVC = [[UIViewController alloc] init];
            boardVC.view.backgroundColor = [UIColor orangeColor];
            [self.navigationController pushViewController:boardVC animated:YES];
        }
            break;
        case 2:
        {
            UIViewController * boardVC = [[UIViewController alloc] init];
            boardVC.view.backgroundColor = [UIColor yellowColor];
            [self.navigationController pushViewController:boardVC animated:YES];
        }
            break;
        case 3:
        {
            UIViewController * boardVC = [[UIViewController alloc] init];
            boardVC.view.backgroundColor = [UIColor greenColor];
            [self.navigationController pushViewController:boardVC animated:YES];
        }
            break;
            
        default:
            break;
    }
}



//  测试弹出控制器  -- popoverViewController
- (void) popAction:(UIButton *)b{
    
    // > 测试pop
    //    UIViewController * pVC= [[UIViewController alloc] init];
    _popVC = [[UIViewController alloc] init];
    _popVC.modalPresentationStyle = UIModalPresentationPopover;
    UIView * interView =[[UIView alloc] initWithFrame:CGRectMake(50, 50, 500, 200)];
    _popVC.popoverPresentationController.sourceView = b;
    _popVC.popoverPresentationController.sourceRect =interView.bounds;
    _popVC.popoverPresentationController.permittedArrowDirections=UIPopoverArrowDirectionUp;

    [self presentViewController:_popVC animated:YES completion:nil];
}
@end
