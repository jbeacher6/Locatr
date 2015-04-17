//
//  LoginViewController.h
//  Assignment 6b
//
//  Created by Jon on 12/10/14.
//  Copyright (c) 2014 Jon Beacher. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController

//Text fields
@property (weak, nonatomic) IBOutlet UITextField *userNameText;
@property (weak, nonatomic) IBOutlet UITextField *passwordText;
//Labels
@property (strong, nonatomic) IBOutlet UILabel *userNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *passwordLabel;
@property (weak, nonatomic) IBOutlet UILabel *loginFailedLabel;
@property (strong, nonatomic) IBOutlet UILabel *offlineModeWarningLabel;
//Buttons
@property (strong, nonatomic) IBOutlet UIButton *loginButtonOfflineMode;
@property (strong, nonatomic) IBOutlet UIButton *loginButtonOnlineMode;
@property (strong, nonatomic) IBOutlet UIButton *registerNewAccountButton;
//Switchs
@property (strong, nonatomic) IBOutlet UISwitch *onlineModeSwitchValue;

- (IBAction)loginButtonPressed:(id)sender;
- (IBAction)registerButtonPressed:(id)sender;
- (IBAction)onlineModeSwitchPressed:(id)sender;

@end
