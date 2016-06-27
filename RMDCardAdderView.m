//
//  RMDCardAdderView.m
//  Flash Cards
//
//  Created by Rachel Dorn on 6/27/16.
//  Copyright © 2016 Rachel Dorn. All rights reserved.
//

#import "RMDCardAdderView.h"
#import "RMDUser.h"

@interface RMDCardAdderView () <UITextFieldDelegate>

@property (nonatomic, strong) UIButton *submitButton;

@end

@implementation RMDCardAdderView

- (instancetype)initWithFrame:(CGRect)frame viewController:(UIViewController *)cardAdderVC {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.cardAdderVC = cardAdderVC;
        [self setUpKeyField];
        [self setUpValueField];
        [self setUpSubmitButton];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                       initWithTarget:self
                                       action:@selector(dismissKeyboard)];
        
        [self addGestureRecognizer:tap];
    }
    return self;
}

- (void)setUpKeyField {
    self.keyField = [[UITextField alloc] initWithFrame:CGRectMake(self.frame.size.width / 4, 100, self.frame.size.width / 2, 40)];
    self.keyField.borderStyle = UITextBorderStyleRoundedRect;
    self.keyField.placeholder = [NSString stringWithFormat:@"Word in %@", [RMDUser currentUser].currentCategory];
    self.keyField.delegate = self;
    [self addSubview:self.keyField];
}

- (void)setUpValueField {
    self.valueField = [[UITextField alloc] initWithFrame:CGRectMake(self.frame.size.width / 4, 160, self.frame.size.width / 2, 40)];
    self.valueField.borderStyle = UITextBorderStyleRoundedRect;
    self.valueField.placeholder = @"Word in English";
    self.valueField.delegate = self;
    [self addSubview:self.valueField];
}

- (void)setUpSubmitButton {
    self.submitButton = [[UIButton alloc] initWithFrame:CGRectMake(self.frame.size.width / 4, 240, self.frame.size.width / 2, 40)];
    self.submitButton.layer.cornerRadius = 6.0;
    [self.submitButton setTitle:@"Submit" forState:UIControlStateNormal];
    self.submitButton.backgroundColor = [UIColor blueColor];
    [self.submitButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.submitButton addTarget:self.cardAdderVC action:@selector(addCard) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.submitButton];
}

-(void)dismissKeyboard {
    [self.keyField resignFirstResponder];
    [self.valueField resignFirstResponder];
}

@end
