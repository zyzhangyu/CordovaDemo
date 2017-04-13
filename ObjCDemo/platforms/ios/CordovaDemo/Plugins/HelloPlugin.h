//
//  HelloPlugin.h
//  CordovaDemo
//
//  Created by Fay on 2017/4/13.
//
//

#import <Cordova/CDV.h>

@interface HelloPlugin : CDVPlugin

//ObjC callback method
- (void)sayHello:(CDVInvokedUrlCommand *)command;

@end
