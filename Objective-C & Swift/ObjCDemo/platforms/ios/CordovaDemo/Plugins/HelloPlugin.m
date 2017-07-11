//
//  HelloPlugin.m
//  CordovaDemo
//
//  Created by Fay on 2017/4/13.
//
//

#import "HelloPlugin.h"
#import "ExtraViewController.h"
#import "AppDelegate.h"

@interface HelloPlugin () <ExtraViewControllerDelegate>

@end

@implementation HelloPlugin

#pragma mark - Cordova Plugin Methods

//JS -> OC: ObjC callback method
- (void)sayHello:(CDVInvokedUrlCommand *)command
{
    CDVPluginResult* pluginResult = nil;
    if(!command.arguments || command.arguments.count <= 0) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
    } else {
        NSLog(@"%@",command.arguments );
        
        //CDVCommandStatus_OK: js_success_callback
        //CDVCommandStatus_ERROR: js_failure_callback
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"Hello, I am ObjC!"];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }
}

//JS -> OC: ObjC callback method
- (void)openNew:(CDVInvokedUrlCommand *)command
{
    ExtraViewController *evc = [[ExtraViewController alloc] init];
    evc.delegate = self;
    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    [appDelegate.viewController presentViewController:evc animated:YES completion:NULL];
}


#pragma mark - ExtraViewControllerDelegate Methods

- (void)extraViewControllerDidDismiss:(ExtraViewController *)extraViewController
{
    //OC -> JS
    [self.commandDelegate evalJs:[NSString stringWithFormat:@"app.dismissViewController('View controller has been dismiss.');"]];
}

@end
