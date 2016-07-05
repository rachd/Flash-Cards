//
//  RMDSettingsView.m
//  Flash Cards
//
//  Created by Rachel Dorn on 6/23/16.
//  Copyright © 2016 Rachel Dorn. All rights reserved.
//

#import "RMDSettingsView.h"
#import "RMDConstants.h"

@implementation RMDSettingsView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [RMDConstants backgroundColor];
        [self setUpChangeSetButton];
        [self setUpLogOutButton];
    }
    return self;
}

- (void)setUpChangeSetButton {
    self.changeSetButton = [[UIButton alloc] initWithFrame:CGRectMake(self.frame.size.width / 4, self.frame.size.height / 2 - 90, self.frame.size.width / 2, 40)];
    self.changeSetButton.backgroundColor = [UIColor whiteColor];
    self.changeSetButton.layer.cornerRadius = 8;
    [self.changeSetButton setTitle:@"Change Card Set" forState:UIControlStateNormal];
    [self.changeSetButton setTitleColor:[RMDConstants textColor] forState:UIControlStateNormal];
    [self.changeSetButton addTarget:self.delegate action:@selector(changeCategory) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.changeSetButton];
}

- (void)setUpLogOutButton {
    self.logOutButton = [[UIButton alloc] initWithFrame:CGRectMake(self.frame.size.width / 4, self.frame.size.height / 2 + 10, self.frame.size.width / 2, 40)];
    self.logOutButton.backgroundColor = [UIColor whiteColor];
    self.logOutButton.layer.cornerRadius = 8;
    [self.logOutButton setTitle:@"Log Out" forState:UIControlStateNormal];
    [self.logOutButton setTitleColor:[RMDConstants textColor] forState:UIControlStateNormal];
    [self.logOutButton addTarget:self.delegate action:@selector(logOutUser) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.logOutButton];
}

@end