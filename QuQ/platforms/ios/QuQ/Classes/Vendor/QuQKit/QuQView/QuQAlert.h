//
//  QuQAlert.h
//  QuQ
//
//  Created by Fay on 2017/8/15.
//
//

#import <UIKit/UIKit.h>

@interface QuQAlert : NSObject

/**
 生成提示框
 
 [QuQAlert alertWithMessages:@"标题", @"内容", @"按钮一", ^{NSLog(@"事件一");}, @"按钮二", ^{NSLog(@"事件二");}, nil];
 
 @param message 提示框展示的信息，可变参数。第一个参数为标题，第二个参数为内容，第三个参数开始，奇数为按钮标题，偶数为按钮事件。
 @warning Objective-C语法中，可变参数要以 `nil` 关键字结尾作为最后一个参数，表示结束赋值。
 */
+ (UIAlertController *)alertWithMessages:(id)message, ...;

/**
 弹出提示框
 
 [QuQAlert showAboveController:ViewController withMessages:@"标题", @"内容", @"按钮一", ^{NSLog(@"事件一");}, @"按钮二", ^{NSLog(@"事件二");}, nil];
 
 @param viewController 需要显示提示框的视图控制器。
 @param message 提示框展示的信息，可变参数。第一个参数为标题，第二个参数为内容，第三个参数开始，奇数为按钮标题，偶数为按钮事件。
 @warning Objective-C语法中，可变参数要以 `nil` 关键字结尾作为最后一个参数，表示结束赋值。
 */
+ (void)showAboveController:(UIViewController *)viewController withMessages:(id)message, ...;

/**
 调试模式
 
 @param openOrNot 打开或关闭
 */
+ (void)debugMode:(BOOL)openOrNot;

@end
