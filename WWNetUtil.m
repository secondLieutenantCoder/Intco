//
//  WWNetUtil.m
//  intcoTest
//
//  Created by INTCO 王伟 on 2017/1/4.
//  Copyright © 2017年 INTCO 王伟. All rights reserved.
//

#import "WWNetUtil.h"

@implementation WWNetUtil

#pragma mark - 原始的ContentOfUrl
+ (void) GET:(NSString *)URLStr paramer:(NSDictionary *)param success:(void (^)(id))successBlock failure:(Failure)failure{

    NSData * data = [NSData dataWithContentsOfURL:[NSURL URLWithString:URLStr]];
    
    NSStringEncoding gbkEncoding = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
    
    NSString * gbkString = [[NSString alloc] initWithData:data encoding:gbkEncoding];
    
    NSData * utfData = [gbkString dataUsingEncoding:NSUTF8StringEncoding];
    
//    NSArray * dataArray = [NSJSONSerialization JSONObjectWithData:utfData options:kNilOptions error:nil];
    if (utfData) {
        successBlock(utfData);
    }else{
        failure(@"取数据失败");
    }
    
    /*
    // 管理类 单例
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    
    manager.responseSerializer.acceptableContentTypes=[NSSet setWithObject:@"text/html"];
    // 管理类调用GET方法
    [manager GET:URLStr parameters:param progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        // 成功，直接调用success块 传递相应的参数
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        // 失败，直接调用failure块 传递相应的参数
        failure(error);
    }];
     */
}

#pragma mark - 半自动的session
+ (void)SessionGET:(NSString *)urlStr paramer:(NSDictionary *)param success:(void (^)(id))successBlock failure:(void (^)(id))failureBlock{

    NSURLSession * session = [NSURLSession sharedSession];
    
    NSURLRequest * request = [NSURLRequest requestWithURL:[NSURL URLWithString:urlStr] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSURLSessionTask * sessionTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            
            NSStringEncoding gbkEncoding = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
            
            NSString * gbkString = [[NSString alloc] initWithData:data encoding:gbkEncoding];
            
            NSData * utfData = [gbkString dataUsingEncoding:NSUTF8StringEncoding];
            
            // > 回归主线程
            dispatch_sync(dispatch_get_main_queue(), ^{
                if(error){
                    failureBlock(error);
                }else{
                    successBlock(utfData);
                }
            });
        }];
        // >开启网络任务
        [sessionTask resume];
    });
}

#pragma mark - 使用afn 获取数据
+(void) AFNGET:(NSString *)urlStr paramer:(NSDictionary *)param success:(void (^)(id))successBlock failure:(void (^)(id))failureBlock{
    
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    NSStringEncoding gbkEncoding = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
    // > 设置接受的string 编码格式
    manager.responseSerializer.stringEncoding = gbkEncoding;
    // >改变默认的 json 解析格式
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    
    
    [manager GET:urlStr parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSString * gbkString = [[NSString alloc] initWithData:responseObject encoding:gbkEncoding];
        
        NSData * utfData = [gbkString dataUsingEncoding:NSUTF8StringEncoding];
        successBlock(utfData);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
    }];
    
    
}

@end
