//
//  WebViewController.m
//  intcoTest
//
//  Created by INTCO 王伟 on 2016/10/22.
//  Copyright © 2016年 INTCO 王伟. All rights reserved.
//

#import "WebViewController.h"
#import "UIView+TakeApartFrame.h"

@interface WebViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *OfficeWebView;

@property (nonatomic,strong) UIImageView * imgView;

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];

//    UIWebView
    [self setSubViews];
   
    
    
}
- (void) setSubViews{
    
    // > 网页加载出来之前的显示图片
    self.imgView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 20, 728, 1004)];
    /** LaunchScreen 中的启动图片的frame */
    
    self.imgView.image = [UIImage imageNamed:@"luanchP"];
    [self.view addSubview:self.imgView];
    
    // > 设置webView 要加载的URL
     [self.OfficeWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.intco.com.cn/cn/about/"]]];
    
}

#pragma mark - webview的代理方法
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    
    NSLog(@"%@",request);
    
    NSLog(@"即将要加载的网页：%@",request.URL.absoluteString);

    return YES;
}
- (void)webViewDidStartLoad:(UIWebView *)webView{

}
#pragma  mark - 网页加载结束，显示网页，隐藏图片
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    
   [UIView animateWithDuration:0.5 animations:^{
        self.imgView.alpha = 0;
   } completion:^(BOOL finished) {
       [self.imgView removeFromSuperview];
   }];

}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{

}

@end
