//
//  INTCOTBViewController.m
//  intcoTest
//
//  Created by INTCO 王伟 on 2016/10/12.
//  Copyright © 2016年 INTCO 王伟. All rights reserved.
//

#import "INTCOTBViewController.h"

#import "UIView+TakeApartFrame.h"
#import "WorkShopViewController.h"
#import "CustomTabBar.h"
#import "WebViewController.h"
#import "BoardViewController.h"
#import "SaleAssitantViewController.h"

#import "SSViewController.h"


@interface INTCOTBViewController ()<TabBarChangeVC>

@property (nonatomic,strong) WorkShopViewController * workShopVC;

@property (nonatomic,strong)  UIView * buttomView;

/** 全局的NewTabBar */
@property (nonatomic,strong) CustomTabBar * customTB;
@end

@implementation INTCOTBViewController{

    NSArray * _controllerArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadData];
    
    [self setSubViews];
    
    // > tabbar的viewControllers
    self.viewControllers = _controllerArray;
    
    // > 设置默认选中的tabbar的控制器 - 一进入默认显示官网
    self.selectedIndex = 0;
    
}
#pragma mark - 加载数据
- (void) loadData{
    
    // > 销售助手
    SaleAssitantViewController *saleAssitantVC = [[SaleAssitantViewController alloc] init];
    UINavigationController * saleNav = [[UINavigationController alloc] initWithRootViewController:saleAssitantVC];
    // > 英科介绍
    WebViewController * webVC = [[WebViewController alloc] init];
    //车间控制器
    WorkShopViewController * fVC = [[WorkShopViewController alloc] init];
    self.workShopVC              = fVC;
    UINavigationController * workShopNav = [[UINavigationController alloc] initWithRootViewController:fVC];
    // > 自助服务
   SSViewController  * ssVC = [[SSViewController alloc] init];
    UINavigationController * ssNav = [[UINavigationController alloc] initWithRootViewController:ssVC];
    _controllerArray = @[webVC,saleNav,workShopNav,ssNav];
    
}
#pragma mark - 加载子视图
- (void) setSubViews{
    
    // > 设置自定义的tabbar 
    [self setNewTabBar];
    
}
#pragma mark - 设置自定义的tabbar
- (void)setNewTabBar{
    
    // > 隐藏自带的tabbar
    self.tabBar.hidden = YES;
    // > 设置底部视图
    self.buttomView = [[UIView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height-kTabBarHeight, self.view.frame.size.width, kTabBarHeight)];
    // > 设置底部视图的颜色和边框
    self.buttomView.backgroundColor = [UIColor whiteColor];
    self.buttomView.layer.borderWidth = 1;
    self.buttomView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    [self.view addSubview:self.buttomView];
    // >设置自定义tabbar
    self.customTB = [[CustomTabBar alloc] init];
    self.customTB.delegate       = self;
    [self.buttomView addSubview:self.customTB];
    // > 根据一开始的屏幕方向确定tabbar
    [self setOriginTabBar];
}
- (void) setOriginTabBar{
    if (self.view.frame.size.width == kLandScapeWidth) {
        self.customTB.x = 150;
    }else{
        self.customTB.x = 150+128;
    }
}
#pragma mark - tabbar的代理方法
- (void) changeVCWithIndex:(NSInteger)index{

    self.selectedIndex = index;
    
}
#pragma mark - 根据屏幕的方向调整自定义的tabbar（1）
- (void) viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator{
    
    // 打印查看size
    BOOL isLandScape = size.width==768?YES:NO;
    CGFloat duration = [coordinator transitionDuration];
    [self setTabBarFrame:isLandScape andInterval:duration];
    // > 告诉workShopVC 目前屏幕的方向
    [self.workShopVC DidTransitionScreenToLandScape:isLandScape];
}
#pragma mark - 根据屏幕的方向，改变TabBar（2）
- (void) setTabBarFrame:(BOOL)isLandScape andInterval:(CGFloat)duration{

    if (isLandScape) {
        [UIView animateWithDuration:duration animations:^{
            self.buttomView.y     = kLandScapeHeight-kTabBarHeight;
            self.buttomView.width = kLandScapeWidth;
            self.customTB.x       = 150;
        }];
        
    }else{
        [UIView animateWithDuration:duration animations:^{
            self.buttomView.y      = kPortraitHeight-kTabBarHeight;
            self.buttomView.width  = kPortraitWidth;
            self.customTB.x        = 150+128;
           
        }];
        
    }
}


@end
