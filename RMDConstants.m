//
//  RMDConstants.m
//  Flash Cards
//
//  Created by Rachel Dorn on 6/28/16.
//  Copyright © 2016 Rachel Dorn. All rights reserved.
//

#import "RMDConstants.h"

@implementation RMDConstants

+ (UIColor *)correctAnswerColor {
    return [UIColor colorWithRed:0.247 green:0.639 blue:0.039 alpha:1.0];
}

+ (UIColor *)wrongAnswerColor {
    return [UIColor colorWithRed:0.902 green:0.184 blue:0.128 alpha:1.0];
}

+ (UIColor *)backgroundColor {
    return [UIColor colorWithRed:0.682 green:0.863 blue:0.851 alpha:1.0];
}

+ (UIColor *)textColor {
    return [UIColor colorWithRed:0.02 green:0.02 blue:0.063 alpha:1.0];
}

+ (UIColor *)contrastColor {
    return [UIColor colorWithRed:0.071 green:0.369 blue:1.0 alpha:1.0];
}

@end
