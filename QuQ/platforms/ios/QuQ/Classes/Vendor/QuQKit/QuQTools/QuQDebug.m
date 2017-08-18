//
//  QuQDebug.m
//  QuQ
//
//  Created by Fay on 2017/8/9.
//
//

#import "QuQAlert.h"
#import "QuQDebug.h"
#import "QuQDevice.h"
#import "QuQModel.h"
#import "QuQNetwork.h"

#define QuQLog(FORMAT, ...) fprintf(stderr, "%s\n", [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);

///调试模式
static BOOL DEBUG_MODE = NO;

@implementation QuQDebug

+ (void)debug:(SEL)function arguments:(id)argument, ...
{
    if (DEBUG_MODE) {
        NSLog(@"[ FUNCTION ][ DEBUG ] %@", NSStringFromSelector(function));
        NSLog(@"[ -> ][ INFO ] %@", argument);
        
        va_list list;
        va_start(list, argument);
        while (argument != nil) {
            id obj = va_arg(list, id);
            if (!obj) break;
            NSLog(@"[ -> ][ INFO ] %@", obj);
        }
        va_end(list);
    }
}

+ (void)debugMode:(BOOL)openOrNot
{
    DEBUG_MODE = openOrNot;
    
    [QuQAlert debugMode:openOrNot];
    [QuQDevice debugMode:openOrNot];
    [QuQModel debugMode:openOrNot];
    [QuQNetwork debugMode:openOrNot];
}

@end
