//
//  QuQAdapter.m
//  QuQ
//
//  Created by Fay on 2017/8/4.
//
//

#import "QuQAdapter.h"

@implementation QuQAdapter

#pragma mark - Cordova Plugin Methods (JavaScript -> Objective-C)

- (void)adapter_dismiss_web:(CDVInvokedUrlCommand *)command
{
    NSLog(@"%@", command.arguments[0]);
    [self.viewController dismissViewControllerAnimated:YES completion:NULL];
    [self adapterDismiss];
}


#pragma mark - Cordova Plugin Methods (Objective-C -> JavaScript)

- (void)adapterDismiss
{
    [self.commandDelegate evalJs:@"adapter_dismiss()"];
}

@end
