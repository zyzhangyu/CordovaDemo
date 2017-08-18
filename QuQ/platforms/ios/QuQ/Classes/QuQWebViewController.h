//
//  QuQWebViewController.h
//  QuQ
//
//  Created by Fay on 2017/8/4.
//
//

#import <Cordova/CDVViewController.h>
#import <Cordova/CDVCommandDelegateImpl.h>
#import <Cordova/CDVCommandQueue.h>

@interface QuQWebViewController : CDVViewController

@end

@interface QuQWebCommandDelegate : CDVCommandDelegateImpl
@end

@interface QuQWebCommandQueue : CDVCommandQueue
@end
