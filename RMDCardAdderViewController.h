//
//  RMDCardAdderViewController.h
//  Flash Cards
//
//  Created by Rachel Dorn on 6/27/16.
//  Copyright © 2016 Rachel Dorn. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol RMDCardAdderDelegate <NSObject>

@required

- (void)setNewCard:(NSString *)keyValue object:(NSString *)objectValue;

@end

@interface RMDCardAdderViewController : UIViewController

@property (nonatomic, weak) id <RMDCardAdderDelegate> delegate;

@end
