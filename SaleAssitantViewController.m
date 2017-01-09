//
//  SaleAssitantViewController.m
//  intcoTest
//
//  Created by INTCO 王伟 on 2016/10/25.
//  Copyright © 2016年 INTCO 王伟. All rights reserved.
//

#import "SaleAssitantViewController.h"
#import "RepoDetailViewController.h"
#import "CompanyViewController.h"
#import "RepositoryViewController.h"

@interface SaleAssitantViewController ()<ChangeCompanyTitle,ChangeRepositoryDelegate>
@property (weak, nonatomic) IBOutlet UIButton *companyButton;
@property (weak, nonatomic) IBOutlet UIButton *repositoryButton;
@property (weak, nonatomic) IBOutlet UITextField *materialTF;
@property (weak, nonatomic) IBOutlet UITextField *projectTF;
@property (weak, nonatomic) IBOutlet UIButton *searchButton;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segment;
/** 公司选择控制器 */
@property (nonatomic,strong) CompanyViewController * companyVC;
/** 仓库的选择控制器 */
@property (nonatomic,strong) RepositoryViewController * reposVC;
@property (weak, nonatomic) IBOutlet UIButton *companyPickButton;
@property (weak, nonatomic) IBOutlet UIButton *reposPickButton;

@end

@implementation SaleAssitantViewController

/** lazy */
-(CompanyViewController *)companyVC{
    if (_companyVC == nil) {
        _companyVC = [[CompanyViewController alloc] init];
    }
    return _companyVC;
}
-(RepositoryViewController *)reposVC{
    if (_reposVC == nil) {
        _reposVC = [[RepositoryViewController alloc] init];
    }
    return _reposVC;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.hidden = YES;
    
    // > 加载控制器数据
    [self loadData];
    // > 子视图设置
    [self setSubViews];
    
    NSLog(@"/Users/intcowangwei/Desktop/svnUse");
}

#pragma mark - 加载控制器数据
- (void) loadData{

    self.companyVC.delegate            = self.reposVC;
    
    self.companyVC.changeTitleDelegate = self;
    self.reposVC.delegate              = self;
    
}
#pragma mark - 设置子视图
- (void) setSubViews{
    // > 搜索按钮圆角
    self.searchButton.layer.cornerRadius = 5;
    // > 文字居中
    self.materialTF.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    self.materialTF.contentVerticalAlignment   = UIControlContentVerticalAlignmentCenter;
}
- (IBAction)segmentAction:(UISegmentedControl *)sender {
    
    if (sender.selectedSegmentIndex == 0) {
        
        [[self.view.subviews lastObject] removeFromSuperview];
//        NSLog(@"%ld",sender.selectedSegmentIndex);
    }else{
//    NSLog(@"%ld",sender.selectedSegmentIndex);
        UIView * orderView = [[UIView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height-64-49)];
        orderView.backgroundColor = [UIColor redColor];
        [self.view addSubview:orderView];
    }
}
#pragma mark - 公司选择事件
- (IBAction)selectCompanyAction:(UIButton *)sender {
    
    // > 1测试pop
    // > 懒加载弹出控制器
    // > 2弹出控制器的样式
    self.companyVC.modalPresentationStyle = UIModalPresentationPopover;
    // > 3弹出的动画的效果
    self.companyVC.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    // > 弹出位置设置
    self.companyVC.popoverPresentationController.sourceView = sender;
    self.companyVC.popoverPresentationController.sourceRect =sender.bounds;
    self.companyVC.popoverPresentationController.permittedArrowDirections=UIPopoverArrowDirectionUp;
    // > 4 导航控制器
    [self presentViewController:self.companyVC animated:YES completion:nil];

}
#pragma mark - 仓库选择事件
- (IBAction)selectRepository:(UIButton *)sender {
    
    // > 1测试pop
    
    // > 2弹出控制器的样式
    self.reposVC.modalPresentationStyle = UIModalPresentationPopover;
    // > 3弹出的动画的效果
    self.reposVC.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    // > 弹出位置设置
    self.reposVC.popoverPresentationController.sourceView = sender;
    // > 弹出的位置--相对于sender
    self.reposVC.popoverPresentationController.sourceRect =CGRectMake(30, 30, 0, 0);
    self.reposVC.popoverPresentationController.permittedArrowDirections=UIPopoverArrowDirectionUp;
    // > 4 导航控制器
    [self presentViewController:self.reposVC animated:YES completion:nil];
}
- (IBAction)repositorySearchAction:(UIButton *)sender {
    
    RepoDetailViewController * rdVC = [[RepoDetailViewController alloc] init];
    // > 包含查询信息的字典
    rdVC.pickedDic = @{
                       @"company"   :self.companyButton.titleLabel.text,
                       @"repository":self.repositoryButton.titleLabel.text,
                       @"material"  :self.materialTF.text,
                       @"project"   :self.projectTF.text
                       };
    rdVC.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;

    [self presentViewController:rdVC animated:YES completion:nil];
}
#pragma mark -值改变的代理方法
- (void) changeCompanyTitleWithNewTitle:(NSString *)newTitle{

    [self.companyButton setTitle:newTitle forState:UIControlStateNormal];
}

- (void) changeRepositoryWithRepoName:(NSString *)repoName{

    [self.repositoryButton setTitle:repoName forState:UIControlStateNormal];
}

@end
