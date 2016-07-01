//
//  RMDCategoryAdderViewController.h
//  Flash Cards
//
//  Created by Rachel Dorn on 6/28/16.
//  Copyright © 2016 Rachel Dorn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RMDCategory.h"

@protocol RMDCardSetAdderDelegate <NSObject>

@required

- (void)setNewCategory:(NSString *)name;

@end

@interface RMDCategoryAdderViewController : UIViewController

@property (nonatomic, weak) RMDCategory *category;
@property (nonatomic, weak) id <RMDCardSetAdderDelegate> delegate;

@end
