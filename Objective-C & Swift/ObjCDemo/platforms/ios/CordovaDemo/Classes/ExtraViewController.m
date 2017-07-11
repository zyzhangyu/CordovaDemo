//
//  ExtraViewController.m
//  CordovaDemo
//
//  Created by Fay on 2017/5/22.
//
//

#import "ExtraViewController.h"

@interface ExtraViewController ()

@end

@implementation ExtraViewController


#pragma mark - Views Life Cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}


#pragma mark - Events Management

- (IBAction)dismiss:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:NULL];
    if ([self.delegate respondsToSelector:@selector(extraViewControllerDidDismiss:)]) {
        [self.delegate extraViewControllerDidDismiss:self];
    }
}


#pragma mark - Memory Management

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
