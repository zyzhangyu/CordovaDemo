//
//  QuQModel.h
//  QuQ
//
//  Created by Fay on 2017/8/9.
//
//

#import "PFModel.h"
#import "QuQNetwork.h"
#import <Cordova/CDVInvokedUrlCommand.h>

@interface QuQModel : PFModel

@end

@interface QuQRequest : QuQNetwork

- (void)sendWithCommand:(CDVInvokedUrlCommand *)command callback:(void (^)(id value, ...))callback;

@end
