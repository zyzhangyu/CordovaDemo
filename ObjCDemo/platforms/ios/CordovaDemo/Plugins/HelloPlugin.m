//
//  HelloPlugin.m
//  CordovaDemo
//
//  Created by Fay on 2017/4/13.
//
//

#import "HelloPlugin.h"

@implementation HelloPlugin

//ObjC callback method
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

@end
