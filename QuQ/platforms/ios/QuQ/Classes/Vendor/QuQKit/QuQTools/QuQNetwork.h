//
//  QuQNetwork.h
//  QuQ
//
//  Created by Fay on 2017/8/9.
//
//

#import "PFModel.h"
#import "AFNetworking.h"

typedef NS_ENUM(NSUInteger, QuQRequestMethod) {
    QuQRequestMethodGet,
    QuQRequestMethodPost,
    QuQRequestMethodPostWithBody,
    QuQRequestMethodDelete,
};


@interface QuQNetwork : PFModel

/*
 主机地址
 */
@property (copy, nonatomic) NSString *hostAddress;

/*
 请求地址的接口
 */
@property (copy, nonatomic) NSString *requestAPI;

/*
 请求方法
 */
@property (nonatomic) QuQRequestMethod method;

/*
 请求的超时时间
 */
@property (nonatomic) float timeout;

/**
 发送请求
 
 @param success 请求成功的回调，包含请求返回的JSON数据
 @param failure 请求失败的回调
 */
- (void)send:(void (^)(id JSON))success failure:(void (^)(void))failure;

/**
 发送请求
 
 @param body 处理上传媒体的回调
 @param success 请求成功的回调，包含请求返回的JSON数据
 @param failure 请求失败的回调
 */
- (void)sendWithBody:(void (^)(id<AFMultipartFormData> formData))body success:(void (^)(id JSON))success failure:(void (^)(void))failure;

/**
 调试模式
 
 @param openOrNot 打开或关闭
 */
+ (void)debugMode:(BOOL)openOrNot;

@end
