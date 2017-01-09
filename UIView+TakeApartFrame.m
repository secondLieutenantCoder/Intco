//
//  UIView+TakeApartFrame.m
//  intcoTest
//
//  Created by INTCO 王伟 on 2016/10/21.
//  Copyright © 2016年 INTCO 王伟. All rights reserved.
//

#import "UIView+TakeApartFrame.h"

@implementation UIView (TakeApartFrame)

-(void)setX:(CGFloat)x{
    CGRect newFrame     = self.frame;
    newFrame.origin.x   = x;
    
    self.frame          = newFrame;
}
-(CGFloat)x{


    return self.frame.origin.x;
}

-(void)setY:(CGFloat)y{

    CGRect newFrame   =  self.frame;
    newFrame.origin.y = y;
    self.frame        = newFrame;
}
-(CGFloat)y{
    return self.frame.origin.y;
}
-(void)setWidth:(CGFloat)width{
    CGRect newFrame      =  self.frame;
    newFrame.size.width  = width;
    self.frame           = newFrame;
}
-(CGFloat)width{

    return self.frame.size.width;
}
-(void)setHeight:(CGFloat)height{

    CGRect newFrame      = self.frame;
    newFrame.size.height = height;
    self.frame           = newFrame;
}
-(CGFloat)height{

    return self.frame.size.height;
}

@end
