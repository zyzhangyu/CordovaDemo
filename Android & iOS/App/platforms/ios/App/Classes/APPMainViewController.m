//
//  APPMainViewController.m
//  App
//
//  Created by Fay on 2017/6/23.
//  Copyright © 2017年 Fay. All rights reserved.
//

#import "APPMainViewController.h"
#import "APPNativeViewController.h"
#import "APPWebViewController.h"

@interface APPMainViewController ()

@end

@implementation APPMainViewController

#pragma mark - Views Life Cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


#pragma mark - Events Managements

- (IBAction)openNative:(id)sender
{
    APPNativeViewController *nativeViewController = [[APPNativeViewController alloc] init];
    [self presentViewController:nativeViewController animated:YES completion:NULL];
}

- (IBAction)openWeb:(id)sender
{
    APPWebViewController *webViewController = [[APPWebViewController alloc] init];
    [self presentViewController:webViewController animated:YES completion:NULL];
}


#pragma mark - Memory Managements

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
