//
//  WorkShopTopView.m
//  代码splite
//
//  Created by INTCO 王伟 on 2016/10/15.
//  Copyright © 2016年 INTCO 王伟. All rights reserved.
//

#import "WorkShopTopView.h"

#define buttonWidth 120

@interface WorkShopTopView ()

@property (nonatomic,strong) NSMutableArray * buttonArray;

@end
@implementation WorkShopTopView{

    NSArray * _btnTitleArray ;
    
}
-(NSMutableArray *)buttonArray{
    if (_buttonArray == nil) {
        _buttonArray = [[NSMutableArray alloc] init];
    }
    return _buttonArray;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self loadData];
        [self setSubViews];
//        self.backgroundColor = [UIColor colorWithRed:249/255.0 green:249/255.0 blue:249/255.0 alpha:1];
        self.backgroundColor = [UIColor grayColor];
        self.layer.cornerRadius = 10;
    }
    return self;
}
- (void) loadData{

    _btnTitleArray = @[@"车间看板",@"品质报告",@"工艺品质",@"计划查询"];
}

- (void) setSubViews{

    for (int i=0; i<4; i++) {
        
        // 1 设置button的属性
        NSInteger space = 30;
        UIButton * button = [[UIButton alloc] initWithFrame:CGRectMake(i*(space+buttonWidth), 0, buttonWidth, 44)];
        [button setTitle:_btnTitleArray[i] forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont boldSystemFontOfSize:18];
        button.tag = i;
        [button addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
        // 2 设置button的选中时的 颜色变化
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        
        // 3 加入button 数组
        [self.buttonArray addObject:button];
        [self addSubview:button];
        
    }
    // > 默认选中第一个按钮
    UIButton * defaultButton = [self.buttonArray firstObject];
    defaultButton.selected   = YES;
}
#pragma mark - 按钮的点击事件
- (void) clickAction:(UIButton *)button{
    [self notSelected];
    button.selected = !button.selected;;
    
    [self.delegate swtichWorkShopVC:button.tag];
}
#pragma mark - 取消按钮的选中效果
- (void) notSelected{

    for (UIButton * b in self.buttonArray) {
        
        b.selected = NO;
        
    }
}

@end
