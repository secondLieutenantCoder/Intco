//
//  RepoDetailViewController.m
//  intcoTest
//
//  Created by INTCO 王伟 on 2016/10/25.
//  Copyright © 2016年 INTCO 王伟. All rights reserved.
//

#import "RepoDetailViewController.h"
#import "RepositoryTableViewCell.h"
#import "OrderDetViewController.h"
#import "ReserveViewController.h"
#import "OrderModal.h"
#import "OPUtil.h"
#import "MBProgressHUD.h"

static NSString * identifier = @"repository";
@interface RepoDetailViewController ()<UITableViewDelegate,UITableViewDataSource,
    ReserveDelegate
>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (weak, nonatomic) IBOutlet UIView *conditionView;

@property (nonatomic,strong) UINavigationController * popNav;
// > 查询条件四项
@property (weak, nonatomic) IBOutlet UILabel *pickedCompany;
@property (weak, nonatomic) IBOutlet UILabel *pickedMaterial;
@property (weak, nonatomic) IBOutlet UILabel *pickedRepository;
@property (weak, nonatomic) IBOutlet UILabel *pickedProjectName;
/** 订购控制器 */
@property (nonatomic,strong) ReserveViewController * reservVC;
@property (weak, nonatomic) IBOutlet UIView *creatOrderView;

/** 创建订单视图的高度 */
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *creatOrderHeight;
/** 确定创建订单按钮 */
@property (weak, nonatomic) IBOutlet UIButton *creatButton;
@property (nonatomic,strong) UIButton * coverButton;

/** 创建订单信息 */
@property (weak, nonatomic) IBOutlet UITextField *orderName;
@property (weak, nonatomic) IBOutlet UITextField *receiverName;
@property (weak, nonatomic) IBOutlet UITextField *receiveAdress;
@property (weak, nonatomic) IBOutlet UITextField *receivePhone;

/** 订单存放数组 */
@property (nonatomic,strong) NSMutableArray * orderArray;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bSpace;

@end

@implementation RepoDetailViewController
/** lazy */
-(ReserveViewController *)reservVC{
    if (_reservVC == nil) {
        _reservVC = [[ReserveViewController alloc] init];
    }
    return _reservVC;
}
-(UIButton *)coverButton{
    if (_coverButton ==nil) {
        // > 盖板尺寸，无需适配横竖屏幕
        _coverButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 1024, 1024)];
        // > 设置颜色和透明度
        _coverButton.backgroundColor = [UIColor lightGrayColor];
        _coverButton.alpha           = 0.6;
        // > 添加事件，点击盖板是的事件
        [_coverButton addTarget:self action:@selector(coverAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _coverButton;
}
-(NSMutableArray *)orderArray{
    if (_orderArray == nil) {
        _orderArray = [NSMutableArray array];
    }
    return _orderArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setSubViews];
    
    // > 注册键盘通知
    NSNotificationCenter * center = [NSNotificationCenter defaultCenter];
    [center addObserver:self selector:@selector(showKeyboard:) name:UIKeyboardWillShowNotification object:nil];
    [center addObserver:self selector:@selector(hiddenKeyboard:) name:UIKeyboardWillHideNotification object:nil];
}
#pragma mark - 键盘 显-隐 套装
#pragma mark *** 键盘显示
- (void)showKeyboard:(NSNotification *)notification{
    CGRect keyboardRect = [notification.userInfo[UIKeyboardFrameBeginUserInfoKey] CGRectValue];
    
    self.bSpace.constant = keyboardRect.size.height;
    CGFloat duration = [notification.userInfo[UIKeyboardAnimationDurationUserInfoKey] floatValue];
    [UIView animateWithDuration:duration animations:^{
        
        [self.view layoutSubviews];
    }];
    NSLog(@"size.height=%lf",keyboardRect.size.height);
    NSLog(@"bSpace.constant=%lf",self.bSpace.constant);
}
#pragma mark *** 键盘隐藏
- (void)hiddenKeyboard:(NSNotification *)notification{
    
    self.bSpace.constant = 0;
    CGFloat duration = [notification.userInfo[UIKeyboardAnimationDurationUserInfoKey] floatValue];
    [UIView animateWithDuration:duration animations:^{
        
        [self.view layoutSubviews];
    }];
}

#pragma mark *** 移除通知中心观察

-(void)dealloc{

    NSNotificationCenter * center = [NSNotificationCenter defaultCenter];

    [center removeObserver:self];
}

- (void) setSubViews{

    self.tableView.delegate   = self;
    self.tableView.dataSource = self;
    
    [self.tableView registerNib:[UINib nibWithNibName:@"RepositoryTableViewCell" bundle:nil] forCellReuseIdentifier:identifier];
    self.tableView.rowHeight  = 100;
    
    // > 展示查询条件
    self.pickedCompany.text      = self.pickedDic[@"company"];
    self.pickedRepository.text   = self.pickedDic[@"repository"];
    self.pickedProjectName.text  = self.pickedDic[@"project"];
    self.pickedMaterial.text     = self.pickedDic[@"material"];
    
    
}

