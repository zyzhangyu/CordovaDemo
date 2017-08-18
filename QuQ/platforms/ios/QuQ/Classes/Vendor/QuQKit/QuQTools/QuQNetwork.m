//
//  QuQNetwork.m
//  QuQ
//
//  Created by Fay on 2017/8/9.
//
//

#import "QuQNetwork.h"

///调试模式
static BOOL DEBUG_MODE = NO;

@interface QuQNetwork ()

@property (nonatomic, strong) AFHTTPSessionManager *manager;
@property (nonatomic) float systemTimeout;

@end

@implementation QuQNetwork

#pragma mark - Setter / Getter Methods

- (AFHTTPSessionManager *)manager
{
    if (!_manager) {
        _manager = [AFHTTPSessionManager manager];
        _manager.responseSerializer = [AFJSONResponseSerializer serializer];
        _manager.responseSerializer.acceptableContentTypes = [_manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
        
        _manager.requestSerializer = [AFJSONRequestSerializer serializer];
        [_manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
        [_manager.requestSerializer setValue:@"" forHTTPHeaderField:@"Accept-Language"];
    }
    
    [_manager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
    if (self.timeout != 0) {
        _manager.requestSerializer.timeoutInterval = self.timeout;
    } else {
        _manager.requestSerializer.timeoutInterval = 120.f;
    }
    [_manager.requestSerializer didChangeValueForKey:@"timeoutInterval"];
    
    return _manager;
}


#pragma mark - Private Methods

- (void)getWithParams:(NSDictionary *)params success:(void (^)(id))success failure:(void (^)(void))failure
{
    [self.manager GET:[NSString stringWithFormat:@"%@%@", self.hostAddress, self.requestAPI] parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id _Nonnull responseObject) {
        [self logResult:responseObject];
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        [self logError:error];
        failure();
    }];
}

- (void)postWithParams:(NSDictionary *)params success:(void (^)(id))success failure:(void (^)(void))failure
{
    [self.manager POST:[NSString stringWithFormat:@"%@%@", self.hostAddress, self.requestAPI] parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id _Nonnull responseObject) {
        [self logResult:responseObject];
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        [self logError:error];
        failure();
    }];
}

- (void)postWithParams:(NSDictionary *)params body:(void (^)(id))body success:(void (^)(id))success failure:(void (^)(void))failure
{
    [self.manager POST:[NSString stringWithFormat:@"%@%@", self.hostAddress, self.requestAPI] parameters:params constructingBodyWithBlock:body success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        [self logResult:responseObject];
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [self logError:error];
        failure();
    }];
}

- (void)deleteWithParams:(NSDictionary *)params success:(void (^)(id))success failure:(void (^)(void))failure
{
    [self.manager DELETE:[NSString stringWithFormat:@"%@%@", self.hostAddress, self.requestAPI] parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        [self logResult:responseObject];
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [self logError:error];
        failure();
    }];
}

- (void)logResult:(id)result
{
    if (DEBUG_MODE) {
        NSLog(@"[ NETWORK ][ DEBUG ] Request success.");
        NSLog(@"[ -> ][ INFO ] %@", self.requestAPI);
        NSLog(@"[ -> ][ INFO ] %@", result);
    }
}

- (void)logError:(NSError *)error
{
    if (DEBUG_MODE) {
        NSLog(@"[ NETWORK ][ DEBUG ] Request failure.");
        NSLog(@"[ -> ][ INFO ] %@", self.requestAPI);
        NSLog(@"[ -> ][ ERROR ] %@", error);
    }
}


#pragma mark - Public Methods

- (void)send:(void (^)(id))success failure:(void (^)(void))failure
{
    [self sendWithParams:[self createJSON] body:NULL success:success failure:failure];
}

- (void)sendWithBody:(void (^)(id<AFMultipartFormData>))body success:(void (^)(id))success failure:(void (^)(void))failure
{
    [self sendWithParams:[self createJSON] body:body success:success failure:failure];
}

- (void)sendWithParams:(NSDictionary *)params body:(void (^)(id))body success:(void (^)(id))success failure:(void (^)(void))failure
{
    if (params[@"token"] && ![params[@"token"] isEqualToString:@""]) {
        [self.manager.requestSerializer setValue:params[@"token"] forHTTPHeaderField:@"token"];
    }
    
    NSMutableDictionary *finalParams = [NSMutableDictionary dictionaryWithDictionary:params];
    [finalParams removeObjectForKey:@"token"];
    
    if (DEBUG_MODE) {
        NSLog(@"[ NETWORK ][ DEBUG ] Requesting.");
        NSLog(@"[ -> ][ INFO ] %@%@", self.hostAddress, self.requestAPI);
        if (![finalParams isEqualToDictionary:@{}]) {
            NSLog(@"[ -> ][ INFO ] %@", finalParams);
        }
    }
    
    switch (self.method) {
        case QuQRequestMethodGet:
            [self getWithParams:finalParams success:success failure:failure];
            break;
        case QuQRequestMethodPost:
            [self postWithParams:finalParams success:success failure:failure];
            break;
        case QuQRequestMethodPostWithBody:
            [self postWithParams:finalParams body:body success:success failure:failure];
            break;
        case QuQRequestMethodDelete:
            [self deleteWithParams:finalParams success:success failure:failure];
            break;
        default:
            break;
    }
}

+ (void)debugMode:(BOOL)openOrNot
{
    DEBUG_MODE = openOrNot;
}

@end
