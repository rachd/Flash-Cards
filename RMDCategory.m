//
//  RMDCategory.m
//  Flash Cards
//
//  Created by Rachel Dorn on 6/29/16.
//  Copyright © 2016 Rachel Dorn. All rights reserved.
//

#import "RMDCategory.h"

@interface RMDCategory ()

@property (nonatomic, strong) NSMutableArray *words;
@property (nonatomic, strong) NSMutableArray *definitions;

@end

@implementation RMDCategory

- (instancetype)initWithName:(NSString *)name {
    self = [super init];
    if (self) {
        self.cards = [[NSMutableArray alloc] init];
        self.name = name;
        self.words = [[NSMutableArray alloc] init];
        self.definitions = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)addCard:(RMDCard *)card {
    [self.cards addObject:card];
    [self.words addObject:card.word];
    [self.definitions addObject:card.definition];
}

- (void)deleteCard:(RMDCard *)card {
    [self.cards removeObject:card];
    [self.words removeObject:card.word];
    [self.definitions removeObject:card.definition];
}

- (NSArray *)allWords {
    return [self.words copy];
}

- (NSArray *)allDefinitions {
    return [self.definitions copy];
}

@end