#pragma mark - tableView代理方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return 30;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    RepositoryTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    // cell的选中效果
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.orderDelegate  = self;
    cell.cellIndexPath  = indexPath;
    return cell;
}
- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - pop左按钮
- (void) popLeftAction{

    [self dismissViewControllerAnimated:YES completion:nil];

}
//- (void) showPopVC{
//    
//[self presentViewController:self.popNav animated:YES completion:nil];
//    
//}
#pragma mark - pop右按钮
- (void) popRightAction{

    NSLog(@"提交");
}
#pragma mark - 取消self控制器
- (IBAction)backAction:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)orderDetailAction:(UIButton *)sender {
    
    OrderDetViewController * orderVC = [[OrderDetViewController alloc] init];
    
    [self presentViewController:orderVC animated:YES completion:nil];
}
#pragma mark - cell的订购按钮的代理实现
- (void) orderGoodsWithIndex:(NSIndexPath *) cellIndex{

//    UIViewController * vc = [[UIViewController alloc] init];
    self.reservVC.testLabel.text = [NSString stringWithFormat:@"%ld+%ld",cellIndex.section,cellIndex.row];
    self.reservVC.modalPresentationStyle = UIModalPresentationFormSheet;
    self.reservVC.modalTransitionStyle   = UIModalTransitionStyleCoverVertical;
    
    self.reservVC.popoverPresentationController.permittedArrowDirections = UIPopoverArrowDirectionAny;
    // > 添加导航
    UINavigationController * nav = [[UINavigationController alloc] initWithRootViewController:self.reservVC];
    self.popNav  = nav;
    nav.modalPresentationStyle = UIModalPresentationFormSheet;
    nav.modalTransitionStyle   = UIModalTransitionStyleCoverVertical;
    // > view
    UIView * interView1 =[[UIView alloc] initWithFrame:CGRectMake(50, 50, 500, 200)];
    nav.popoverPresentationController.sourceView = interView1;
    nav.popoverPresentationController.sourceRect = interView1.bounds;
    nav.popoverPresentationController.permittedArrowDirections = UIPopoverArrowDirectionAny;
    self.reservVC.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStyleDone target:self action:@selector(popLeftAction)];
    self.reservVC.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"提交" style:UIBarButtonItemStyleDone target:self action:@selector(popRightAction)];
    
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self presentViewController:_popNav animated:YES completion:nil];
    });
}
#pragma  mark -  创建订单
- (IBAction)creatOrderAction:(UIButton *)sender {
    
    // > 蒙板
    [self.view addSubview:self.coverButton];
    [self.view bringSubviewToFront:self.creatOrderView];
    // > 展开创建视图
    self.creatOrderHeight.constant = 400;
    [UIView animateWithDuration:0.3 animations:^{
        [self.view layoutSubviews];
    }];
    
}
#pragma mark - 确认创建订单
- (IBAction)sureOrderAction:(UIButton *)sender {

    // > 取消创建视图
    [self cancelCreatOrder];
    // > 创建订单信息 字典
    NSDictionary * orderDic = @{@"orderName":self.orderName.text,
                                @"receiveName":self.receiverName.text,
                                @"receiveAddress":self.receiveAdress.text,
                                @"receivePhone":self.receivePhone.text
                                };
     // > 调用工具，存储信息
    [OPUtil saveNewOrderWithDictionary:orderDic];
     // > 处理键盘和输入框
    [self resignKeyboardAndClearTextField];
    ///使用 - HUD -
    // > mbprogressHubd 提示创建订单完成
   MBProgressHUD * hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.labelText = @"正在创建新订单...";
    hud.mode      = MBProgressHUDModeIndeterminate;
    
    // > 1秒
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    
        hud.mode = MBProgressHUDModeCustomView;
        UIImageView * view = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"success"]];
        hud.customView = view;
        hud.labelText  = @"新订单创建成功";
        [hud hide:YES afterDelay:0.5];
        
    });
    
}
#pragma mark ** 盖板的点击事件
- (void) coverAction{

    [self cancelCreatOrder];
    
}
#pragma mark - 创建订单右上角取消按钮的点击事件
- (IBAction)cancelButtonAction:(id)sender {
    [self cancelCreatOrder];
}
#pragma mark ** 取消创建订单
- (void) cancelCreatOrder{
    // > 取消编辑模式（键盘）
    [self.creatOrderView endEditing:YES];
    // > 隐藏创建订单视图
    self.creatOrderHeight.constant = 0;
    [UIView animateWithDuration:0.3 animations:^{
        [self.view layoutSubviews];
    }completion:^(BOOL finished) {
        [self.coverButton removeFromSuperview];
    }];
}
#pragma mark - viewDidDisappear
- (void) viewDidDisappear:(BOOL)animated{

    [super viewDidDisappear:animated];
    // > 退出键盘，清空输入
    [self resignKeyboardAndClearTextField];
}
#pragma mark - 退出键盘+清楚输入
- (void) resignKeyboardAndClearTextField{

    [self.view endEditing:YES];
    // > 清空输入
    self.orderName.text     = @"";
    self.receivePhone.text  = @"";
    self.receiverName.text  = @"";
    self.receiveAdress.text = @"";
}


@end
