//
//  RMDNewCardView.m
//  Flash Cards
//
//  Created by Rachel Dorn on 6/25/16.
//  Copyright © 2016 Rachel Dorn. All rights reserved.
//

#import "RMDNewCardView.h"
#import "RMDUser.h"

@implementation RMDNewCardView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self setUpKeyField];
        [self setUpObjectField];
        [self setUpSaveButton];
    }
    return self;
}

- (void)setUpKeyField {
    self.keyField = [[UITextField alloc] initWithFrame:CGRectMake(self.frame.size.width / 4, 100, self.frame.size.width / 2, 40)];
    self.keyField.placeholder = @"Word in English";
    self.keyField.borderStyle = UITextBorderStyleRoundedRect;
    [self addSubview:self.keyField];
}

- (void)setUpObjectField {
    self.objectField = [[UITextField alloc] initWithFrame:CGRectMake(self.frame.size.width / 4, 160, self.frame.size.width / 2, 40)];
    self.objectField.placeholder = [NSString stringWithFormat:@"Word in %@", [[RMDUser currentUser] currentCategory]];
    self.objectField.borderStyle = UITextBorderStyleRoundedRect;
    [self addSubview:self.objectField];
}

- (void)setUpSaveButton {
    self.saveButton = [[UIButton alloc] initWithFrame:CGRectMake(self.frame.size.width / 4, 200, self.frame.size.width / 2, 40)];
    [self.saveButton setTitle:@"Save New Card" forState:UIControlStateNormal];
    self.saveButton.backgroundColor = [UIColor greenColor];
    [self.saveButton addTarget:self action:@selector(sendCardInfo) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.saveButton];
}

- (void)sendCardInfo {
    [self.delegate setNewCard:self.keyField.text object:self.objectField.text];
    [self removeFromSuperview];
}

@end
