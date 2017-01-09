//
//  CustomTabBar.m
//  intcoTest
//
//  Created by INTCO 王伟 on 2016/10/21.
//  Copyright © 2016年 INTCO 王伟. All rights reserved.
//

#import "CustomTabBar.h"
#import "WWButton.h"
#import "WWItem.h"

#define kCustomWidth 468
@interface CustomTabBar ()<WWButtonDelegate>

@property (nonatomic,strong) NSMutableArray * buttonArray;

@property (nonatomic,strong) NSMutableArray * itemArray;

@property (nonatomic,strong) UIImageView    * backView;
@end

@implementation CustomTabBar
/** lazy */
- (NSMutableArray *)buttonArray{
    
    if (_buttonArray == nil) {
        _buttonArray = [[NSMutableArray alloc] init];
    }
    return _buttonArray;
}
- (NSMutableArray *)itemArray{
    
    if (_itemArray == nil) {
        _itemArray = [[NSMutableArray alloc] init];
    }
    return _itemArray;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        // > 固定的frame
        self.frame           = CGRectMake(0, 0, kCustomWidth, 49);
        // > 白色背景
        self.backgroundColor = [UIColor whiteColor];
        // > 数据
        [self loadData];
        // > 设置子视图
        [self setSubViews];
        
    }
    return self;
}
- (void) loadData{
    
    NSArray * imageArray = @[@"首页-首页",@"部门",@"办公室",@"生产管理"];
    NSArray * titleArray = @[@"英科介绍",@"销售助手",@"生产看板",@"自助服务"];
    for (int i = 0; i<imageArray.count; i++) {
        
        WWItem * item = [[WWItem alloc] initWithTitle:titleArray[i] andImageNmae:imageArray[i]];
        [self.itemArray addObject:item];
    }

}

- (void) setSubViews{
    for (int i = 0; i<self.itemArray.count; i++) {
        
        CGFloat  interSpace = (kCustomWidth-49*5)/((self.itemArray.count-1)*1.0);
        //临时数据模型
        WWItem * tempItem = self.itemArray[i];
        
        WWButton * button = [[WWButton alloc] initWithFrame:CGRectMake(i *(interSpace+49), 2, 49, 49) andTitle:tempItem.title andImageName:tempItem.imageName];
        
        [self addSubview:button];
        [self.buttonArray addObject:button];
        
        button.delegate = self;
        
        button.tag = i;
    }
    
    //选中的背景图
    UIImageView * imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 49, 49)];
    imgView.layer.cornerRadius = 5;
    imgView.alpha = 0.8;
    imgView.backgroundColor = [UIColor colorWithRed:27/255.0 green:183/255.0 blue:255/255.0 alpha:1];
    self.backView = imgView;
    [self addSubview:imgView];
    
    [self sendSubviewToBack:imgView];
    
    // > 默认的选中状态
    WWButton * startButton = [self.buttonArray objectAtIndex:0];
    imgView.center = startButton.center;
}

#pragma mark - button的代理方法
- (void) switchController:(NSInteger)index{
    
    WWButton * tempButton = self.buttonArray[index];
    [UIView animateWithDuration:0.3 animations:^{
        
        self.backView.center = tempButton.center;
    }];
    [self.delegate changeVCWithIndex:index];
}
@end
