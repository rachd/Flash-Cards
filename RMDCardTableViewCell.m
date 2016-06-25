//
//  RMDCardTableViewCell.m
//  Flash Cards
//
//  Created by Rachel Dorn on 6/24/16.
//  Copyright © 2016 Rachel Dorn. All rights reserved.
//

#import "RMDCardTableViewCell.h"

@implementation RMDCardTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
    }
    
    return self;
}


- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGRect text = self.textLabel.frame;
    [self.textLabel setFrame:CGRectMake(text.origin.x, text.origin.y - 5, text.size.width, text.size.height)];
    
    CGRect dText = self.detailTextLabel.frame;
    [self.detailTextLabel setFrame:CGRectMake(dText.origin.x, dText.origin.y + 5, dText.size.width, dText.size.height)];
}

@end
