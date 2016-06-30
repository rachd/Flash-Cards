//
//  RMDCardAdderView.m
//  Flash Cards
//
//  Created by Rachel Dorn on 6/27/16.
//  Copyright © 2016 Rachel Dorn. All rights reserved.
//

#import "RMDCardAdderView.h"
#import "RMDUser.h"
#import "RMDConstants.h"

@interface RMDCardAdderView () <UITextFieldDelegate>

@property (nonatomic, strong) UIButton *submitButton;

@end

@implementation RMDCardAdderView

- (instancetype)initWithFrame:(CGRect)frame viewController:(UIViewController *)cardAdderVC {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [RMDConstants backgroundColor];
        self.cardAdderVC = cardAdderVC;
        [self setUpWordField];
        [self setUpDefinitionField];
        [self setUpSubmitButton];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                       initWithTarget:self
                                       action:@selector(dismissKeyboard)];
        
        [self addGestureRecognizer:tap];
    }
    return self;
}

- (void)setUpWordField {
    self.wordField = [[UITextField alloc] initWithFrame:CGRectMake(self.frame.size.width / 8, 100, (self.frame.size.width * 3) / 4, 40)];
    self.wordField.borderStyle = UITextBorderStyleRoundedRect;
    self.wordField.placeholder = @"Word";
    self.wordField.delegate = self;
    [self addSubview:self.wordField];
}

- (void)setUpDefinitionField {
    self.definitionField = [[UITextField alloc] initWithFrame:CGRectMake(self.frame.size.width / 8, 160, (self.frame.size.width * 3) / 4, 40)];
    self.definitionField.borderStyle = UITextBorderStyleRoundedRect;
    self.definitionField.placeholder = @"Definition";
    self.definitionField.delegate = self;
    [self addSubview:self.definitionField];
}

- (void)setUpSubmitButton {
    self.submitButton = [[UIButton alloc] initWithFrame:CGRectMake(self.frame.size.width / 4, 240, self.frame.size.width / 2, 40)];
    self.submitButton.layer.cornerRadius = 6.0;
    [self.submitButton setTitle:@"Submit" forState:UIControlStateNormal];
    self.submitButton.backgroundColor = [RMDConstants contrastColor];
    [self.submitButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.submitButton addTarget:self.cardAdderVC action:@selector(addCard) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.submitButton];
}

-(void)dismissKeyboard {
    [self.wordField resignFirstResponder];
    [self.definitionField resignFirstResponder];
}

@end
