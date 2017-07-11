//
//  APPNativeViewController.m
//  App
//
//  Created by Fay on 2017/6/23.
//  Copyright © 2017年 Fay. All rights reserved.
//

#import "APPNativeViewController.h"

@interface APPNativeViewController ()

@end

@implementation APPNativeViewController

#pragma mark - Views Life Cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


#pragma mark - Events Management

- (IBAction)closeMe:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:NULL];
}


#pragma mark - Memory Managements

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
