//
//  OrderDetViewController.m
//  intcoTest
//
//  Created by INTCO 王伟 on 2016/10/26.
//  Copyright © 2016年 INTCO 王伟. All rights reserved.
//

#import "OrderDetViewController.h"
#import "OrderTableViewCell.h"
#import "OrderModal.h"
#import "OPUtil.h"
#import "ODViewController.h"

@interface OrderDetViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic,strong) NSMutableArray * orderModalArray;



@end

static NSString * orderIden = @"orderCell";
@implementation OrderDetViewController
-(NSMutableArray *)orderModalArray{
    if (_orderModalArray == nil) {
        _orderModalArray = [NSMutableArray array];
    }
    return _orderModalArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadData];
    
    [self setSubViews];
}
- (void) loadData{

    NSUserDefaults * userD = [NSUserDefaults standardUserDefaults];
    NSArray * dicArray     = [userD valueForKey:@"orderInfo"];
    
    self.orderModalArray   = (NSMutableArray *)[OrderModal getModalArrayFromDicArray:dicArray];
    
//    [self setSubViews];
}
-(void) setSubViews{

    self.tableView.delegate    = self;
    self.tableView.dataSource  = self;
    
    [self.tableView registerNib:[UINib nibWithNibName:@"OrderTableViewCell" bundle:nil] forCellReuseIdentifier:orderIden];
    
    // > 设置cell的高度
    self.tableView.rowHeight = 120;
}

#pragma mark - tableView代理方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    NSLog(@"%ld",self.orderModalArray.count);
    return  self.orderModalArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    OrderTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:orderIden];
    cell.orderModal      = self.orderModalArray[indexPath.row];
    
    return cell;
}
#pragma mark *** 删除
-(void) tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath  {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        // > 先删除数据
        [self.orderModalArray removeObjectAtIndex:indexPath.row];
        // > 删除cell
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationRight];

    }
        // > 删除内存中的数据
    [OPUtil deleteExistOrderWithIndex:indexPath.row];

}
#pragma mark - 点击cell
-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    ODViewController * odVC = [[ODViewController alloc] init];
    
    [self presentViewController:odVC animated:YES completion:nil];

    
}
#pragma mark - 返回按钮
- (IBAction)backAction:(UIButton *)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}



@end
