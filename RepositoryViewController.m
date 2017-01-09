//
//  RepositoryViewController.m
//  intcoTest
//
//  Created by INTCO 王伟 on 2016/10/26.
//  Copyright © 2016年 INTCO 王伟. All rights reserved.
//

#import "RepositoryViewController.h"

@interface RepositoryViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic,strong) NSArray * reposArray;


@end

static NSString * iden = @"repoCell";
@implementation RepositoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadData];
    [self setSubViews];
}

- (void) loadData {

    NSString * path = [[NSBundle mainBundle] pathForResource:@"company" ofType:@"plist"];
    
    NSDictionary * companyDic = [NSDictionary dictionaryWithContentsOfFile:path];
    self.reposArray = companyDic[@"山东英科环保再生资源股份有限公司"];
}
- (void) setSubViews{

    self.tableView.delegate    = self;
    self.tableView.dataSource  = self;
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:iden];
}

#pragma mark - 代理方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.reposArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:iden];
    
    cell.textLabel.text    = self.reposArray[indexPath.row];
    return cell;
}

#pragma mark - 刷新的代理方法
- (void) refreshDataWithCompanyName:(NSString *)cName{

    NSString * path = [[NSBundle mainBundle] pathForResource:@"company" ofType:@"plist"];
    
    NSDictionary * companyDic = [NSDictionary dictionaryWithContentsOfFile:path];
    self.reposArray = companyDic[cName];
    // > 改变公司时，也改变仓库的默认值
    [self.delegate changeRepositoryWithRepoName:self.reposArray.firstObject];
    // > 刷新tableview
    [self.tableView reloadData];
    
}
- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    // > 根据选择改变仓库名称
    [self.delegate changeRepositoryWithRepoName:self.reposArray[indexPath.row]];
    
    // > 取消选择控制器
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
