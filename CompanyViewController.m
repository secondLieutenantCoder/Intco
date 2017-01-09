//
//  CompanyViewController.m
//  intcoTest
//
//  Created by INTCO 王伟 on 2016/10/26.
//  Copyright © 2016年 INTCO 王伟. All rights reserved.
//

#import "CompanyViewController.h"

@interface CompanyViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,strong) NSDictionary * companyDic;

@end
static NSString * ident = @"popCell";

@implementation CompanyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadData];
    
    [self setSubViews];
}
#pragma mark - 加载数据
- (void) loadData{

    NSString * path = [[NSBundle mainBundle] pathForResource:@"company" ofType:@"plist"];
    self.companyDic = [NSDictionary dictionaryWithContentsOfFile:path];
}
#pragma mark - 子视图设置
- (void) setSubViews{

    self.tableView.delegate   = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:ident];
}

#pragma mark - 代理方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.companyDic.allKeys.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:ident];
    
    cell.textLabel.text = self.companyDic.allKeys[indexPath.row];
    cell.textLabel.adjustsFontSizeToFitWidth = YES;
    
    return cell;
}
#pragma mark - 选中cell
- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    NSString * str = self.companyDic.allKeys[indexPath.row];
    // > 根据所选的公司，刷新仓库选项
    [self.delegate refreshDataWithCompanyName:str];
    // > 根据选择改变公司名称
    [self.changeTitleDelegate changeCompanyTitleWithNewTitle:str];
    // > 取消公司选择控制器
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
