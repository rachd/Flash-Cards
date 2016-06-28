//
//  RMDCategoryAdderView.h
//  Flash Cards
//
//  Created by Rachel Dorn on 6/28/16.
//  Copyright © 2016 Rachel Dorn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RMDCategoryAdderView : UIView

@property (nonatomic, weak)UIViewController *cardSetAdderVC;
@property (nonatomic, strong) UITextField *nameField;

- (instancetype)initWithFrame:(CGRect)frame viewController:(UIViewController *)cardAdderVC;

@end
