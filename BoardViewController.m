//
//  BoardViewController.m
//  代码splite
// 
//  Created by INTCO 王伟 on 2016/10/17.
//  Copyright © 2016年 INTCO 王伟. All rights reserved.
//

#import "BoardViewController.h"
#import "BoardTableViewCell.h"
#import "BoardDeatailVController.h"//看板详情控制器
#import "BoardModal.h"
#import "MJRefresh.h"  //引入MJ

@interface BoardViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *tableViewTop;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *searchHeight;
@property (weak, nonatomic) IBOutlet UIView *searchView;
@property (weak, nonatomic) IBOutlet UIButton *searchButton;
@property (nonatomic,strong) BoardDeatailVController  * bdVC;
//测试数据
@property (nonatomic,strong) NSMutableArray * modalArr;
@property (nonatomic,strong) NSMutableArray * pickedModalArr;
//搜索框
@property (weak, nonatomic) IBOutlet UITextField *orderTF;
@property (weak, nonatomic) IBOutlet UITextField *lineTF;

@property (nonatomic,strong) MJRefreshGifHeader * gifHeader;


@end

static     NSString * identifier = @"xibCell'";
@implementation BoardViewController
/** lazy */
- (BoardDeatailVController *)bdVC{
    if (_bdVC ==nil) {
        _bdVC = [[BoardDeatailVController alloc] init] ;
    }
    return _bdVC;
}
-(NSMutableArray *)modalArr{
    if (_modalArr == nil) {
        _modalArr =[[NSMutableArray alloc] init];
    }
    return _modalArr;
}
-(NSMutableArray *)pickedModalArr{
    if (_pickedModalArr == nil) {
        _pickedModalArr = [[NSMutableArray alloc] init];
    }
    return _pickedModalArr;
}

#pragma mark - viewDidLoad
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadData];
    
    [self setSubViews];
}
#pragma mark - 加载数据
- (void) loadData{

    for (int i =0; i<100; i++) {//100条模拟数据
        NSString * order     = [NSString stringWithFormat:@"CP-123%02d",i];
        NSString * line      = [NSString stringWithFormat:@"1%02d",i];
        BoardModal * bModal  = [[BoardModal alloc] initWithOrderNum:order andLineNum:line];
        [self.modalArr addObject:bModal];
        
    }
    self.pickedModalArr = _pickedModalArr;
}
#pragma mark - 设置子视图
- (void) setSubViews{
    
//    self.tableView.delegate = self;
//    self.tableView.dataSource = self;
    
    self.tableView.rowHeight = 200;
    // > 1 注册自定义的cell（nib）
    [self.tableView registerNib:[UINib nibWithNibName:@"BoardTableViewCell" bundle:nil] forCellReuseIdentifier:identifier];
    // > 添加 MJRefresh
    [self setMJRefresh];
    // > 2 定义手势
    UISwipeGestureRecognizer * swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(SwipeGestureAction:)];
    swipe.direction = UISwipeGestureRecognizerDirectionUp;
    [self.searchView addGestureRecognizer:swipe];
    
    // > 3 给搜索框添加观察事件
    [self.orderTF addTarget:self action:@selector(pickOrderAction) forControlEvents:UIControlEventEditingChanged];
    [self.lineTF addTarget:self action:@selector(pickLineAction) forControlEvents:UIControlEventEditingChanged];
}
#pragma mark - 搜索框的编辑响应事件
#pragma mark ** order
- (void) pickOrderAction{

}
#pragma mark ** line
- (void) pickLineAction{

}
#pragma mark - 给tableview添加刷新时间
- (void) setMJRefresh{

    MJRefreshGifHeader * gifHeader = [MJRefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(mjRefreshAction:)];
    self.gifHeader                 = gifHeader;
    // > 循环图片
    UIImage * image21 = [UIImage imageNamed:@"earth1副本"];
    UIImage * image22 = [UIImage imageNamed:@"earth2副本"];
    UIImage * image23 = [UIImage imageNamed:@"earth3副本"];
    UIImage * image24 = [UIImage imageNamed:@"earth4副本"];
    // > 设置循环图片和应用图片的状态
    [gifHeader setImages:@[image21,image22,image23,image24] duration:1 forState:MJRefreshStateRefreshing];
    
    self.tableView.mj_header = gifHeader;
    
    // > 开始刷新
    [gifHeader beginRefreshing];
}
#pragma mark - 下拉刷新事件
- (void) mjRefreshAction:(MJRefreshGifHeader *)header{

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        NSLog(@"下拉刷新");
        [header endRefreshing];
    });
}
#pragma mark - 轻扫手势的响应事件
- (void) SwipeGestureAction:(UIGestureRecognizer *) swipe{

    self.searchButton.selected= NO;
    self.searchHeight.constant = 1;
    [UIView animateWithDuration:0.3 animations:^{
        [self.view layoutSubviews];
    }];
    
}
#pragma mark - tableview的代理方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return self.modalArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    BoardTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    cell.modal                = self.modalArr[indexPath.row];

    return cell;
}
#pragma mark - 返回cell的高度
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    
//    return 200;
//}
#pragma mark - 点击搜索按钮
- (IBAction)searchAction:(UIButton *)sender {
    
    sender.selected = !sender.selected;
    if (sender.selected) {
        self.searchHeight.constant = 250;
    }else{
        self.searchHeight.constant =1;
    }
    
    [UIView animateWithDuration:0.3 animations:^{
         [self.view layoutSubviews];
    }];
   
}
#pragma mark - 选中cell，点击cell
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    self.bdVC.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:self.bdVC animated:YES completion:nil];
}


@end
