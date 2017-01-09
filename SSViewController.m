//
//  SSViewController.m
//  intcoTest
//
//  Created by INTCO 王伟 on 2017/1/3.
//  Copyright © 2017年 INTCO 王伟. All rights reserved.
//

#import "SSViewController.h"
#import "PickViewController.h"


@interface SSViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation SSViewController{

    NSArray * _serviceArray;
   
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"自助服务";

    [self loadData];
    
    [self setSubViews];
    
}
- (void) loadData{
    _serviceArray = @[@"手套订单评审",@"serviceElse",@"serviceElse",@"serviceElse",@"serviceElse"];
    
}

- (void) setSubViews{

}

#pragma mark - table代理方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return _serviceArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString * identifier = @"value1Cell";
    UITableViewCell * cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
    cell.imageView.image = [UIImage imageNamed:@"earth3副本"];
     cell.textLabel.textAlignment = NSTextAlignmentCenter;
    cell.textLabel.text = _serviceArray[indexPath.row];
   
    return cell;
}

#pragma mark - 选中cell
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    // > 取消选中效果
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    // > 根据行号，区分不同的功能
    NSInteger action = indexPath.row;
    if (action == 0) {//> 0 丁腈手套评审
        PickViewController * pickVC = [[PickViewController alloc] init];
        
        [self.navigationController pushViewController:pickVC animated:YES];
    }else{
    
        UIAlertController * alertVC = [UIAlertController alertControllerWithTitle:@"提示" message:@"新功能紧张开发中，敬请期待！" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction * sureAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            // 弹窗的确定事件
        }];
        [alertVC addAction:sureAction];
        [self presentViewController:alertVC animated:YES completion:nil];
    }
}


@end
