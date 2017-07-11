//
//  AppAdapter.m
//  App
//
//  Created by Fay on 2017/6/21.
//
//

#import "AppAdapter.h"

@implementation AppAdapter

#pragma mark - CDVPlugin Methods

- (void)adapter_dismiss_web:(CDVInvokedUrlCommand *)command
{
    NSLog(@"%@", command.arguments[0]);
    [self.viewController dismissViewControllerAnimated:YES completion:NULL];
    [self dismissWeb];
}

- (void)dismissWeb
{
    [self.commandDelegate evalJs:@"app.adapter_dismiss()"];
}


@end
