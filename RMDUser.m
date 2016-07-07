//
//  RMDUser.m
//  Flash Cards
//
//  Created by Rachel Dorn on 6/23/16.
//  Copyright © 2016 Rachel Dorn. All rights reserved.
//

#import "RMDUser.h"
#import "RMDCard.h"

@interface RMDUser ()

@property (nonatomic, strong) NSMutableArray *categories;

@end

@implementation RMDUser

+ (RMDUser *)currentUser {
    static RMDUser *currentUser;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        currentUser = [[self alloc] initPrivate];
    });
//    RMDUser *user = [NSKeyedUnarchiver unarchiveObjectWithData:[[NSUserDefaults standardUserDefaults] objectForKey:@"user"]];
    return currentUser;
}

- (instancetype)initPrivate {
    self = [super init];
    if (self) {
        _categories = [[NSMutableArray alloc] init];
//        _categories = [[NSMutableDictionary alloc] initWithObjectsAndKeys:@{@"Mi": @"I", @"Vi" : @"You", @"Hundo" : @"Dog", @"Patro" : @"Father", @"Babili" : @"Chat", @"Folio" : @"Leaf", @"Kuiri" : @"Cook"}, @"Esperanto", @{@"Hola" : @"Hello"}, @"Spanish", nil];
    }
    return self;
}

#pragma mark - Authentication Methods

+ (void)login:(NSArray *)categories success:(void (^)(void))success {
    RMDUser *user = [[RMDUser alloc] init];
    NSData *encodedUserObject = [NSKeyedArchiver archivedDataWithRootObject:user];
    
    user.categories = [NSMutableArray arrayWithArray:categories];
    [[NSUserDefaults standardUserDefaults] setObject:encodedUserObject forKey:@"user"];
    success();
}

- (void)logout {
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"user"];
}

#pragma mark - Data Methods

- (void)addCategory:(NSString *)name {
    RMDCategory *category = [[RMDCategory alloc] initWithName:name];
    [self.categories addObject:category];
    self.currentCategory = category;
}

- (void)deleteCategory:(RMDCategory *)category {
    [self.categories removeObject:category];
}

- (NSArray *)getCategories {
    return [self.categories copy];
}

#pragma mark - Encoding Methods

- (id)initWithCoder:(NSCoder *)decoder {
    if ((self = [super init])) {
        self.categories = [decoder decodeObjectForKey:@"categories"];
        self.currentCategory = [decoder decodeObjectForKey:@"currentCategory"];
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:self.categories forKey:@"categories"];
    [encoder encodeObject:self.currentCategory forKey:@"currentCategory"];
}

- (id)copyWithZone:(NSZone *)zone {
    RMDUser *objectCopy = [[RMDUser allocWithZone:zone] init];
    [objectCopy setCategories:self.categories];
    [objectCopy setCurrentCategory:self.currentCategory];
    return objectCopy;
}

@end
