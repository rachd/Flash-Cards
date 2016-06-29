//
//  RMDCategory.h
//  Flash Cards
//
//  Created by Rachel Dorn on 6/29/16.
//  Copyright © 2016 Rachel Dorn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RMDCard.h"

@interface RMDCategory : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSMutableArray *cards;

- (instancetype)initWithName:(NSString *)name;
- (void)addCard:(RMDCard *)card;
- (void)deleteCard:(RMDCard *)card;
- (NSArray *)allWords;
- (NSArray *)allDefinitions;

@end
