//
//  ViewController.h
//  lestreamer
//
//  Created by Michael T on 2015-05-09.
//  Copyright (c) 2015 devgruxcon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FlatUIKit.h>

@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutlet FUITextField *usernameField;
@property (strong, nonatomic) IBOutlet FUITextField *passwordField;
@property (strong, nonatomic) IBOutlet FUIButton *loginButton;

- (IBAction)loginButton:(id)sender;
- (IBAction)registerButton:(id)sender;

@end

