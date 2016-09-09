//
//  RMDSignInView.m
//  Flash Cards
//
//  Created by Rachel Dorn on 6/11/16.
//  Copyright © 2016 Rachel Dorn. All rights reserved.
//

#import "RMDSignInView.h"
#import "RMDConstants.h"

@interface RMDSignInView ()

@property (nonatomic, strong) UIButton *submitButton;
@property (nonatomic, strong) UIButton *registerButton;

@end

@implementation RMDSignInView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [RMDConstants backgroundColor];
        [self setUpEmailField];
        [self setUpPasswordField];
        [self setUpSubmitButton];
        [self setUpRegisterSection];
    }
    return self;
}

- (void)setUpEmailField {
    self.emailField = [[UITextField alloc] initWithFrame:CGRectMake(20, 100, self.frame.size.width - 40, 40)];
    self.emailField.placeholder = @"Email Address";
    self.emailField.borderStyle = UITextBorderStyleRoundedRect;
    self.emailField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    self.emailField.autocorrectionType = UITextAutocorrectionTypeNo;
    [self addSubview:self.emailField];
}

- (void)setUpPasswordField {
    self.passwordField = [[UITextField alloc] initWithFrame:CGRectMake(20, 160, self.frame.size.width - 40, 40)];
    self.passwordField.placeholder = @"Password";
    self.passwordField.secureTextEntry = YES;
    self.passwordField.borderStyle = UITextBorderStyleRoundedRect;
    self.passwordField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    self.passwordField.autocorrectionType = UITextAutocorrectionTypeNo;
    [self addSubview:self.passwordField];
}

- (void)setUpSubmitButton {
    self.submitButton = [[UIButton alloc] initWithFrame:CGRectMake(self.frame.size.width / 4, 220, self.frame.size.width / 2, 40)];
    self.submitButton.backgroundColor = [RMDConstants contrastColor];
    self.submitButton.layer.cornerRadius = 8;
    [self.submitButton setTitle:@"Sign In" forState:UIControlStateNormal];
    [self.submitButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.submitButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
    [self.submitButton addTarget:nil action:@selector(signInUser) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.submitButton];
}

- (void)setUpRegisterSection {
    UILabel *registerLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 320, self.frame.size.width, 40)];
    registerLabel.text = @"Don't have an account?";
    registerLabel.textColor = [UIColor blackColor];
    registerLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:registerLabel];
    
    self.registerButton = [[UIButton alloc] initWithFrame:CGRectMake(self.frame.size.width / 4, 370, self.frame.size.width / 2, 40)];
    self.registerButton.backgroundColor = [RMDConstants contrastColor];
    self.registerButton.layer.cornerRadius = 8;
    [self.registerButton setTitle:@"Register" forState:UIControlStateNormal];
    [self.registerButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.registerButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
    [self.registerButton addTarget:nil action:@selector(registerUser) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.registerButton];
}

@end
