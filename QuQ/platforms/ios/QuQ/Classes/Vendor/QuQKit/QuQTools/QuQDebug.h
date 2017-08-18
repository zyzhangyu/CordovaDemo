//
//  QuQDebug.h
//  QuQ
//
//  Created by Fay on 2017/8/9.
//
//

#import <Foundation/Foundation.h>

@interface QuQDebug : NSObject

/**
 调试函数
 
 @param function 需要调试的函数方法
 @param argument 调试的参数
 */
+ (void)debug:(SEL)function arguments:(id)argument, ...;

/**
 调试模式
 
 @param openOrNot 打开或关闭
 */
+ (void)debugMode:(BOOL)openOrNot;

@end
