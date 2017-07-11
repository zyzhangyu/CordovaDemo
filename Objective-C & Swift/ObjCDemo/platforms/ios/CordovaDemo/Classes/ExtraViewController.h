//
//  ExtraViewController.h
//  CordovaDemo
//
//  Created by Fay on 2017/5/22.
//
//

#import <UIKit/UIKit.h>

@class ExtraViewController;

@protocol ExtraViewControllerDelegate <NSObject>


- (void)extraViewControllerDidDismiss:(ExtraViewController *)extraViewController;


@end

@interface ExtraViewController : UIViewController

@property (nonatomic, weak) id<ExtraViewControllerDelegate> delegate;


@end
