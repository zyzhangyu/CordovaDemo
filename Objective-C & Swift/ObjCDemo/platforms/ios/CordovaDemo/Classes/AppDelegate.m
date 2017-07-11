/*
 Licensed to the Apache Software Foundation (ASF) under one
 or more contributor license agreements.  See the NOTICE file
 distributed with this work for additional information
 regarding copyright ownership.  The ASF licenses this file
 to you under the Apache License, Version 2.0 (the
 "License"); you may not use this file except in compliance
 with the License.  You may obtain a copy of the License at

 http://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing,
 software distributed under the License is distributed on an
 "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 KIND, either express or implied.  See the License for the
 specific language governing permissions and limitations
 under the License.
 */

//
//  AppDelegate.m
//  CordovaDemo
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright ___ORGANIZATIONNAME___ ___YEAR___. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication*)application didFinishLaunchingWithOptions:(NSDictionary*)launchOptions
{
    self.viewController = [[MainViewController alloc] init];
    return [super application:application didFinishLaunchingWithOptions:launchOptions];
}

@end



//Create Cordova Project
//
//1. setup node.js:
//      https://nodejs.org/en/
//
//2. setup Cordova:
//      terminal: $sudo npm install -g cordova
//   OR:
//   update:
//      terminal: $npm update -g cordova
//
//3. create Cordova project:
//      terminal: $cordova create ProjectFolder(project path) BundleIdentifier ProjectName
//
//4. go to the folder:
//      terminal: $cd ProjectFolder
//
//5. create iOS project:
//      terminal: $cordova platforms add ios
//
//6. add android(optional):
//      terminal: $cordova platform add android
//
//7. add plugin:
//      terminal: $cordova plugin add org.apache.cordova.device
//      terminal: $cordova plugin add org.apache.cordova.console
//
//Program
//See: -> JavaScript
//          -> 1.config.xml (用于注册Objective-C的文件)
//             2.index.js   (用于编写应用的事件)
//             3.index.html (用于编写应用的界面)
//
//     -> Objdective-C
//          -> 1.HelloPlugin (用于处理应用的本地响应)
//
