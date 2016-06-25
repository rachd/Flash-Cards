//
//  RMDNewCardView.h
//  Flash Cards
//
//  Created by Rachel Dorn on 6/25/16.
//  Copyright © 2016 Rachel Dorn. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RMDNewCardView;

@protocol RMDNewCardDelegate <NSObject>

@required
- (void)setNewCard:(NSString *)keyValue object:(NSString *)objectValue;

@end

@interface RMDNewCardView : UIView

@property (nonatomic, weak) id <RMDNewCardDelegate> delegate;
@property (nonatomic, strong) UITextField *keyField;
@property (nonatomic, strong) UITextField *objectField;
@property (nonatomic, strong) UIButton *saveButton;

@end
