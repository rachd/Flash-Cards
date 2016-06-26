//
//  RMDQuizCollectionViewCell.m
//  Flash Cards
//
//  Created by Rachel Dorn on 6/26/16.
//  Copyright © 2016 Rachel Dorn. All rights reserved.
//

#import "RMDQuizCollectionViewCell.h"

@implementation RMDQuizCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        self.label = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, self.bounds.size.width - 20, self.bounds.size.height - 20)];
        self.label.textColor = [UIColor whiteColor];
        self.label.textAlignment = NSTextAlignmentCenter;
        self.label.numberOfLines = 0;
        self.label.lineBreakMode = NSLineBreakByWordWrapping;
        [self.contentView addSubview:self.label];
    }
    return self;
}

- (void)changeText:(NSString *)text {
    self.label.text = text;
}

@end
