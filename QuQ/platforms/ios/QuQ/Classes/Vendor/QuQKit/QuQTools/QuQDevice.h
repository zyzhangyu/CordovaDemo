//
//  QuQDevice.h
//  QuQ
//
//  Created by Fay on 2017/8/9.
//
//

#import <Foundation/Foundation.h>

@interface QuQDevice : NSObject

/**
 系统版本
 */
+ (NSString *)systemVersion;

/**
 应用版本
 */
+ (NSString *)appVersion;

/**
 判断是否更新应用
 */
+ (BOOL)updateDetection:(NSString *)serverVersion;

/**
 调试模式
 
 @param openOrNot 打开或关闭
 */
+ (void)debugMode:(BOOL)openOrNot;

@end
