//
//  RMDCard.h
//  Flash Cards
//
//  Created by Rachel Dorn on 6/29/16.
//  Copyright © 2016 Rachel Dorn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RMDCard : NSObject

@property (nonatomic, strong) NSString *word;
@property (nonatomic, strong) NSString *definition;

- (instancetype)initWithWord:(NSString *)word definition:(NSString *)definition;

@end
