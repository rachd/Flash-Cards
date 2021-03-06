//
//  RMDSignInView.h
//  Flash Cards
//
//  Created by Rachel Dorn on 6/11/16.
//  Copyright © 2016 Rachel Dorn. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol RMDSignInViewDelegate <NSObject>

@required
- (void)signInUser;
- (void)registerUser;

@end

@interface RMDSignInView : UIView <UITextFieldDelegate>

@property (nonatomic, weak) id <RMDSignInViewDelegate> delegate;
@property (nonatomic, strong) UITextField *emailField;
@property (nonatomic, strong) UITextField *passwordField;

@end
