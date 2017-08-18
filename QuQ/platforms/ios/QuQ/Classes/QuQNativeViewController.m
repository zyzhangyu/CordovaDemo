//
//  QuQNativeViewController.m
//  QuQ
//
//  Created by Fay on 2017/8/4.
//
//

#import "QuQNativeViewController.h"
#import <WebKit/WebKit.h>
@interface QuQNativeViewController ()

@end

@implementation QuQNativeViewController

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
