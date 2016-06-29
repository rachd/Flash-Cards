//
//  RMDCard.m
//  Flash Cards
//
//  Created by Rachel Dorn on 6/29/16.
//  Copyright © 2016 Rachel Dorn. All rights reserved.
//

#import "RMDCard.h"

@implementation RMDCard

- (instancetype)initWithWord:(NSString *)word definition:(NSString *)definition {
    self = [super init];
    if (self) {
        self.word = word;
        self.definition = definition;
    }
    return self;
}

@end
