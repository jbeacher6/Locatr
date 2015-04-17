//
//  LoginViewController.m
//  Assignment 6b
//
//  Created by Jon on 12/10/14.
//  Copyright (c) 2014 Jon Beacher. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController
@synthesize userNameText, passwordText, userNameLabel, passwordLabel, loginFailedLabel, offlineModeWarningLabel, loginButtonOfflineMode, loginButtonOnlineMode, registerNewAccountButton, onlineModeSwitchValue;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"earthyBackground4.jpg" ]];
    loginFailedLabel.hidden = YES;
    loginButtonOfflineMode.hidden = YES;
    offlineModeWarningLabel.hidden = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)loginButtonPressed:(id)sender {
    return;
}

- (IBAction)registerButtonPressed:(id)sender {
    return;
}

- (IBAction)onlineModeSwitchPressed:(id)sender {
    if(onlineModeSwitchValue.on == NO) {
        userNameText.hidden = YES;
        passwordText.hidden = YES;
        userNameLabel.hidden = YES;
        passwordLabel.hidden = YES;
        offlineModeWarningLabel.hidden = NO;
        loginButtonOfflineMode.hidden = NO;
        loginButtonOnlineMode.hidden = YES;
        registerNewAccountButton.hidden = YES;
    }
    else {
        userNameText.hidden = NO;
        passwordText.hidden = NO;
        userNameLabel.hidden = NO;
        passwordLabel.hidden = NO;
        loginButtonOfflineMode.hidden = YES;
        loginButtonOnlineMode.hidden = NO;
        registerNewAccountButton.hidden = NO;    }
}

@end
