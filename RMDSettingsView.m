//
//  RMDSettingsView.m
//  Flash Cards
//
//  Created by Rachel Dorn on 6/23/16.
//  Copyright © 2016 Rachel Dorn. All rights reserved.
//

#import "RMDSettingsView.h"

@implementation RMDSettingsView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self setUpChangeSetButton];
        [self setUpLogOutButton];
    }
    return self;
}

- (void)setUpChangeSetButton {
    self.changeSetButton = [[UIButton alloc] initWithFrame:CGRectMake(self.frame.size.width / 4, 220, self.frame.size.width / 2, 40)];
    self.changeSetButton.backgroundColor = [UIColor colorWithRed:1.0 green:0.2 blue:0.6 alpha:1.0];
    self.changeSetButton.layer.cornerRadius = 8;
    [self.changeSetButton setTitle:@"Change Card Set" forState:UIControlStateNormal];
    [self.changeSetButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.changeSetButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
//    [self.changeSetButton addTarget:self.delegate action:@selector(signInUser) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.changeSetButton];
}

- (void)setUpLogOutButton {
    self.logOutButton = [[UIButton alloc] initWithFrame:CGRectMake(self.frame.size.width / 4, 370, self.frame.size.width / 2, 40)];
    self.logOutButton.backgroundColor = [UIColor colorWithRed:1.0 green:0.2 blue:0.6 alpha:1.0];
    self.logOutButton.layer.cornerRadius = 8;
    [self.logOutButton setTitle:@"Log Out" forState:UIControlStateNormal];
    [self.logOutButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.logOutButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
//    [self.logOutButton addTarget:self.delegate action:@selector(registerUser) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.logOutButton];
}

@end