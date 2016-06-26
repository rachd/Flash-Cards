//
//  RMDQuizCollectionViewCell.h
//  Flash Cards
//
//  Created by Rachel Dorn on 6/26/16.
//  Copyright © 2016 Rachel Dorn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RMDQuizCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) UILabel *label;

- (instancetype)initWithFrame:(CGRect)frame;

- (void)changeText:(NSString *)text;

@end
