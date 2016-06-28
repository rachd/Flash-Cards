//
//  RMDCategoryAdderView.m
//  Flash Cards
//
//  Created by Rachel Dorn on 6/28/16.
//  Copyright © 2016 Rachel Dorn. All rights reserved.
//

#import "RMDCategoryAdderView.h"
#import "RMDConstants.h"

@interface RMDCategoryAdderView () <UITextFieldDelegate>

@property (nonatomic, strong) UIButton *submitButton;

@end

@implementation RMDCategoryAdderView

- (instancetype)initWithFrame:(CGRect)frame viewController:(UIViewController *)cardSetAdderVC {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [RMDConstants backgroundColor];
        self.cardSetAdderVC = cardSetAdderVC;
        [self setUpNameField];
        [self setUpSubmitButton];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                       initWithTarget:self
                                       action:@selector(dismissKeyboard)];
        
        [self addGestureRecognizer:tap];
    }
    return self;
}

- (void)setUpNameField {
    self.nameField = [[UITextField alloc] initWithFrame:CGRectMake(self.frame.size.width / 4, 100, self.frame.size.width / 2, 40)];
    self.nameField.borderStyle = UITextBorderStyleRoundedRect;
    self.nameField.placeholder = @"Category Name";
    self.nameField.delegate = self;
    [self addSubview:self.nameField];
}


- (void)setUpSubmitButton {
    self.submitButton = [[UIButton alloc] initWithFrame:CGRectMake(self.frame.size.width / 4, 240, self.frame.size.width / 2, 40)];
    self.submitButton.layer.cornerRadius = 6.0;
    [self.submitButton setTitle:@"Submit" forState:UIControlStateNormal];
    self.submitButton.backgroundColor = [RMDConstants contrastColor];
    [self.submitButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.submitButton addTarget:self.cardSetAdderVC action:@selector(addCardSet) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.submitButton];
}

-(void)dismissKeyboard {
    [self.nameField resignFirstResponder];
}

@end
