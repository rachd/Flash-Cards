//
//  RMDSettingsView.h
//  Flash Cards
//
//  Created by Rachel Dorn on 6/23/16.
//  Copyright © 2016 Rachel Dorn. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol RMDSettingsViewDelegate <NSObject>

@required
- (void)changeCategory;
- (void)logOutUser;

@end

@interface RMDSettingsView : UIView

@property (nonatomic, strong) UIButton *changeSetButton;
@property (nonatomic, strong) UIButton *logOutButton;
@property (nonatomic, weak) id <RMDSettingsViewDelegate> delegate;

@end
