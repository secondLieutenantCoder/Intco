//
//  WWNetUtil.h
//  intcoTest
//
//  Created by INTCO 王伟 on 2017/1/4.
//  Copyright © 2017年 INTCO 王伟. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

typedef void(^Failure)(id error);
@interface WWNetUtil : NSObject

/**
 * 最原始的contentOfUrl 获取数据
 */
+ (void) GET:(NSString *)URLStr paramer:(NSDictionary*)param success:(void(^)(id responseObject))successBlock failure:(Failure)failure;

/**
 * NSUrlSession 获取数据
 */
+ (void) SessionGET:(NSString *)urlStr paramer:(NSDictionary *)param success:(void(^)(id responseObj))successBlock failure:(void(^)(id error))failureBlock;
/**
 * AFN 获取 数据
 */
+ (void) AFNGET:(NSString *)urlStr paramer:(NSDictionary *)param success:(void(^)(id responseObj))successBlock failure:(void(^)(id error))failureBlock;

@end
