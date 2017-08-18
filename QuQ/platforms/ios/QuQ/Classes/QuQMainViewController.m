//
//  QuQMainViewController.m
//  QuQ
//
//  Created by Fay on 2017/8/4.
//
//

#import "QuQMainViewController.h"
#import "QuQNativeViewController.h"
#import "QuQWebViewController.h"
#import "QuQAlert.h"

@interface QuQMainViewController ()

@end

@implementation QuQMainViewController

#pragma mark - Views Life Cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


#pragma mark - Events Managements

- (IBAction)openNative:(id)sender
{
//    QuQNativeViewController *nativeViewController = [[QuQNativeViewController alloc] init];
//    [self presentViewController:nativeViewController animated:YES completion:NULL];
    
    [QuQAlert showAboveController:self withMessages:@"标题", @"内容",
     @"按钮一", ^{
         NSLog(@"事件一");
     },
     @"按钮二", ^{
         NSLog(@"事件二");
     }, nil];
    
//    [self presentViewController:[QuQAlert alertWithMessages:@"标题", @"内容", @"按钮一", ^{NSLog(@"事件一");}, nil] animated:YES completion:NULL];
}

- (IBAction)openWeb:(id)sender
{
    QuQWebViewController *webViewController = [[QuQWebViewController alloc] init];
    [self presentViewController:webViewController animated:YES completion:NULL];
}


#pragma mark - Memory Managements

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
