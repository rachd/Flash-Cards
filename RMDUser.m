//
//  RMDUser.m
//  Flash Cards
//
//  Created by Rachel Dorn on 6/23/16.
//  Copyright © 2016 Rachel Dorn. All rights reserved.
//

#import "RMDUser.h"

@interface RMDUser ()

@property (nonatomic, strong) NSMutableDictionary *categories;

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
        _categories = [[NSMutableDictionary alloc] initWithObjectsAndKeys:@{@"Mi": @"I", @"Vi" : @"You"}, @"Esperanto", @{@"Hola" : @"Hello"}, @"Spanish", nil];
    }
    return self;
}

#pragma mark - Authentication Methods

+ (void)login:(void (^)(void))success {
    RMDUser *user = [[RMDUser alloc] init];
    NSData *encodedUserObject = [NSKeyedArchiver archivedDataWithRootObject:user];
    
    [[NSUserDefaults standardUserDefaults] setObject:encodedUserObject forKey:@"user"];
}

- (void)logout {
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"user"];
}

#pragma mark - Data Methods

- (void)addCard:(NSString *)key value:(NSString *)value {
    NSMutableDictionary *temporaryDictionary = [NSMutableDictionary dictionaryWithDictionary:[self.categories objectForKey:self.currentCategory]];
    [temporaryDictionary setObject:value forKey:key];
    [self.categories setObject:temporaryDictionary forKey:self.currentCategory];
}

- (NSDictionary *)getCategories {
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
