//
//  APPWebViewController.h
//  App
//
//  Created by Fay on 2017/6/23.
//  Copyright © 2017年 Fay. All rights reserved.
//

#import <Cordova/CDVViewController.h>
#import <Cordova/CDVCommandDelegateImpl.h>
#import <Cordova/CDVCommandQueue.h>

@interface APPWebViewController : CDVViewController

@end

@interface APPWebCommandDelegate : CDVCommandDelegateImpl
@end

@interface APPWebCommandQueue : CDVCommandQueue
@end
