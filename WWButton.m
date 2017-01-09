//
//  WWButton.m
//  TabBar动画修改
//
//  Created by jerehedu on 16/6/7.
//  Copyright © 2016年 王伟. All rights reserved.
//

#import "WWButton.h"




//===--- 延展 ---===
@interface WWButton ()

@property(nonatomic,copy) NSString * title;

@property(nonatomic,copy) NSString * imageName;

@end

@implementation WWButton


- (instancetype) initWithFrame:(CGRect)frame andTitle:(NSString *)title andImageName:(NSString *)imageName{

    self=[super initWithFrame:frame];
    
    if (self) {
        
        self.title=title;
        
        self.imageName=imageName;
        
        [self setSubViews];
        
    }
    
    return self;
}

- (void) setSubViews{
    
    //===---设置图片---===
    UIImageView * img=[[UIImageView alloc] initWithFrame:CGRectMake(self.frame.size.width*0.25, 3, self.frame.size.width*0.5, self.frame.size.width*0.5)];
    //===---打开用户交互操作---===
    //img.userInteractionEnabled=YES;
    //===--- 设置内容是否填满图片，保持原状 ---===
    img.contentMode=UIViewContentModeScaleAspectFit;
    
    img.image=[UIImage imageNamed:self.imageName];
    
    [self addSubview:img];
    
   //======------设置标题---===
    UILabel * title=[[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(img.frame)+self.frame.size.height*0.1, self.frame.size.width, self.frame.size.width*0.3)];
    title.text=self.title;
    title.textAlignment=NSTextAlignmentCenter;
    title.textColor=[UIColor grayColor];
    title.font=[UIFont  boldSystemFontOfSize:10];
    title.adjustsFontSizeToFitWidth = YES;
   
    //===---添加点击事件---===写到button内部，
    [self addTarget:self action:@selector(switchC:) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:title];
    
}

#pragma mark - 点击事件
- (void) switchC:(UIButton *)button{
//===---使用代理，调用代理方法---===
    [self.delegate switchController:button.tag];
    
}

@end
