//
//  HelloPlugin.h
//  CordovaDemo
//
//  Created by Fay on 2017/4/13.
//
//

#import <Cordova/CDV.h>

@interface HelloPlugin : CDVPlugin

//JS -> OC: ObjC callback method
- (void)sayHello:(CDVInvokedUrlCommand *)command;

//JS -> OC: ObjC callback method
- (void)openNew:(CDVInvokedUrlCommand *)command;

@end
