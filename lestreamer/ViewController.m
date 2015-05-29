//
//  ViewController.m
//  lestreamer
//
//  Created by Michael T on 2015-05-09.
//  Copyright (c) 2015 devgruxcon. All rights reserved.
//

#import "ViewController.h"
#import "Utils.h"
#import "API.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initLoginTextfields];
    [self initLoginButton];
}

- (void)initLoginButton {
    _loginButton.buttonColor = [UIColor turquoiseColor];
    _loginButton.shadowColor = [UIColor greenSeaColor];
    _loginButton.shadowHeight = 3.0f;
    _loginButton.cornerRadius = 6.0f;
    _loginButton.titleLabel.font = [UIFont boldFlatFontOfSize:16];
    [_loginButton setTitleColor:[UIColor cloudsColor] forState:UIControlStateNormal];
    [_loginButton setTitleColor:[UIColor cloudsColor] forState:UIControlStateHighlighted];
}

- (void)initLoginTextfields {
    initTextfield(_usernameField);
    initTextfield(_passwordField);
}

void initTextfield(FUITextField* textfield){
    textfield.font = [UIFont flatFontOfSize:16];
    textfield.backgroundColor = [UIColor clearColor];
    textfield.edgeInsets = UIEdgeInsetsMake(4.0f, 5.0f, 4.0f, 5.0f);
    textfield.textFieldColor = [UIColor whiteColor];
    textfield.borderColor = [UIColor turquoiseColor];
    textfield.borderWidth = 2.0f;
    textfield.cornerRadius = 3.0f;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)loginButton:(id)sender {
    NSString *username = _usernameField.text;
    NSString *password = _passwordField.text;
    loadCameraView(self);
    // todo. toggle and change API end point in API.m
//    [API loginUsername:username
//              password:password
//               success:^(NSString* streamname){
//                   [Utils log:@"INFO login response streamname" obj:streamname];
//                   // TODO right now streamname is just the username.
//                   // make server return streamname
//                   loadCameraView(self);
//               } failure:^(NSString* msg) {
//                   [Utils alert:msg];
//               }];
}

- (IBAction)registerButton:(id)sender {
    [Utils alert:@"Placeholder: TODO"];
}

void loadCameraView(id self){
    NSString * storyboardName = @"Main";
    NSString * viewControllerID = @"CameraCtrlID";
    UIStoryboard * storyboard = [UIStoryboard storyboardWithName:storyboardName bundle:nil];
    UIViewController* controller = [storyboard instantiateViewControllerWithIdentifier:viewControllerID];
    [self presentViewController:controller animated:YES completion:nil];
}


@end
