//
//  QuQDevice.m
//  QuQ
//
//  Created by Fay on 2017/8/9.
//
//

#import "QuQDevice.h"

///调试模式
static BOOL DEBUG_MODE = NO;

@implementation QuQDevice

+ (NSString *)systemVersion
{
    if (DEBUG_MODE) {
        NSLog(@"[ DEVICE ][ DEBUG ] System version.");
        NSLog(@"[ -> ][ INFO ] %@", [UIDevice currentDevice].systemVersion);
    }
    return [UIDevice currentDevice].systemVersion;
}

+ (NSString *)appVersion
{
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    if (DEBUG_MODE) {
        NSLog(@"[ DEVICE ][ DEBUG ] App version.");
        NSLog(@"[ -> ][ INFO ] %@", [infoDictionary objectForKey:@"CFBundleShortVersionString"]);
    }
    return [infoDictionary objectForKey:@"CFBundleShortVersionString"];
}

+ (BOOL)updateDetection:(NSString *)serverVersion
{
    NSArray *server = [serverVersion componentsSeparatedByString:@"."];
    NSArray *local = [[QuQDevice appVersion] componentsSeparatedByString:@"."];
    for (int i = 0; i < server.count; i++) {
        if (i > (local.count - 1)) {
            return YES;
        } else if ([server[i] intValue] > [local[i] intValue]) {
            return YES;
        } else if ([server[i] intValue] < [local[i] intValue]) {
            return NO;
        }
    }
    return NO;
}

+ (void)debugMode:(BOOL)openOrNot
{
    DEBUG_MODE = openOrNot;
}

@end
