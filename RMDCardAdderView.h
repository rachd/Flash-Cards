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
@property (nonatomic, strong) UITextField *wordField;
@property (nonatomic, strong) UITextField *definitionField;

- (instancetype)initWithFrame:(CGRect)frame viewController:(UIViewController *)cardAdderVC;

@end
