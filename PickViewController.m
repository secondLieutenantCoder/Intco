//
//  PickViewController.m
//  intcoTest
//
//  Created by INTCO 王伟 on 2017/1/3.
//  Copyright © 2017年 INTCO 王伟. All rights reserved.
//

#import "PickViewController.h"
#import "UIView+TakeApartFrame.h"
#import "WWNetUtil.h"
#import "DJOrder.h"

static NSString * identi = @"yy";
@interface PickViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITextField *searchTF;
@property (weak, nonatomic) IBOutlet UIButton *orderAll;
@property (weak, nonatomic) IBOutlet UIButton *orderToDo;
@property (weak, nonatomic) IBOutlet UIButton *orderAlready;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

/** 当前选中的按钮 */
@property (nonatomic,strong)UIButton * selectedBtn;

@end
@interface PickViewController ()

@property (nonatomic,strong) NSArray * modelArray;
@end

@implementation PickViewController{

    NSArray * _buttonArray;
    //标志选中的移动红色按钮
    UIView * _flagView;
    // 后台获取的数据
    NSArray * _dataArray;
    // > model 数组
    NSArray * _modelArr;
    
}
// ---lazy --
-(UIButton *)selectedBtn{

    if (_selectedBtn == nil) {
        _selectedBtn = [[UIButton alloc] init];
    }
    return _selectedBtn;
}
-(NSArray *)modelArray{
    if (_modelArray ==nil) {
        _modelArray = [[NSArray alloc] init];
    }
    return _modelArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"手套订单评审";

    [self loadData];
    
    // > 进行子视图设置，数据加载完毕之后，tableView 重新加载数据
    [self setSubViews];
}

- (void) loadData{
    
    // > 三种选择order的按钮
    _buttonArray =@[self.orderAll,self.orderToDo,self.orderAlready];
    // >获取后台数据
    //    [self contentUrl];
//        [self sessionAction];
    [self afnAction];
    
}
- (void) contentUrl{
    [WWNetUtil GET:@"http://192.168.81.220:8888/iOSData/getMember.php" paramer:nil success:^(id responseObject) {
        NSArray * arr = [NSJSONSerialization JSONObjectWithData:responseObject options:kNilOptions error:nil];
        NSLog(@"%@",arr);
        NSLog(@"success=====成功！");
    } failure:^(id error) {
        
        NSLog(@"%@",error);
    }];
}
- (void) sessionAction{
    
    [WWNetUtil SessionGET:@"http://192.168.81.220:8888/iOSData/getMember.php" paramer:nil success:^(id responseObj) {
        
        NSArray * array = [NSJSONSerialization JSONObjectWithData:responseObj options:kNilOptions error:nil];
        NSLog(@"seccess- =-==-");
        NSLog(@"%@",array);
        
    } failure:^(id error) {
        NSLog(@"session 获取数据失败！");
    }];
}
#pragma mark - AFN获取网络数据
- (void) afnAction{
    
    [WWNetUtil AFNGET:@"http://192.168.81.220:8888/iOSData/pickOrderSearch.php" paramer:nil success:^(id responseObj) {
        _dataArray = [NSJSONSerialization JSONObjectWithData:responseObj options:kNilOptions error:nil];
        NSLog(@"%@",_dataArray);
    
        self.modelArray = [DJOrder getModelArrayWithDataArray:_dataArray];
        // 数据加载完成、tableView reloadData 重新加载数据
        [self.tableView reloadData];
    } failure:^(id error) {
        NSLog(@"获取数据失败！");
        NSLog(@"%@",error);
    }];
}

#pragma mark - 设置子视图
- (void) setSubViews{

    _flagView = [[UIView alloc] initWithFrame:CGRectMake(self.orderAll.frame.origin.x, CGRectGetMaxY(self.orderAll.frame), self.orderAll.frame.size.width, 2.5)];
    _flagView.backgroundColor = [UIColor redColor];
    [self.view addSubview:_flagView];
    [self.orderAll setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    self.orderAll.titleLabel.font = [UIFont boldSystemFontOfSize:19];
    //> 为button添加点击事件
    [self.orderToDo addTarget:self action:@selector(orderKind:) forControlEvents:UIControlEventTouchUpInside];
    [self.orderAll addTarget:self action:@selector(orderKind:) forControlEvents:UIControlEventTouchUpInside];
    [self.orderAlready addTarget:self action:@selector(orderKind:) forControlEvents:UIControlEventTouchUpInside];

    
    self.tableView.delegate   = self;
    self.tableView.dataSource = self;
}

#pragma mark - tableView 的代理事件
#pragma mark *** 行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    NSLog(@"************%@",self.modelArray);
    return self.modelArray.count;
}
#pragma mark *** cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    UITableViewCell * cell  =[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identi];
    DJOrder * tmp = self.modelArray[indexPath.row];
    cell.textLabel.text = tmp.saleMan;
    
    // > 4 箭头 第四种附件类型
    cell.accessoryType  = UITableViewCellAccessoryDisclosureIndicator;
    
    
    return cell;
}
- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    //> 取消选中效果
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}
#pragma mark - 订单分类选择
#pragma mark *** 订单分类按钮点击事件
- (void)orderKind:(UIButton *)tmpBtn {
    
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        NSLog(@"只执行一次！");
//    });
    NSString * buttonTitle = tmpBtn.titleLabel.text;
    if ([buttonTitle isEqualToString:@"所有订单"]) {
        [self demarkSelectedButton:self.orderAll];
        [self markSelectedButton:self.orderAll];
        
    }else if([buttonTitle isEqualToString:@"待评审订单"]){
        [self demarkSelectedButton:self.orderToDo];
        [self markSelectedButton:self.orderToDo];
       
    }else if([buttonTitle isEqualToString:@"已评审订单"]){
    
        [self demarkSelectedButton:self.orderAlready];
        [self markSelectedButton:self.orderAlready];
    }
    
}
#pragma mark *** 取消所有按钮的突出显示
- (void) demarkSelectedButton:(UIButton *)selectedBtn{

    for (int i=0; i<_buttonArray.count; i++) {
        UIButton * tBtn = _buttonArray[i];
        // 字体颜色恢复
        [tBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        // 字体大小恢复
        tBtn.titleLabel.font = [UIFont systemFontOfSize:18];
    }
}
#pragma mark *** 突出显示选中按钮
- (void)markSelectedButton:(UIButton *)btn{

    btn.titleLabel.font = [UIFont boldSystemFontOfSize:19];
    
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    // 移动红色指示条
    [UIView animateWithDuration:0.3 animations:^{
        _flagView.x = btn.x;
    }];
}


@end
