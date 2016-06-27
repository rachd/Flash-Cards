//
//  RMDCardAdderView.h
//  Flash Cards
//
//  Created by Rachel Dorn on 6/27/16.
//  Copyright © 2016 Rachel Dorn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RMDCardAdderView : UIView

@property (nonatomic, weak)UIViewController *cardAdderVC;
@property (nonatomic, strong) UITextField *keyField;
@property (nonatomic, strong) UITextField *valueField;

- (instancetype)initWithFrame:(CGRect)frame viewController:(UIViewController *)cardAdderVC;

@end
