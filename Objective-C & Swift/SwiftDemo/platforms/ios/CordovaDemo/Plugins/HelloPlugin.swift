//
//  HelloPlugin.swift
//  CordovaDemo
//
//  Created by Fay on 2017/4/13.
//
//

import Foundation

@objc(HelloPlugin) class HelloPlugin : CDVPlugin {
    
    //Swift callback method
    @objc(sayHello:)
    func sayHello(command: CDVInvokedUrlCommand) {
        var pluginResult: CDVPluginResult
        if command.arguments == nil || command.arguments.count <= 0 {
            pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR)
        } else {
            print(command.arguments)
            
            //CDVCommandStatus_OK: js_success_callback
            //CDVCommandStatus_ERROR: js_failure_callback
            pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs:"Hello, I am Swift!")
            self.commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
    }
}
